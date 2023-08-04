part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent {}

class GetUserDetailsEvent extends DetailsEvent {
  final int userId;

  GetUserDetailsEvent({required this.userId});
}
