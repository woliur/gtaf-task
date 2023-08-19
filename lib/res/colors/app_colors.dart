import 'package:flutter/material.dart';
import 'base_colors.dart';

class AppColors implements BaseColors{

  final Map<int, Color> _primary =
  {
    50:const Color.fromRGBO(218, 107, 255, 0.1),
    100:const Color.fromRGBO(218, 107, 255, 0.2),
    200:const Color.fromRGBO(218, 107, 255, 0.3),
    300:const Color.fromRGBO(218, 107, 255, 0.4),
    400:const Color.fromRGBO(218, 107, 255, 0.5),
    500:const Color.fromRGBO(218, 107, 255, 0.6),
    600:const Color.fromRGBO(218, 107, 255, 0.7),
    700:const Color.fromRGBO(218, 107, 255, 0.8),
    800:const Color.fromRGBO(218, 107, 255, 0.9),
    900:const Color.fromRGBO(218, 107, 255, 1.0),
  };

  @override
  MaterialColor get colorAccent => Colors.amber;

  @override
  MaterialColor get colorPrimary => MaterialColor(0xFFEFB7D2,_primary);

  //black

  @override
  Color get black => const Color(0xFF000000);

  @override
  Color get black100 => const Color(0xFFEAECF0);

  @override
  Color get black150 => const Color(0xFFD9D9D9);

  @override
  Color get black200 => const Color(0xFFA7AAB1);

  @override
  Color get black250 => const Color(0xFFCCCCCC);

  @override
  Color get black300 => const Color(0xFF868990);

  @override
  Color get black350 => const Color(0xFFF7F7F7);

  @override
  Color get black400 => const Color(0xFF4D4F55);

  @override
  Color get black50 => const Color.fromRGBO(153, 153, 153, 1);

  @override
  Color get black500 => const Color(0xFF404040);

  @override
  Color get black550 => const Color(0xFF333333);

  @override
  Color get black600 => const Color(0xFF2F3137);

  @override
  Color get black650 => const Color(0xFF1A1A1A);

  @override
  Color get black700 => const Color(0xFF121212);

  @override
  Color get black800 => const Color(0xFF0F1117);

  @override
  Color get black900 => const Color.fromRGBO(26, 26, 26, 1);

  //blue

  @override
  Color get blue400 => const Color(0xFF95BEF9);

  @override
  Color get blue50 => const Color(0xFFEEF6FB);

  @override
  Color get blue700 => const Color(0xFF080D21);

  @override
  Color get blue750 => const Color(0xFF1877F2);

  @override
  Color get blue800 => const Color(0xFF17254D);

  @override
  Color get blue850 => const Color(0xFF171204);

  @override
  Color get blue900 => const Color(0xFF06091B);

  //green

  @override
  Color get green100 => const Color(0xFFF5FBF6);

  @override
  Color get green150 => const Color(0xFFECF9ED);

  @override
  Color get green200 => const Color(0xFFF0FFEC);

  @override
  Color get green25 => const Color(0xFFFBFFF9);

  @override
  Color get green300 => const Color(0xFF8FE59B);

  @override
  Color get green50 => const Color(0xFFEFF8F1);

  @override
  Color get green500 => const Color(0xFF39B54A);

  @override
  Color get green600 => const Color(0xFF39B54B);

  @override
  Color get green700 => const Color(0xFF00A24A);

  @override
  Color get green75 => const Color(0xFFF4FFF1);

  @override
  Color get green750 => const Color(0xFF0F925B);

  @override
  Color get green800 => const Color(0xFF126836);

  @override
  Color get green900 => const Color(0xFF1F6127);

  //grey

  @override
  Color get grey100 => const Color(0xFFF4F5F7);

  @override
  Color get grey150 => const Color(0xFFCDCDCD);

  @override
  Color get grey200 => const Color(0xFFBFBFBF);

  @override
  Color get grey300 => const Color(0xFF999999);

  @override
  Color get grey350 => const Color(0xFF808080);

  @override
  Color get grey400 => const Color(0xFF828282);

