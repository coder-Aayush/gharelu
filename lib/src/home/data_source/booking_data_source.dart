import 'package:cloud_firestore/cloud_firestore.dart';
***REMOVED***
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/core/collections/firebase_db_collection.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
import 'package:gharelu/src/core/enum/order_type.dart';
***REMOVED***
import 'package:gharelu/src/core/extensions/list_extension.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/home/data_source/service_data_source.dart';
import 'package:gharelu/src/home/models/booking_model.dart';
import 'package:gharelu/src/home/models/product_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class _BookingDataSource ***REMOVED***
  Future<Either<AppError, List<BookingModel>>> getBookingOnDate(
      ***REMOVED***required String date, required String serviceId***REMOVED***);
  Future<Either<AppError, List<BookingModel>>> makeBooking(
      ***REMOVED***required List<BookingModel> booking***REMOVED***);

  Future<Either<AppError, List<BookingModel>>> getUserBookings();

  Future<Either<AppError, List<BookingModel>>> getMerchantBookings();
  Future<Either<AppError, bool>> updateBookings(
      ***REMOVED***required String bookingId, required OrderType orderType***REMOVED***);
***REMOVED***

class BookingDataSource implements _BookingDataSource ***REMOVED***
  BookingDataSource(this._ref, this._serviceRemoteSource);

  final ServiceRemoteSource _serviceRemoteSource;

  final Reader _ref;
***REMOVED***
  Future<Either<AppError, List<BookingModel>>> getBookingOnDate(
      ***REMOVED***required String date, required String serviceId***REMOVED***) async ***REMOVED***
***REMOVED***
      final response = await FirebaseDBCollection.bookings
          .where('date', isEqualTo: date)
          .where('service_id', isEqualTo: serviceId)
          .get();
      final data =
          response.docs.map((e) => BookingModel.fromJson(e.data())).toList();
      return right(data);
    ***REMOVED*** on FirebaseException catch (e) ***REMOVED***
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, List<BookingModel>>> makeBooking(
      ***REMOVED***required List<BookingModel> booking***REMOVED***) async ***REMOVED***
***REMOVED***
      final now = DateTime.now().millisecondsSinceEpoch;
      final user = FirebaseAuth.instance.currentUser;
      final id = FirebaseDBCollection.bookings.doc().id;
      String? mercnahtId;
      for (var item in booking) ***REMOVED***
        final products = (await _ref(firestoreProvider)
                .collection(AppConstant.products)
                .where('id', isEqualTo: item.productId)
                .get())
            .docs;
        if (products.isNotEmpty) ***REMOVED***
          mercnahtId = ProductModel.fromJson(products.first.data()).merchantId;
          item.copyWith(merchantId: mercnahtId);
        ***REMOVED***
        await FirebaseDBCollection.bookings.doc(id).set(item
            .copyWith(
                id: id,
                createdAt: now,
                updatedAt: now,
                userId: user?.uid ?? '',
                merchantId: mercnahtId ?? '')
            .toJson());
      ***REMOVED***
      final response = await FirebaseDBCollection.bookings
          .where('user_id', isEqualTo: user?.uid)
          .get();
      final data =
          response.docs.map((e) => BookingModel.fromJson(e.data())).toList();
      return right(data);
    ***REMOVED*** on FirebaseException catch (e) ***REMOVED***
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, List<BookingModel>>> getUserBookings() async ***REMOVED***
***REMOVED***
      final userId = _ref(firebaseAuthProvider).currentUser?.uid;
      final response = await FirebaseDBCollection.bookings
          .where('user_id', isEqualTo: userId)
          .orderBy('booked_date', descending: false)
          .get();
      List<BookingModel> bookings = [];
      for (var item in response.docs) ***REMOVED***
        final _item = BookingModel.fromJson(item.data());
        final product =
            (await _serviceRemoteSource.getProducts(productId: _item.productId))
                .fold((l) => null, (r) => r);
        bookings.add(_item.copyWith(product: product?.first));
      ***REMOVED***
      return right(bookings);
    ***REMOVED*** on FirebaseException catch (e) ***REMOVED***
      return left(AppError.serverError(message: e.message ?? 'Unknown Error'));
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, List<BookingModel>>> getMerchantBookings() async ***REMOVED***
***REMOVED***
      final userId = _ref(firebaseAuthProvider).currentUser?.uid;
      final response = await FirebaseDBCollection.bookings
          .where('merchant_id', isEqualTo: userId)
          .orderBy('date', descending: false)
          .get();

      final bookings = List<BookingModel>.from(
        response.docs.map(
          (e) => BookingModel.fromJson(e.data()),
        ),
      );

      for (var booking in bookings) ***REMOVED***
        final index = bookings.indexOf(booking);
        final productResponse = await _ref(firestoreProvider)
            .collection(AppConstant.products)
            .doc(booking.productId)
            .get();
        final userResponse = await _ref(firestoreProvider)
            .collection(AppConstant.users)
            .doc(booking.userId)
            .get();
        final merchantResponse = await _ref(firestoreProvider)
            .collection(AppConstant.merchants)
            .doc(booking.merchantId)
            .get();
        if (productResponse.data() != null) ***REMOVED***
          final _data = ProductModel.fromJson(productResponse.data()!);
          final _booking = bookings[index].copyWith(product: _data);
          bookings.update(index, _booking);
        ***REMOVED***
        if (userResponse.data() != null) ***REMOVED***
          final _data = CustomUserModel.fromJson(userResponse.data()!);
          final _booking = bookings[index].copyWith(user: _data);
          bookings.update(index, _booking);
        ***REMOVED***
        if (merchantResponse.data() != null) ***REMOVED***
          final _data = CustomUserModel.fromJson(merchantResponse.data()!);
          final _booking = bookings[index].copyWith(merchantUser: _data);
          bookings.update(index, _booking);
        ***REMOVED***
      ***REMOVED***
      return right(bookings);
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(
        AppError.serverError(
          message: e.message ?? 'Unknown Error occured while Fetching Bookings',
        ),
      );
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, bool>> updateBookings(
      ***REMOVED***required String bookingId, required OrderType orderType***REMOVED***) async ***REMOVED***
***REMOVED***
      await FirebaseDBCollection.bookings.doc(bookingId).update(***REMOVED***
        'order_type': orderType.name,
    ***REMOVED***
      return right(true);
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
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
    ref.read,
    ref.read(serviceRemoteSourceProvider),
  ),
);
