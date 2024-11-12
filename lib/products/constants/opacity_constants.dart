// ignore_for_file: sort_constructors_first

/// An enumeration representing different levels of opacity constants.
///
/// Each constant has an associated double value representing the opacity level.
///
enum OpacityConstants {
  /// - `high`: Represents a high opacity level with a value of 0.75.
  high(0.75),

  /// - `mediumHigh`: Represents a medium-high opacity level with a value
  /// of 0.5.
  mediumHigh(0.5),

  /// - `medium`: Represents a medium opacity level with a value of 0.25.
  medium(0.25),

  /// - `low`: Represents a low opacity level with a value of 0.1.
  low(0.1),

  /// - `veryLow`: Represents a very low opacity level with a value of 0.05.
  veryLow(0.05);

  /// The double value of the opacity constant.
  final double value;

  /// Creates an instance of [OpacityConstants] with the given [value].
  const OpacityConstants(this.value);
}
