import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UsersLoadingWidget extends StatelessWidget {
  const UsersLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade400,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[200],
            ),
          ),
        );
      },
    );
  }
}
