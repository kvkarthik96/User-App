import 'package:flutter/material.dart';
import 'package:user_app/res/route_const.dart';
import 'package:user_app/ui/launch_screen.dart';
import 'package:user_app/ui/users_details/users_details_screen.dart';
import 'package:user_app/ui/users_home/users_list_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic>? args;

    if (settings.arguments != null) {
      args = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {
      case routeDefault:
        return MaterialPageRoute(builder: (_) => const LaunchScreen());

      case routeUsersListScreen:
        return MaterialPageRoute(builder: (_) => const UsersListScreen());

      case routeUsersDetailsScreen:
        if (args != null) {
          return MaterialPageRoute(
              builder: (_) => UsersDetailsScreen(
                    userId: args!['userId'],
                  ));
        } else {
          return _errorRoute(settings.name);
        }

      default:
        return _errorRoute(settings.name);
    }

    // throw _errorRoute(settings.name);
  }

  static Route<dynamic> _errorRoute(pageName) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.error_outline),
              Text(
                errPageText + pageName.toString(),
                style: TextStyle(fontSize: 18.0),
              )
            ],
          ),
        ),
      );
    });
  }
}
