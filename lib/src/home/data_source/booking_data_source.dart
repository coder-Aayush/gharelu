import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/chat/data_source/chat_data_source.dart';
import 'package:gharelu/src/chat/models/room_model.dart';
import 'package:gharelu/src/core/collections/firebase_db_collection.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
import 'package:gharelu/src/core/enum/order_type.dart';
import 'package:gharelu/src/core/errors/app_error.dart';
import 'package:gharelu/src/core/extensions/list_extension.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/home/data_source/service_data_source.dart';
import 'package:gharelu/src/home/models/booking_model.dart';
import 'package:gharelu/src/home/models/product_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class _BookingDataSource {
  Future<Either<AppError, List<BookingModel>>> getBookingOnDate({required String date, required String serviceId***REMOVED***
  Future<Either<AppError, List<BookingModel>>> makeBooking({required List<BookingModel> booking***REMOVED***

  Future<Either<AppError, List<BookingModel>>> getUserBookings();

  Future<Either<AppError, List<BookingModel>>> getMerchantBookings();
  Future<Either<AppError, bool>> updateBookings({required String bookingId, required OrderType orderType***REMOVED***
***REMOVED***

class BookingDataSource implements _BookingDataSource {
  BookingDataSource(this._ref, this._serviceRemoteSource, this._chatRemoteSource);

  final ServiceRemoteSource _serviceRemoteSource;
  final ChatRemoteSource _chatRemoteSource;

  final Ref _ref;
  @override
  Future<Either<AppError, List<BookingModel>>> getBookingOnDate({required String date, required String serviceId***REMOVED***) async {
    try {
      final response = await FirebaseDBCollection.bookings.where('date', isEqualTo: date).where('service_id', isEqualTo: serviceId).get();
      final data = response.docs.map((e) => BookingModel.fromJson(e.data())).toList();
      return right(data);
    ***REMOVED*** on FirebaseException catch (e) {
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***

  @override
  Future<Either<AppError, List<BookingModel>>> makeBooking({required List<BookingModel> booking***REMOVED***) async {
    try {
      final now = DateTime.now().millisecondsSinceEpoch;
      final user = FirebaseAuth.instance.currentUser;
      final id = FirebaseDBCollection.bookings.doc().id;
      String? mercnahtId;
      for (var item in booking) {
        final products = (await _ref.read(firestoreProvider).collection(AppConstant.products).where('id', isEqualTo: item.productId).get()).docs;
        if (products.isNotEmpty) {
          mercnahtId = ProductModel.fromJson(products.first.data()).merchantId;
          item.copyWith(merchantId: mercnahtId);
        ***REMOVED***
        final roomId = (await _chatRemoteSource.createChatRoom(room: RoomModel(id: '', userId: user!.uid, merchantId: mercnahtId!, productId: item.productId))).fold((l) => null, (r) => r);
        await FirebaseDBCollection.bookings.doc(id).set(
              item
                  .copyWith(
                    id: id,
                    createdAt: now,
                    updatedAt: now,
                    userId: user.uid,
                    merchantId: mercnahtId,
                    roomId: roomId!,
                  )
                  .toJson(),
            );
      ***REMOVED***
      final response = await FirebaseDBCollection.bookings.where('user_id', isEqualTo: user?.uid).get();
      final data = response.docs.map((e) => BookingModel.fromJson(e.data())).toList();
      return right(data);
    ***REMOVED*** on FirebaseException catch (e) {
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***

  @override
  Future<Either<AppError, List<BookingModel>>> getUserBookings() async {
    try {
      final userId = _ref.read(firebaseAuthProvider).currentUser?.uid;
      final response = await FirebaseDBCollection.bookings.where('user_id', isEqualTo: userId).orderBy('booked_date', descending: false).get();
      List<BookingModel> bookings = [];
      for (var item in response.docs) {
        final _item = BookingModel.fromJson(item.data());
        final product = (await _serviceRemoteSource.getProducts(productId: _item.productId)).fold((l) => null, (r) => r);
        bookings.add(_item.copyWith(product: product?.first));
      ***REMOVED***
      return right(bookings);
    ***REMOVED*** on FirebaseException catch (e) {
      return left(AppError.serverError(message: e.message ?? 'Unknown Error'));
    ***REMOVED***
  ***REMOVED***

  @override
  Future<Either<AppError, List<BookingModel>>> getMerchantBookings() async {
    try {
      final userId = _ref.read(firebaseAuthProvider).currentUser?.uid;
      final response = await FirebaseDBCollection.bookings.where('merchant_id', isEqualTo: userId).orderBy('date', descending: false).get();

      final bookings = List<BookingModel>.from(
        response.docs.map(
          (e) => BookingModel.fromJson(e.data()),
        ),
      );

      for (var booking in bookings) {
        final index = bookings.indexOf(booking);
        final productResponse = await _ref.read(firestoreProvider).collection(AppConstant.products).doc(booking.productId).get();
        final userResponse = await _ref.read(firestoreProvider).collection(AppConstant.users).doc(booking.userId).get();
        final merchantResponse = await _ref.read(firestoreProvider).collection(AppConstant.merchants).doc(booking.merchantId).get();
        if (productResponse.data() != null) {
          final _data = ProductModel.fromJson(productResponse.data()!);
          final _booking = bookings[index].copyWith(product: _data);
          bookings.update(index, _booking);
        ***REMOVED***
        if (userResponse.data() != null) {
          final _data = CustomUserModel.fromJson(userResponse.data()!);
          final _booking = bookings[index].copyWith(user: _data);
          bookings.update(index, _booking);
        ***REMOVED***
        if (merchantResponse.data() != null) {
          final _data = CustomUserModel.fromJson(merchantResponse.data()!);
          final _booking = bookings[index].copyWith(merchantUser: _data);
          bookings.update(index, _booking);
        ***REMOVED***
      ***REMOVED***
      return right(bookings);
    ***REMOVED*** on FirebaseAuthException catch (e) {
      return left(
        AppError.serverError(
          message: e.message ?? 'Unknown Error occured while Fetching Bookings',
        ),
      );
    ***REMOVED***
  ***REMOVED***

  @override
  Future<Either<AppError, bool>> updateBookings({required String bookingId, required OrderType orderType***REMOVED***) async {
    try {
      await FirebaseDBCollection.bookings.doc(bookingId).update({
        'order_type': orderType.name,
      ***REMOVED***
      return right(true);
    ***REMOVED*** on FirebaseAuthException catch (e) {
      return left(
        AppError.serverError(
          message: e.message ?? 'Unknown Error occured while Updating Bookings',
        ),
      );
    ***REMOVED***
  ***REMOVED***
***REMOVED***

final bookingDataSourceProvider = Provider<BookingDataSource>(
  (ref) => BookingDataSource(
    ref,
    ref.read(serviceRemoteSourceProvider),
    ref.read(chatRemoteSourceProvider),
  ),
);
