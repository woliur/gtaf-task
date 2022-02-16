import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtaf_assignment/github_project/presenter/presenter.dart';
import '../values/color_util.dart';
import 'package:gtaf_assignment/github_project/values/image_assets.dart';

class CommitListItem extends StatefulWidget {
  const CommitListItem({Key? key}) : super(key: key);

  @override
  _CommitListItemState createState() => _CommitListItemState();
}

class _CommitListItemState extends State<CommitListItem> {

  late Presenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = Presenter(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _presenter.navigateUserProfile();
      },
      child: Container(
        padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 16.0, right: 17.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: ColorUtils.grey_404040))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _firstRow(),
            SizedBox(height: 8),
            _secondRow(),
          ],
        ),
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: [
        _messageText(),
        Spacer(),
        _timeWidget(),
      ],
    );
  }

  Widget _messageText() {
    return Text(
      "Fix All bugs",
      style: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.white,
      ),
    );
  }

  Widget _timeWidget() {
    return Text(
      "18:14",
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.grey_B8B8B8,
      ),
    );
  }

  Widget _secondRow() {
    return Row(
      children: [
        _avaterWidget(),
        const SizedBox(
          width: 8,
        ),
        nameText(),
      ],
    );
  }

  Widget _avaterWidget() {
    return ClipOval(
      child: SizedBox.fromSize(// Image radius
        child: Image.asset(ImageAssets.AVATER, height: 20, width: 20,)
      ),
    );
  }

  Widget nameText() {
    return Text(
      "Francisco Miles",
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.grey_9B9B9B,
      ),
    );
  }
}
