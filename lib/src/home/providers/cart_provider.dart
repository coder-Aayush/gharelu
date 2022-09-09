***REMOVED***

***REMOVED***
import 'package:gharelu/src/core/extensions/list_extension.dart';
import 'package:gharelu/src/home/entities/cart_entities.dart';
import 'package:gharelu/src/home/models/product_model.dart';

class CartState extends StateNotifier<CartEntities> ***REMOVED***
  CartState() : super(CartEntities.empty());

  void addToCart(ProductModel product) ***REMOVED***
    final cart = state;
    state = state.copyWith(
      price: cart.price,
      products: [...cart.products, product.copyWith(quantity: 1)],
    );
    calculatePrice();
  ***REMOVED***

  void calculatePrice() ***REMOVED***
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
  ***REMOVED***

  void removeFromCart(ProductModel product) ***REMOVED******REMOVED***

  void increment(ProductModel product) ***REMOVED***
    final cart = state;
    final productIndex =
        state.products.indexWhere((element) => element.id == product.id);
    // increament
    var _product = [...cart.products];
    final updatedProduct = state.products[productIndex].copyWith(
      quantity: cart.products[productIndex].quantity + 1,
    );
    // _product.insert(productIndex, updatedProduct);
    state.copyWith(
      price: cart.price,
      products: _product,
    );
    log(state.toString());
  ***REMOVED***
***REMOVED***

final cartStateProvider =
    StateNotifierProvider.autoDispose<CartState, CartEntities>(
        (ref) => CartState());
