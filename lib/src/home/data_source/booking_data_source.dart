import 'package:cloud_firestore/cloud_firestore.dart';
***REMOVED***
import 'package:gharelu/src/core/collections/firebase_db_collection.dart';
***REMOVED***
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/home/models/booking_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class _BookingDataSource ***REMOVED***
  Future<Either<AppError, List<BookingModel>>> getBookingOnDate(
      ***REMOVED***required String date***REMOVED***);
  Future<Either<AppError, List<BookingModel>>> makeBooking(
      ***REMOVED***required BookingModel booking***REMOVED***);
***REMOVED***

class BookingDataSource implements _BookingDataSource ***REMOVED***
  BookingDataSource(this._ref);

  final Reader _ref;
***REMOVED***
  Future<Either<AppError, List<BookingModel>>> getBookingOnDate(
      ***REMOVED***required String date***REMOVED***) async ***REMOVED***
***REMOVED***
      final response = await FirebaseDBCollection.bookings
          .where('date', isEqualTo: date)
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
      ***REMOVED***required BookingModel booking***REMOVED***) async ***REMOVED***
***REMOVED***
      final user = _ref(firebaseAuthProvider).currentUser;
      final id = FirebaseDBCollection.bookings.doc().id;
      await FirebaseDBCollection.bookings
          .doc(id)
          .set(booking.copyWith(id: id).toJson());
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

final bookingDataSourceProvider = Provider<BookingDataSource>(
  (ref) => BookingDataSource(ref.read),
);
