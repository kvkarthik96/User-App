import 'package:flutter/material.dart';
import 'package:user_app/ui/utils/texts/label_text.dart';

class TextButtonWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Widget? prefixWidget;
  final Color? color;
  const TextButtonWidget(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.color,
      this.prefixWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LabelText(
            text: title,
            color: color,
            size: 14,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
