import '../entity/commit_list_entity.dart';
import '../entity/user_entity.dart';

abstract class Repository{
  Future<List<CommitListEntity>?> getCommitList();
  Future<UserEntity?> getUserProfile();
}