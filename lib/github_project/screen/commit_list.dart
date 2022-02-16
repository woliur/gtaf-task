import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtaf_assignment/github_project/screen/item_commit_list.dart';
import '../values/color_util.dart';

class ScreenCommitList extends StatefulWidget {
  const ScreenCommitList({Key? key}) : super(key: key);

  @override
  _ScreenCommitListState createState() => _ScreenCommitListState();
}

class _ScreenCommitListState extends State<ScreenCommitList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primary,
      body: Column(
        children: [
          _listBody(),
        ],
      ));
  }

  Widget _listBody(){
    return Center(child: ListView.builder(itemCount: 50,itemBuilder: (context, index) => CommitListItem(),));
  }
}
