import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtaf_assignment/github_project/model/git_commit_list_response.dart';
import 'package:gtaf_assignment/github_project/presenter/presenter.dart';
import 'package:gtaf_assignment/github_project/util/date_formate_util.dart';
import '../values/color_util.dart';
import 'package:gtaf_assignment/github_project/values/image_assets.dart';

class CommitListItem extends StatefulWidget {
  final CommitListResponse data;

  @override
  _CommitListItemState createState() => _CommitListItemState();

  CommitListItem(this.data);
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
        _messageText(widget.data.commit!.message.toString()),
        _timeWidget(widget.data.commit!.author!.date.toString()),
      ],
    );
  }

  Widget _messageText(String text) {
    return Expanded(
      flex: 5,
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w400,
          color: ColorUtils.white,
        ),
      ),
    );
  }

  Widget _timeWidget(String date) {
    return Expanded(
      flex: 1,
      child: Text(
        DateUtil.instance.formatDateWithTimeUTC(date),
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: ColorUtils.grey_B8B8B8,
        ),
      ),
    );
  }

  Widget _secondRow() {
    return Row(
      children: [
        _avaterWidget(widget.data.author!.avatarUrl.toString()),
        const SizedBox(
          width: 8,
        ),
        nameText(widget.data.commit!.author!.name.toString()),
      ],
    );
  }

  Widget _avaterWidget(String img) {
    return ClipOval(
      child: SizedBox.fromSize(// Image radius
        child: Image.network(img, height: 20, width: 20,)
      ),
    );
  }

  Widget nameText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.grey_9B9B9B,
      ),
    );
  }
}
