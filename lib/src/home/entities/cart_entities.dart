import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/home/models/product_model.dart';

part 'cart_entities.freezed.dart';

@freezed
class CartEntities with _$CartEntities ***REMOVED***
  const CartEntities._();
  const factory CartEntities(***REMOVED***
    @Default([]) List<ProductModel> products,
    @Default(0) int price,
  ***REMOVED***) = _CartEntities;

  factory CartEntities.empty() => const CartEntities(price: 0, products: []);

  int get totalPrice => products.isNotEmpty
      ? products
          .map((item) => item.quantity * item.price)
          .reduce((value1, value2) => value1 + value2)
      : 0;
***REMOVED***
