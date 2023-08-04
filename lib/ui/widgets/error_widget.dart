import 'package:flutter/material.dart';
import 'package:user_app/res/color_const.dart';
import 'package:user_app/ui/utils/texts/label_text.dart';

class ShowErrorWidget extends StatelessWidget {
  const ShowErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LabelText(
        text: "Something went wrong. Try again later",
        color: kPrimaryColor,
        size: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
