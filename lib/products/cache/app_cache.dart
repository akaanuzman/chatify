import 'package:chatify_app/products/utility/cache/core/index.dart';

/// [AppCache] is a cache manager for the product module.
final class AppCache {
  AppCache({required CacheManager cacheManager}) : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init(
      items: [
        // UserCacheModel.empty(),
      ],
    );
  }

  // late final HiveCacheOperation<UserCacheModel> userCacheOperation =
  //     HiveCacheOperation<UserCacheModel>();
}
