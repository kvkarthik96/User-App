import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/ui/widgets/app_widgets.dart';

class DetailsLoadingWidget extends StatelessWidget {
  const DetailsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        width: 1.sw,
        child: Column(
          children: [
            AppWidgets.getDefaultSizedBox(),
            Container(
              height: 100.h,
              width: 100.h,
              decoration: BoxDecoration(
                  color: Colors.grey[400], shape: BoxShape.circle),
            ),
            AppWidgets.getDefaultSizedBox(),
            Container(
                height: 20.h,
                width: 150.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[400])),
            AppWidgets.getDefaultSizedBox(),
            Container(
                height: 20.h,
                width: 180.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[400])),
            AppWidgets.getDefaultSizedBox(),
            AppWidgets.separator(),
            AppWidgets.getDefaultSizedBox(),
            AppWidgets.getDefaultSizedBox(),
            Container(
                height: 60.h,
                width: 1.sw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[400])),
            AppWidgets.getDefaultSizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  height: 25.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[400])),
            ),
            AppWidgets.getDefaultSizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  height: 25.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[400])),
            )
          ],
        ),
      ),
    );
  }
}
