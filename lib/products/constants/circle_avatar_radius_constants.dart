// ignore_for_file: sort_constructors_first

/// An enumeration representing different levels of circle avatar
/// radius constants.
///
/// Each constant has an associated double value representing the radius size.
///
enum CircleAvatarRadiusConstants {
  /// - `high`: Represents a high radius size with a value of 96.
  high(96),

  /// - `mediumHigh`: Represents a medium-high radius size with a value of 80.
  mediumHigh(80),

  /// - `medium`: Represents a medium radius size with a value of 64.
  medium(64),

  /// - `low`: Represents a low radius size with a value of 48.
  low(48),

  /// - `veryLow`: Represents a very low radius size with a value of 32.
  veryLow(32),

  /// - `veryVeryLow`: Represents a very very low radius size with a
  /// value of 16.
  veryVeryLow(16);

  /// The double value of the radius constant.
  final double value;

  /// Creates an instance of [CircleAvatarRadiusConstants] with
  /// the given [value].
  const CircleAvatarRadiusConstants(this.value);
}
