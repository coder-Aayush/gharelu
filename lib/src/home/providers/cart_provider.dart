import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/core/extensions/list_extension.dart';
import 'package:gharelu/src/home/entities/cart_entities.dart';
import 'package:gharelu/src/home/models/product_model.dart';

class CartState extends StateNotifier<CartEntities> {
  CartState() : super(CartEntities.empty());

  void addToCart(ProductModel product) {
    final cart = state;
    state = state.copyWith(
      price: cart.price,
      products: [...cart.products, product.copyWith(quantity: 1)],
    );
    calculatePrice();
  }

  void calculatePrice() {
    final cart = state;
    int _price = 0;
    _price = state.products
        .map((e) => e.price * e.quantity)
        .reduce((value, element) => value + element);
    state = state.copyWith(
      products: cart.products,
      price: _price,
      subTotal: _price + 50,
    );
  }

  void removeFromCart(ProductModel product) {}

  void increment(ProductModel product) {
    final cart = state;
    final productIndex =
        state.products.indexWhere((element) => element.id == product.id);
    // increament
    var _product = [...cart.products];
    // remove
    // _product.removeWhere((element) => element.id == product.id);
    final updatedProduct = state.products[productIndex].copyWith(
      quantity: cart.products[productIndex].quantity + 1,
    );
    // _product.insert(productIndex, updatedProduct);
    state = state.copyWith(
      price: cart.price,
      products: _product.update(productIndex, updatedProduct),
    );
    calculatePrice();
  }

  void decrement(ProductModel product) {
    final cart = state;
    var _product = [...cart.products];
    if (product.quantity <= 1) {
      // state =
      _product.removeWhere((element) => element.id == product.id);
      state = state.copyWith(
        price: cart.price,
        products: _product,
      );
    } else {
      final productIndex =
          state.products.indexWhere((element) => element.id == product.id);
      final updatedProduct = state.products[productIndex].copyWith(
        quantity: cart.products[productIndex].quantity - 1,
      );
      state = state.copyWith(
        price: cart.price,
        products: _product.update(productIndex, updatedProduct),
      );
      calculatePrice();
    }
  }

  // void setMerchantId(String merchantId) {
  //   state = state.copyWith(merchantId: merchantId);
  // }
}

final cartStateProvider =
    StateNotifierProvider.autoDispose<CartState, CartEntities>(
        (ref) => CartState());
