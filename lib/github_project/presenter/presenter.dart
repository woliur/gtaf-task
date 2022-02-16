import 'package:flutter/material.dart';
import 'package:gtaf_assignment/github_project/model/git_commit_list_response.dart';
import 'package:gtaf_assignment/github_project/repository/repository.dart';
import 'package:gtaf_assignment/github_project/screen/commit_list.dart';
import 'package:gtaf_assignment/github_project/screen/user_profile.dart';

class Presenter{

  late final BuildContext _context;
  late final Repository _repository;

  Presenter(BuildContext context){
    _context = context;
    _repository = Repository();
  }

  void navigateToList() {
    Navigator.push(
        _context,
        MaterialPageRoute(
          builder: (context) => const ScreenCommitList(),
        ));
  }

  void navigateUserProfile() {
    Navigator.push(
        _context,
        MaterialPageRoute(
          builder: (context) => const UserProfile(),
        ));
  }

  void getCommitList(
      BuildContext context,
      {required void Function(List<CommitListResponse>) onSuccess,
        required void Function(String) onFailure}) async {
    try {
      List<CommitListResponse> data;
      data = await _repository.getCommitList();
      if (data != null) {
        onSuccess(data);
      } else {
        onFailure("Something Wrong");
      }
    } catch (e) {
      onFailure(e.toString());
    }
  }
}