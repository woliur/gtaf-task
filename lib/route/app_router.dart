import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gtaf_assignment/features/presentation/commit_list/screen/screen_commit_list.dart';
import 'package:gtaf_assignment/features/presentation/user_profile/screen/screen_user_profile.dart';
import 'package:gtaf_assignment/route/route_paths.dart';

import '../features/presentation/landing/screen/landing_screen.dart';


class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    Widget widget;

    switch (settings.name) {
      case RoutePaths.commit:
        widget = const ScreenCommitList();
        break;
      case RoutePaths.user:
        widget = const ScreenUserProfile();
        break;
      case RoutePaths.landingScreen:
        widget = LandingScreen();
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => const ScreenCommitList(),
        );
    }

    if (Platform.isIOS) {
      return MaterialPageRoute(
        builder: (context) {
          return WillPopScope(
            onWillPop: () => _onPop(context),
            child: widget,
          );
        },
        settings:
            RouteSettings(name: settings.name, arguments: settings.arguments),
      );
    }

    return _createRoute(settings, widget);
  }

  static Route _createRoute(final RouteSettings settings, final widget) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Future<bool> _onPop(BuildContext context) async {
    if (Navigator.of(context).userGestureInProgress) {
      return Future<bool>.value(false);
    }
    return Future<bool>.value(true);
  }
}
