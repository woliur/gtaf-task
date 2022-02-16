import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtaf_assignment/github_project/model/git_user_response.dart';
import 'package:gtaf_assignment/github_project/presenter/presenter.dart';
import 'package:gtaf_assignment/github_project/values/color_util.dart';

class SereenUserProfile extends StatefulWidget {
  const SereenUserProfile({Key? key}) : super(key: key);

  @override
  _SereenUserProfileState createState() => _SereenUserProfileState();
}

class _SereenUserProfileState extends State<SereenUserProfile> {
  ValueNotifier<bool> _isLoading = ValueNotifier(true);
  late Presenter _presenter;
  late UserResponse _data;
  @override
  void initState() {
    super.initState();
    _presenter = Presenter(context);
    _getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.grey_333333,
      body: ValueListenableBuilder(
        valueListenable: _isLoading,
        builder: (context, value, child) =>
        value == true ? _loadingView() : _body(),
      ),
    );
  }

  Widget _loadingView() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.only(left: 77.5,top: 74),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _userPicture(_data.avatarUrl.toString()),
          SizedBox(height: 16,),
          _nameText(_data.name.toString()),
          SizedBox(height: 4,),
          _twitterText(_data.twitterUsername.toString()),
          SizedBox(height: 16,),
          _commonText("Bio: "+_data.bio.toString()),
          SizedBox(height: 16,),
          _commonText("Public Repos: "+_data.publicRepos.toString()),
          SizedBox(height: 8,),
          _commonText("Public Gists: "+_data.publicGists.toString()),
          SizedBox(height: 8,),
          _commonText("Private Repos: "+_data.publicRepos.toString()),
        ],
      ),
    );
  }

  Widget _userPicture(String image){
    return ClipOval(
      child: SizedBox.fromSize(// Image radius
          child: Image.network(image, height: 168, width: 168,)
      ),
    );
  }

  Widget _nameText(String value) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.white,
      ),
    );
  }

  Widget _twitterText(String value) {
    return Text( _isNull(value) ? "N/A" : value,
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.grey_C9C9C9,
      ),
    );
  }

  Widget _commonText(String value) {
    return Text(
      _isNull(value) ? "N/A" : value,
      style: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.white,
      ),
    );
  }

  void _getUser() async {
    _presenter.getUser(context, onSuccess: (data) {
      _isLoading.value = false;
      _data = data;
    }, onFailure: (msg) {
      _isLoading.value = false;
      print(msg);
    },);
  }

  bool _isNull(String? string){
    if(string == null || string == "null"){
      return true;
    }else {
      return false;
    }
  }

}
