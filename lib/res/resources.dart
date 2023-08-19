import 'package:flutter/cupertino.dart';
import 'package:gtaf_assignment/res/string/app_string.dart';
import '../../res/drawable/app_drawable.dart';
import '../../res/style/app_style.dart';
import 'colors/app_colors.dart';
import 'dimentions/app_dimension.dart';

class Resources {

  final BuildContext _context;
  Resources(this._context);

  // Strings? get strings {
  //   return Localizations.of<Strings>(_context, Strings);
  // }

  AppColors get color {
    return AppColors();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  AppTextStyle get style {
    return AppTextStyle();
  }

  AppDrawable get drawable {
    return AppDrawable();
  }

  AppString get string {
    return AppString();
  }

  static Resources of(BuildContext context){
    return Resources(context);
  }
}