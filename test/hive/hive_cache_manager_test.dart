import 'package:chatify_app/products/utility/cache/hive/hive_cache_manager.dart';
import 'package:chatify_app/products/utility/cache/hive/hive_cache_operation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'core/hive_common_test.dart';
import 'mock/user_mock_cache.dart';

void main() {
  setUp(() async {
    await initTests();
    final coreManager = HiveCacheManager(
      path: 'test/hive/results',
    );
    await coreManager.init(
      items: [
        UserMockCache.empty(),
      ],
    );
  });
  test('Add a data for database', () {
    final userOperation = HiveCacheOperation<UserMockCache>();
    userOperation.add(UserMockCache(id: '1', name: 'vb'));
    final item = userOperation.get('1');
    expect(item, isNotNull);
  });
}
