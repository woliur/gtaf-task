import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtaf_assignment/github_project/values/color_util.dart';
import 'package:gtaf_assignment/github_project/values/image_assets.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.grey_333333,
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.only(left: 77.5,top: 74),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _userPicture(),
          SizedBox(height: 16,),
          _nameText("bb"),
          SizedBox(height: 4,),
          _twitterText("u"),
          SizedBox(height: 16,),
          _commonText("k"),
          SizedBox(height: 16,),
          _commonText("k"),
          SizedBox(height: 8,),
          _commonText("k"),
          SizedBox(height: 8,),
          _commonText("k"),
        ],
      ),
    );
  }

  Widget _userPicture(){
    return ClipOval(
      child: SizedBox.fromSize(// Image radius
          child: Image.asset(ImageAssets.AVATER, height: 168, width: 168,)
      ),
    );
  }

  Widget _nameText(String value) {
    return Text(
      "Francisco Miles",
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.white,
      ),
    );
  }

  Widget _twitterText(String value) {
    return Text(
      "@fransico_miles",
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.grey_C9C9C9,
      ),
    );
  }

  Widget _commonText(String value) {
    return Text(
      "Bio: There once was...",
      style: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.white,
      ),
    );
  }

}
