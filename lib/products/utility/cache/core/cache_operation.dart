import 'package:chatify_app/products/utility/cache/core/cache_model.dart';

/// The CacheOperation class is an abstract class that defines the basic
abstract class CacheOperation<T extends CacheModel> {
  /// Adds an item to the cache.
  void add(T item);

  /// Adds all items to the cache.
  void addAll(List<T> items);

  /// Removes an item from the cache.
  void remove(String id);

  /// Removes all items from the cache.
  void clear();

  /// Returns all items from the cache.
  List<T> getAll();

  /// Returns an item from the cache.
  T? get(String id);
}
