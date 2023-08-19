
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtaf_assignment/features/presentation/commit_list/bloc/commit_bloc.dart';
import 'package:gtaf_assignment/features/presentation/commit_list/bloc/commit_event.dart';
import 'package:gtaf_assignment/features/presentation/commit_list/screen/screen_commit_list.dart';
import 'package:gtaf_assignment/features/presentation/landing/bloc/landing_bloc.dart';
import 'package:gtaf_assignment/features/presentation/user_profile/bloc/user_event.dart';
import 'package:gtaf_assignment/features/presentation/user_profile/screen/screen_user_profile.dart';
import 'package:gtaf_assignment/res/app_context_extension.dart';

import '../../user_profile/bloc/user_bloc.dart';
import '../bloc/landing_event.dart';
import '../bloc/landing_state.dart';
import 'bottom_widget.dart';


class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  static const List<Widget> _pages = <Widget>[
    ScreenCommitList(),
    ScreenUserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text("Exit?", style: TextStyle(color: Colors.red)),
          content: Text("Are you sure?", style: TextStyle(fontWeight: FontWeight.w500),),
          actions: [
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
            ElevatedButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),);
        return Future.value(true);
      },
      child: BlocBuilder<LandingBloc, LandingState>(
        builder: (context, state) => Scaffold(
          body: IndexedStack(
            index: state.index,
            children: _pages,
          ),
          bottomNavigationBar: SizedBox(
            height: 56,
            child: BottomNavigationBar(
              backgroundColor: context.resources.color.black_161616,
              type: BottomNavigationBarType.fixed,
              // selectedLabelStyle:  TextStyle(fontWeight: FontWeight.w500, color: context.resources.color.primaryColor, fontSize: 14),
              // unselectedLabelStyle:  TextStyle(fontWeight: FontWeight.w500, color: context.resources.color.green25,  fontSize: 14),
              currentIndex: state.index,
              selectedItemColor: context.resources.color.blue_0A84FF,
              unselectedItemColor: context.resources.color.blue_0059b3,
              onTap: (int index){
                if(index == 0){
                  // context.read<CommitBloc>().add(GetCommitsEvent());
                }
                if(index == 1){
                  context.read<UserBloc>().add(GetUserEvent());
                }
                context.read<LandingBloc>().add(LandingIndexEvent(index));
              },
              items: [
                for(int i = 0; i < _pages.length; i++)
                  AppBottomNavigationTabBarItem(index: i, selectedIndex: state.index, context: context).getTabBarItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
