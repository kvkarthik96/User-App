import 'package:flutter/material.dart';
import 'package:user_app/res/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/ui/utils/texts/label_text.dart';

class AppWidgets {
  static appBarWidget(
      {required String title,
      required Function() onPressed,
      isBackButton = true,
      List<Widget>? actions,
      bool isLeading = true}) {
    return AppBar(
      elevation: 0,
      backgroundColor: kWhiteColor,
      centerTitle: false,
      title: Row(children: [
        LabelText(
            text: title,
            color: kBlackColor,
            size: 17,
            fontWeight: FontWeight.w700)
      ]),
      leading: isLeading
          ? IconButton(
              onPressed: onPressed,
              icon: Icon(isBackButton ? Icons.arrow_back : Icons.menu),
              color: kBlackColor)
          : const SizedBox(height: 0, width: 0),
      leadingWidth: !isLeading ? 20.w : null,
      actions: actions,
    );
  }

  static getDefaultSizedBox({double height = 10}) {
    return SizedBox(height: height.h);
  }

  static separator() {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          const dashWidth = 3.0;

          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return const SizedBox(
                width: dashWidth,
                height: 2.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: kBlackColor),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
