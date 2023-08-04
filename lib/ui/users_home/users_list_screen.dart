import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:user_app/bloc/users/users_bloc.dart';
import 'package:user_app/data/model/user_model.dart';
import 'package:user_app/res/color_const.dart';
import 'package:user_app/res/image_const.dart';
import 'package:user_app/res/route_const.dart';
import 'package:user_app/ui/utils/texts/label_text.dart';
import 'package:user_app/ui/widgets/app_exit_alert.dart';
import 'package:user_app/ui/widgets/app_widgets.dart';

import '../widgets/error_widget.dart';
import '../widgets/users_loading_widget.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  UsersBloc usersBloc = UsersBloc();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

    usersBloc.add(GetUsersListEvent(page: 1, prevUserData: const []));
  }

  @override
  void dispose() {
    usersBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      bloc: usersBloc,
      buildWhen: (prevState, state) {
        if (state is UsersInitialState) {
          return false;
        }

        return true;
      },
      builder: (context, state) {
        if (state is UsersLoadingState) {
          return WillPopScope(
            onWillPop: () async {
              showAppExitAlert(context);
              return false;
            },
            child: Scaffold(
              appBar: AppWidgets.appBarWidget(
                  isBackButton: false, title: '', onPressed: () {}),
              body: const UsersLoadingWidget(),
            ),
          );
        } else if (state is UsersLoadedState) {
          return WillPopScope(
            onWillPop: () async {
              showAppExitAlert(context);
              return false;
            },
            child: Scaffold(
              appBar: AppWidgets.appBarWidget(
                  isBackButton: false, title: '', onPressed: () {}),
              body: state.response.userData == null ||
                      state.response.userData!.isEmpty
                  ? const Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          LabelText(
                              text: 'No Data Found',
                              color: kBlackColor,
                              size: 18,
                              fontWeight: FontWeight.w500)
                        ]))
                  : NotificationListener<ScrollEndNotification>(
                      onNotification: (ScrollNotification scrollState) {
                        FocusScope.of(context).unfocus();

                        if (!state.saving &&
                            scrollState.metrics.pixels ==
                                scrollState.metrics.maxScrollExtent &&
                            !state.isEndPage) {
                          if (state.response.userData != null) {
                            state.saving = true;

                            usersBloc.add(GetUsersListEvent(
                              page: state.page + 1,
                              prevUserData: state.response.userData!,
                            ));
                          }
                        }
                        return false;
                      },
                      child: SmartRefresher(
                          controller: _refreshController,
                          enablePullDown: true,
                          enablePullUp: !state.isEndPage,
                          onRefresh: () {
                            usersBloc.add(GetUsersListEvent(
                              page: 1,
                              prevUserData: const [],
                            ));
                          },
                          child: ListView.separated(
                              physics: const ClampingScrollPhysics(),
                              itemCount: state.response.userData?.length ?? 0,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    thickness: 1.2,
                                  ),
                              itemBuilder: (BuildContext context, int index) {
                                UserData userData =
                                    state.response.userData![index];
                                return Padding(
                                    padding: EdgeInsets.only(
                                        top: 8,
                                        bottom: state.isEndPage &&
                                                state.response.userData!
                                                            .length -
                                                        1 ==
                                                    index
                                            ? 60.h
                                            : 8),
                                    child: ListTile(
                                      onTap: () {
                                        Map<String, dynamic> data = {
                                          'userId': userData.id
                                        };
                                        Navigator.pushNamed(
                                            context, routeUsersDetailsScreen,
                                            arguments: data);
                                      },
                                      leading: SizedBox(
                                          height: 50.h,
                                          width: 50.h,
                                          child: CachedNetworkImage(
                                              imageUrl: '${userData.avatar}',
                                              imageBuilder: (context, imageProvider) => Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover))),
                                              errorWidget: (context, url, _) => Container(
                                                  decoration: const BoxDecoration(
                                                      shape: BoxShape.circle),
                                                  child: Image.asset(
                                                      ImageConst.profileImage)),
                                              placeholder: (context, url) => Container(
                                                  decoration: const BoxDecoration(
                                                      shape: BoxShape.circle),
                                                  child: Image.asset(ImageConst.profileImage)))),
                                      title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            LabelText(
                                              text:
                                                  '${userData.firstName} ${userData.lastName}',
                                              color: kBlackColor,
                                              size: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            const SizedBox(height: 6),
                                            LabelText(
                                                text: '${userData.email}',
                                                color: kTertiaryColor,
                                                size: 15,
                                                fontWeight: FontWeight.w500)
                                          ]),
                                    ));
                              }))),
            ),
          );
        } else {
          return WillPopScope(
            onWillPop: () async {
              showAppExitAlert(context);
              return false;
            },
            child: Scaffold(
              appBar: AppWidgets.appBarWidget(
                  isBackButton: false, title: '', onPressed: () {}),
              body: const ShowErrorWidget(),
            ),
          );
        }
      },
    );
  }
}
