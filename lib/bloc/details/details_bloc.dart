import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/data/model/user_details_model.dart';
import 'package:user_app/data/remote/service.dart';
import 'package:user_app/ui/utils/helper_util.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsLoadingState()) {
    Service service = Service();

    on<GetUserDetailsEvent>((event, emit) async {
      bool isNetworkConnected = true;
      UserDetailsModel response = UserDetailsModel();

      getUserDeatils() async {
        await HelperUtil.checkInternetConnection().then((internet) async {
          if (internet) {
            isNetworkConnected = true;
            await service
                .getUserDetailsAPI(userId: event.userId)
                .then((respObj) {
              response = respObj;
            });
          } else {
            isNetworkConnected = false;
          }
        });
      }

      emit(DetailsLoadingState());
      await getUserDeatils();
      emit(DetailsLoadedState(
          response: response, isNetworkConnected: isNetworkConnected));
    });
  }
}
