import 'package:chatify_app/products/utility/cache/cache_model.dart';

/// The CacheManager class is an abstract class.
abstract class CacheManager {
  /// The CacheManager class is an abstract class.
  CacheManager({this.path});

  /// Make your cache initialization here.
  Future<void> init({required List<CacheModel> items});

  /// Remove all cache.
  void remove();

  /// [path] is the path to the directory for example testing
  final String? path;
}
