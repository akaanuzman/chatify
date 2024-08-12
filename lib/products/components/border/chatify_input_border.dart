import 'package:chatify_app/products/asset/colors.gen.dart';
import 'package:flutter/material.dart';

/// A text form field's border for Chatify.
@immutable
final class DefaultOutlinedBorder extends OutlineInputBorder {
  /// The default constructor.
  DefaultOutlinedBorder({
    this.color,
    this.width,
  }) : super(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: color ?? ColorName.lightOrange.withOpacity(.1),
            width: width ?? 1.5,
          ),
        );

  /// The color of the border.
  final Color? color;

  /// The width of the border.
  final double? width;
}
