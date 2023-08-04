part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitialState extends UsersState {}

class UsersLoadingState extends UsersState {}

// ignore: must_be_immutable
class UsersLoadedState extends UsersState {
  final UserModel response;
  final bool isNetworkConnected;
  final int page;
  final bool isEndPage;
  bool saving;
  UsersLoadedState({
    required this.saving,
    required this.page,
    required this.response,
    required this.isEndPage,
    required this.isNetworkConnected,
  });
}
