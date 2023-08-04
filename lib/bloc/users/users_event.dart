part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class GetUsersListEvent extends UsersEvent {
  final int page;
  final List<UserData> prevUserData;

  GetUsersListEvent({required this.page, required this.prevUserData});
}