  @override
  Color get grey450 => const Color(0xFF7B7B7B);

  @override
  Color get grey500 => const Color(0xFF606268);

  @override
  Color get grey550 => const Color.fromRGBO(83, 90, 115, 1);

  @override
  Color get grey600 => const Color(0xFF4A4A4A);

  @override
  Color get grey700 => const Color(0xFF2D2D2D);

  @override
  Color get grey800 => const Color(0xFF222222);

  //primary

  @override
  Color get borderColor => const Color.fromRGBO(244, 244, 244, 1);

  @override
  Color get primaryColor => const Color(0xFF224072);

  @override
  Color get secondaryColor => const Color(0xFF0A0B1C);

  @override
  Color get primaryColorBackground => const Color(0xFFFBF4E2);

  @override
  Color get primaryColorBorder => const Color(0xFF7B7B85);

  //red

  @override
  Color get red100 => const Color(0xFFF9EDEC);

  @override
  Color get red300 => const Color(0xFFFB999D);

  @override
  Color get red400 => const Color(0xFFEF655A);

  @override
  Color get red500 => const Color(0xFFDC3044);

  @override
  Color get red600 => const Color(0xFFBF392B);

  @override
  Color get red700 => const Color(0xFFC92236);

  //silver

  @override
  Color get silver100 => const Color(0xFFCAD6E3);

  @override
  Color get silver200 => const Color(0xFFC9CCD2);

  //state

  @override
  Color get stateBlue => const Color(0xFF578AF8);

  @override
  Color get stateDeepBlue => const Color(0xFF17254D);

  @override
  Color get stateGreen => const Color(0xFF81C585);

  @override
  Color get statePurple => const Color(0xFF6B4CF6);

  @override
  Color get stateRed => const Color(0xFFEF655A);

  //white

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get white700 => const Color(0xFFF2F2F2);

  @override
  Color get white800 => const Color(0xFFF4F4F4);

  //yellow

  @override
  Color get yellow500 => const Color(0xFFEEB50B);

  @override
  Color get yellow600 => const Color(0xFFEDA109);

  @override
  Color get yellow_FEFBEA => const Color(0xFFFEFBEA);


  @override
  Color get otpBorderColor => const Color.fromRGBO(0, 0, 0, 0.32);

  @override
  Color get unselectedItemColor => const Color.fromRGBO(255, 255, 255, 0.6);

  @override
  LinearGradient get splashGradient => const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFE6BD4E),
      Color(0xFFE4BC4A),
      Color(0xFFF4CF62),
      Color(0xFFFFD36E),
    ],
    stops: [0.0, 0.3745, 0.8404, 1.0],
  );

  @override
  Color get backgroundColor => const Color.fromRGBO(56, 107, 169, 0.14);

  @override
  Color get blue_63A0F8 => const Color(0xFF63A0F8);

  @override
  Color get green_FF72BA70 => const Color(0xFF72BA70);

  @override
  Color get yellow_F6D330 => const Color(0xFFF6D330);

  @override
  Color get yellow_FBF8ED => const Color(0xFFFBF8ED);

  @override
  Color get secondaryAccents => const Color(0xFFB785C4);

  @override
  Color get grey_515050 => const Color(0xFF515050);

  @override
  Color get grey_404040 => const Color(0xFF404040);

  @override
  Color get grey_9B9B9B => const Color(0xFF9B9B9B);

  @override
  Color get grey_B8B8B8 => const Color(0xFFB8B8B8);

  @override
  // TODO: implement grey_C9C9C9
  Color get grey_C9C9C9 => const Color(0xFFC9C9C9);

  @override
  // TODO: implement blue_0059b3
  Color get blue_0059b3 => const Color(0xFF0059b3);

  @override
  // TODO: implement blue_0A84FF
  Color get blue_0A84FF => const Color(0xFF0A84FF);

  @override
  // TODO: implement black_161616
  Color get black_161616 => const Color(0xFF161616);

  @override
  // TODO: implement black_333333
  Color get black_333333 => const Color(0xFF333333);


}