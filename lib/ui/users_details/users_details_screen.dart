import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_app/bloc/details/details_bloc.dart';
import 'package:user_app/res/color_const.dart';
import 'package:user_app/res/image_const.dart';
import 'package:user_app/ui/utils/texts/label_text.dart';
import 'package:user_app/ui/widgets/app_widgets.dart';
import 'package:user_app/ui/widgets/details_screen_loading_widget.dart';
import 'package:user_app/ui/widgets/error_widget.dart';

class UsersDetailsScreen extends StatefulWidget {
  final int userId;

  const UsersDetailsScreen({super.key, required this.userId});

  @override
  State<UsersDetailsScreen> createState() => _UsersDetailsScreenState();
}

class _UsersDetailsScreenState extends State<UsersDetailsScreen> {
  DetailsBloc detailsBloc = DetailsBloc();

  @override
  void initState() {
    detailsBloc.add(GetUserDetailsEvent(userId: widget.userId));
    super.initState();
  }

  @override
  void dispose() {
    detailsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      bloc: detailsBloc,
      buildWhen: (prevState, state) {
        if (state is DetailsInitialState) {
          return false;
        }

        return true;
      },
      builder: (context, state) {
        if (state is DetailsLoadingState) {
          return Scaffold(
            appBar: AppWidgets.appBarWidget(
                isBackButton: true,
                title: 'Details Screen',
                onPressed: () {
                  Navigator.pop(context);
                }),
            body: const DetailsLoadingWidget(),
          );
        } else if (state is DetailsLoadedState) {
          return Scaffold(
            appBar: AppWidgets.appBarWidget(
                isBackButton: true,
                title: 'Details Screen',
                onPressed: () {
                  Navigator.pop(context);
                }),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              width: 1.sw,
              child: Column(
                children: [
                  AppWidgets.getDefaultSizedBox(),
                  SizedBox(
                      height: 100.h,
                      width: 100.h,
                      child: CachedNetworkImage(
                          imageUrl: '${state.response.userData?.avatar}',
                          imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover))),
                          errorWidget: (context, url, _) => Container(
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(ImageConst.profileImage)),
                          placeholder: (context, url) => Container(
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(ImageConst.profileImage)))),
                  AppWidgets.getDefaultSizedBox(),
                  LabelText(
                    text:
                        '${state.response.userData?.firstName} ${state.response.userData?.lastName}',
                    size: 16,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  AppWidgets.getDefaultSizedBox(),
                  LabelText(
                      text: '${state.response.userData?.email}',
                      size: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500),
                  AppWidgets.getDefaultSizedBox(),
                  AppWidgets.separator(),
                  AppWidgets.getDefaultSizedBox(),
                  LabelText(
                      text: '${state.response.support?.text}',
                      size: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  AppWidgets.getDefaultSizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: LabelText(
                        text: 'Click below link for more info:',
                        size: 14,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                  AppWidgets.getDefaultSizedBox(height: 6),
                  GestureDetector(
                    onTap: () async {
                      String url = state.response.support?.url ?? '';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        throw 'Couldn\'t launch $url';
                      }
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: LabelText(
                          text: '${state.response.support?.url}',
                          size: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppWidgets.appBarWidget(
                isBackButton: true,
                title: 'Details Screen',
                onPressed: () {
                  Navigator.pop(context);
                }),
            body: const ShowErrorWidget(),
          );
        }
      },
    );
  }
}
