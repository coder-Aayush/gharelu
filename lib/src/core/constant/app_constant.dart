import 'package:gharelu/src/core/entity/cancellation_reason_entity.dart';

class AppConstant ***REMOVED***
  const AppConstant._();

  static const String user = 'user';
  static const String users = 'users';
  static const String merchant = 'merchant';
  static const String merchants = 'merchants';
  static const String banners = 'banners';
  static const String services = 'services';

  ***REMOVED***value `categories`
  static const String categories = 'categories';

  ***REMOVED***value `products`
  static const String products = 'products';

  static const List<CancellationReasonEntity> cancellationReason = [
    CancellationReasonEntity(
      title: 'Incorrect appointment',
      id: 1,
      description:
          'The appointment was scheduled for the wrong date, time, or location.',
    ),
    CancellationReasonEntity(
      title: 'Rescheduling',
      id: 2,
      description:
          'I needs to reschedule the appointment for a different date or time',
    ),
    CancellationReasonEntity(
      title: 'Conflict with owner',
      id: 3,
      description:
          'I has a conflict with the person or organization that they were scheduled to meet with.',
    ),
    CancellationReasonEntity(
      title: 'Other',
      id: 4,
      description:
          'There may be other reasons not listed here that are specific to the individual or the situation.',
    ),
  ];
***REMOVED***
***REMOVED***
***REMOVED***Incorrect appointment: The appointment was scheduled for the wrong date, time, or location.
// Rescheduling: The individual needs to reschedule the appointment for a different date or time.
// Change of mind: The individual no longer wants or needs the service or product that the appointment was for.
// Conflict with owner: The individual has a conflict with the person or organization that they were scheduled to meet with.
// Other: There may be other reasons not listed here that are specific to the individual or the situation.
