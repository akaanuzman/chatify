// ignore_for_file: comment_references, sort_constructors_first
import 'package:flutter/material.dart';

/// Project locale enum for [EasyLocalization] operations
/// and configurations
enum DeviceLocales {
  /// Turkish
  tr(Locale('tr', 'TR')),

  /// English
  en(Locale('en', 'US'));

  /// Locale value
  final Locale locale;

  const DeviceLocales(this.locale);
}
