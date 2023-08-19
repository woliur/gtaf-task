import 'package:flutter/material.dart';

Widget customText(
    {required String text,
    bool? softWrap,
    TextStyle? textStyle,
    TextAlign? textAlign,
    VoidCallback? onTap,
    double top = 0.0,
    double left = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    int maxLines = 3}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding:
          EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      child: Text(
        text,
        style: textStyle,
        maxLines: maxLines,
        textAlign: textAlign,
        softWrap: softWrap,
        overflow: TextOverflow.visible,
      ),
    ),
  );
}
