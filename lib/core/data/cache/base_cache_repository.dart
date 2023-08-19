
import 'package:gtaf_assignment/core/data/cache/preference_cache.dart';

import '../http/base_http_repository.dart';
import 'base_cache.dart';

abstract class BaseCacheRepository {
  BaseCache cache = PreferenceCache();
  BaseHttpRepository repository;

  BaseCacheRepository(this.repository);
}
