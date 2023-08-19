import 'package:gtaf_assignment/features/data/model/git_commit_list_response.dart';
import 'package:gtaf_assignment/features/data/model/git_user_response.dart';
import 'package:gtaf_assignment/features/domain/entity/commit_list_entity.dart';
import 'package:gtaf_assignment/features/domain/entity/user_entity.dart';
import 'package:gtaf_assignment/features/domain/repository/repository.dart';

import '../../../core/data/cache/base_cache.dart';
import '../../../core/data/http/api_client.dart';
import '../../../core/data/http/api_urls.dart';
import '../../../core/domain/error/api_exceptions.dart';
import '../../../core/domain/service_locator/service_locator.dart';

class RepositoryImpl extends Repository{

  final ApiClient _client = serviceLocator<ApiClient>();
  final BaseCache _cache = serviceLocator<BaseCache>();

  @override
  Future<List<CommitListEntity>?> getCommitList() async {
    List<CommitListEntity>? list = [];
    try {
      final response = await _client.get(ApiUrl.commitList);

      if (response.messageCode == 200) {
        List<CommitListResponse> commitList = List.from(
            response.response.map((e) => CommitListResponse.fromJson(e)));
        if (commitList != null) {
          commitList.forEach((element) {
            CommitListEntity entity = CommitListEntity(
                avatar: element.author?.avatarUrl.toString(),
                commitMessage: element.commit?.message,
                date: element.commit?.author?.date,
                name: element.commit?.author?.name
            );
            list.add(entity);
          });
          return list;
        }
      } else {
        throw ApiException(response.messageCode ?? 999, response.message ?? "");
      }
    } catch (e) {
      return Future.error(e);
    }
  }


  @override
  Future<UserEntity?> getUserProfile() async {

    try {
      final resource = await _client.get(ApiUrl.commitUserProfile);

      if (resource.messageCode == 200) {
        UserResponse response = UserResponse.fromJson(resource.response);
        UserEntity entity = UserEntity(
          name: response.name ?? "N/A",
          avatar: response.avatarUrl ?? "N/A",
          bio: response.bio ?? "N/A",
          publicGists: response.publicGists.toString() ?? "N/A",
          publicRepos: response.publicRepos.toString() ?? "N/A",
          twitterUsername: response.twitterUsername ?? "N/A"
        );
        return entity;
      } else {
        throw ApiException(resource.messageCode ?? 999, resource.message ?? "");
      }
    } catch (e) {
      return Future.error(e);
    }
  }


}