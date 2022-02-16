import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtaf_assignment/github_project/model/git_commit_list_response.dart';
import 'package:gtaf_assignment/github_project/presenter/presenter.dart';
import 'package:gtaf_assignment/github_project/screen/item_commit_list.dart';
import '../values/color_util.dart';

class ScreenCommitList extends StatefulWidget {
  const ScreenCommitList({Key? key}) : super(key: key);

  @override
  _ScreenCommitListState createState() => _ScreenCommitListState();
}

class _ScreenCommitListState extends State<ScreenCommitList> {
  ValueNotifier<bool> _isLoading = ValueNotifier(true);
  late Presenter _presenter;
  List<CommitListResponse> _dataList = [] ;

  @override
  void initState() {
    super.initState();
    _presenter = Presenter(context);
    _getCommitList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUtils.primary,
        body: Center(
          child: ValueListenableBuilder(
            valueListenable: _isLoading,
            builder: (context, value, child) =>
                value == true ? _loadingView() : _body(),
          ),
        ));
  }

  Widget _body() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            SizedBox(height: 11),
            _listBody(),
          ],
        ),
      ),
    );
  }

  Widget _loadingView() {
    return const CircularProgressIndicator();
  }

  Widget _header() {
    return Container(
      margin: EdgeInsets.only(left: 13, top: 11),
      child: Row(
        children: [
          _headerTitle(),
          const SizedBox(width: 16,),
          _branchName()
        ],
      ),
    );
  }

  Widget _headerTitle() {
    return Text(
      "Flutter Commit List",
      style: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.white,
      ),
    );
  }

  Widget _branchName() {
    return Container(
      padding: EdgeInsets.only(left: 8, bottom: 1, top: 1, right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(26)),
          color: ColorUtils.grey_515050),
      child: Text(
        "master",
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w400,
          color: ColorUtils.white,
        ),
      ),
    );
  }

  Widget _listBody() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => CommitListItem(_dataList[index]),
    );
  }

  void _getCommitList() async {
    _presenter.getCommitList(
      context,
      onSuccess: (data) {
        _isLoading.value = false;
        _dataList = data;
      },
      onFailure: (message) {
        _isLoading.value = false;
        print(message);
      },
    );
  }
}
