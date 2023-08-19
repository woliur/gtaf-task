import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gtaf_assignment/res/app_context_extension.dart';


class AppBottomNavigationTabBarItem {
  final int index;
  final int selectedIndex;
  final BuildContext context;

  AppBottomNavigationTabBarItem({required this.index, required this.selectedIndex, required this.context});

  BottomNavigationBarItem getTabBarItem(){
    String icon = "";
    String itemText = "";
    String activeIcon = "";

    switch(index){
      case 0: {
        icon = context.resources.drawable.commitDeselect;
        itemText = "Commits";
        activeIcon = context.resources.drawable.commitSelect;
      }
      break;
      case 1: {
        icon = context.resources.drawable.userDeselect;
        itemText = "User Profile";
        activeIcon = context.resources.drawable.userSelect;
      }
      break;
      default:{
        icon = context.resources.drawable.commitSelect;
        itemText = "Commits";
        activeIcon = "Commits";
      }
    }
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon,),
      activeIcon: SvgPicture.asset(activeIcon),
      label: itemText,
    );
  }

}
