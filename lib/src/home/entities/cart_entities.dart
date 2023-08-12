import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/home/models/booking_model.dart';
import 'package:gharelu/src/home/models/product_model.dart';

part 'cart_entities.freezed.dart';

@freezed
class CartEntities with _$CartEntities {
  const CartEntities._();
  const factory CartEntities({
    @Default([]) List<ProductModel> products,
    @Default(0) int price,
    @Default(0) int subTotal,
  }) = _CartEntities;

  factory CartEntities.empty() => const CartEntities(price: 0, products: []);

  int get totalPrice => products.isNotEmpty ? products.map((item) => item.quantity * item.price).reduce((value1, value2) => value1 + value2) : 0;

  List<BookingModel> booking({
    required String bookingDate,
    required String time,
    required String serviceId,
    required String userId,
    required String merchantId,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    List<BookingModel> bookings = [];
    for (var i = 0; i < products.length; i++) {
      bookings.add(BookingModel(
        createdAt: now,
        date: bookingDate,
        id: '',
        productId: products[i].id,
        productName: products[i].name,
        quantity: products[i].quantity,
        serviceId: serviceId,
        subTotal: subTotal,
        time: time,
        totalPrice: (totalPrice + 60),
        updatedAt: now,
        roomId: '',
        userId: userId,
        merchantId: merchantId,
        bookedDate: DateTime.parse(bookingDate).millisecondsSinceEpoch,
      ));
    }

    return bookings;
  }
}
