import 'package:chatify_app/products/utility/cache/core/index.dart';

class UserMockCache with CacheModel {
  UserMockCache({required this.id, required this.name});
  UserMockCache.empty() : this(id: '', name: '');
  @override
  final String id;
  final String name;
  @override
  UserMockCache fromDynamicJson(dynamic json) {
    final itemMap = json as Map<String, dynamic>;
    return UserMockCache(
      id: itemMap['id'] as String,
      name: itemMap['name'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
