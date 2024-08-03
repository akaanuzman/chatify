/// A mixin that defines the basic structure and behavior of a cache model.
mixin CacheModel {
  /// A unique identifier for the cache model.
  String get id;

  /// Creates an instance of the cache model from a dynamic JSON object.
  ///
  /// The [json] parameter is a dynamic object that contains the data
  /// needed to create an instance of the cache model.
  ///
  /// Returns an instance of the cache model.
  CacheModel fromDynamicJson(dynamic json);
}
