import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:user_app/data/model/user_model.dart';
import 'package:user_app/data/remote/service.dart';
import 'package:user_app/ui/utils/helper_util.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersLoadingState()) {
    Service service = Service();

    on<GetUsersListEvent>((event, emit) async {
      bool isNetworkConnected = true;
      UserModel response = UserModel();
      List<UserData> prevData = event.prevUserData;
      bool saving = true;
      bool isEndPage = false;

      getUsersList() async {
        await HelperUtil.checkInternetConnection().then((internet) async {
          if (internet) {
            isNetworkConnected = true;
            await service
                .getUsersListAPI(pageNumber: event.page)
                .then((respObj) {
              response = respObj;

              if (response.userData != null && response.userData!.isNotEmpty) {
                isEndPage = false;
              } else {
                isEndPage = true;
              }

              if (response.userData != null && response.userData!.isNotEmpty) {
                if (prevData.isNotEmpty) {
                  prevData.addAll(response.userData!);
                  response.userData = prevData;
                }
              } else {
                response.userData = prevData;
              }
              saving = false;
            });
          } else {
            isNetworkConnected = false;
          }
        });
      }

      emit(event.page == 1 ? UsersLoadingState() : UsersInitialState());

      await getUsersList();

      emit(UsersLoadedState(
          response: response,
          page: event.page,
          isEndPage: isEndPage,
          saving: saving,
          isNetworkConnected: isNetworkConnected));
    });
  }
}
