import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gtaf_assignment/github_project/model/git_commit_list_response.dart';
import 'package:gtaf_assignment/github_project/model/git_user_response.dart';
import 'package:gtaf_assignment/github_project/util/api_client.dart';
import 'package:gtaf_assignment/github_project/util/api_urls.dart';
import 'package:gtaf_assignment/github_project/values/string.dart';

class Repository{

  Future<List<CommitListResponse>> getCommitList() async {
    String url = ApiUrls.commitList;
    try {
      final response = await ApiClient.get(
          url, null);
      List<CommitListResponse> commitList = List.from(response.map((e) => CommitListResponse.fromJson(e)));
      if (commitList != null) {
        return commitList;
      }
      throw StringResource.dataError;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<UserResponse> getUserProfile(
      BuildContext context, String orderId) async {
    String url = ApiUrls.commitUserProfile;
    try {
      final response = await ApiClient.get(
          url, null);
      var apiResponse = UserResponse.fromJson(response);
      if (apiResponse != null) {
        return apiResponse;
      }
      throw StringResource.dataError;
    } catch (e) {
      return Future.error(e);
    }
  }

}