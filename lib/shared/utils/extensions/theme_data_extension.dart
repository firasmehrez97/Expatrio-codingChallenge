import 'package:flutter/material.dart';
import 'color_schema.dart';

extension ThemeDataExtension on ThemeData {
  static const ColorSchema _colorScheme = ColorSchema.light();

  static Brightness? _colorSchemeBrightness;

  ColorSchema get colors {
    if (_colorSchemeBrightness != null &&
        _colorSchemeBrightness == brightness) {
      return _colorScheme;
    } else {
      _colorSchemeBrightness = brightness;
      return _colorScheme;
    }
  }
}
