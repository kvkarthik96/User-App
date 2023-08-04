import 'package:flutter/material.dart';
import 'package:user_app/res/color_const.dart';
import 'package:user_app/res/route_const.dart';
import 'package:user_app/ui/utils/texts/label_text.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, routeUsersListScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.red]),
      ),
      child: const Center(
        child: LabelText(
            text: 'Welcome to User App',
            fontWeight: FontWeight.bold,
            size: 22,
            color: kWhiteColor),
      ),
    ));
  }
}
