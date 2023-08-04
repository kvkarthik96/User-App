import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/res/color_const.dart';
import 'package:user_app/ui/utils/texts/label_text.dart';

showAppExitAlert(context, {bool isLogout = false}) {
  showGeneralDialog(
    barrierLabel: "Label",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 0),
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 330.w,
            height: 200.h,
            margin: EdgeInsets.only(
                left: 18, right: 18, bottom: 1.sh / 2 - (200.h / 2)),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: Container(
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: const Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ]),
                child: Material(
                    type: MaterialType.transparency,
                    child: Padding(
                        padding: EdgeInsets.only(left: 29.w, right: 12.w),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 24.h),
                                  child: const LabelText(
                                      text: "Exit",
                                      color: kBlackColor,
                                      size: 18,
                                      fontWeight: FontWeight.w600)),
                              Container(
                                  margin: EdgeInsets.only(top: 24.h),
                                  child: const LabelText(
                                      text: "Are you sure you want to exit?",
                                      maxLines: 2,
                                      color: kTertiaryColor,
                                      size: 18,
                                      fontWeight: FontWeight.normal)),
                              Container(
                                  margin: EdgeInsets.only(top: 20.h),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            exit(0);
                                          },
                                          child: const LabelText(
                                            text: 'I\'m sure',
                                            color: Colors.blue,
                                            size: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const LabelText(
                                            text: 'No',
                                            color: Colors.blue,
                                            size: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ]))
                            ])))),
          ));
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
  );
}
