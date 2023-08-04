part of 'details_bloc.dart';

@immutable
abstract class DetailsState {}

class DetailsInitialState extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsLoadedState extends DetailsState {
  final UserDetailsModel response;
  final bool isNetworkConnected;

  DetailsLoadedState(
      {required this.response, required this.isNetworkConnected});
}

class DetailsErrorState extends DetailsState {}
