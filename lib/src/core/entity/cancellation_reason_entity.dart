import 'package:equatable/equatable.dart';

class CancellationReasonEntity extends Equatable {
  const CancellationReasonEntity({required this.title, required this.id, required this.description});
  final String title;
  final int id;
  final String description;
  @override
  List<Object?> get props => [title, id];
}
