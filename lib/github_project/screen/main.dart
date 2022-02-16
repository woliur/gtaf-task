import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gtaf_assignment/github_project/presenter/presenter.dart';
import 'package:gtaf_assignment/github_project/screen/user_profile.dart';
import 'package:gtaf_assignment/github_project/values/color_util.dart';
import 'package:gtaf_assignment/github_project/values/image_assets.dart';

import 'commit_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Greentech App Foundation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  ValueNotifier<bool> _isLoading = ValueNotifier(true);
  // ValueNotifier<int> _currentIndex = ValueNotifier(0);
  int _currentIndex = 0;
  final _tabs = [ScreenCommitList(), SereenUserProfile()];
  late Presenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = Presenter(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _tabs[_currentIndex],
      bottomNavigationBar: _bottomNavigation(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _bottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorUtils.black_161616,
      selectedItemColor: ColorUtils.selected_font,
      unselectedItemColor: ColorUtils.de_selected_font,
      // selectedLabelStyle: TextStyle(color: ColorUtils.selected_font),
      // unselectedLabelStyle: TextStyle(color: ColorUtils.de_selected_font),
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(ImageAssets.COMMIT_DESELECT),
            activeIcon: SvgPicture.asset(ImageAssets.COMMIT_SELECT),
            label: "Commits"),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(ImageAssets.USER_DESELECT),
            activeIcon: SvgPicture.asset(ImageAssets.USER_SELECT),
            label: "User Profile"),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
