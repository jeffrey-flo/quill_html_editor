import 'package:flutter/material.dart';

////[HexColor] color utility class to convert hex to color
class HexColor extends Color {
  static int _getColorFromHex(String? hexColor) {
    if (hexColor == null || !isValidHex(hexColor)) {
      return Colors.transparent.toARGB32();
    }
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

////[HexColor.fromHex] method to get color from hex code
  HexColor.fromHex(final String? hexColor) : super(_getColorFromHex(hexColor));

  ////[isValidHex] method to check if the given hexCode is valid
  static bool isValidHex(String? hexCode) {
    if (hexCode == null || hexCode.isEmpty) {
      return false;
    }
    RegExp hex = RegExp(r'^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$');

    return hex.hasMatch(hexCode.toLowerCase());
  }
  ////[getRGBA] method to get the list of RGBA code

  List<int> getRGBA(Color c) {
    return [
      (c.r * 255.0).round().clamp(0, 255),
      (c.b * 255.0).round().clamp(0, 255),
      (c.g * 255.0).round().clamp(0, 255),
      (c.a * 255.0).round().clamp(0, 255),
    ];
  }
}

///[ToHex] extension method to convert Color to hex code
extension ToHex on Color {
  ///[toHex] extension method to convert Color to hex code
  String toHex() =>
      '#${(toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
}

///[ToRGBA] extension method to convert Color to RGBA
extension ToRGBA on Color {
  ///[toRGBA] extension method to convert Color to RGBA
  String toRGBA() {
    String rgba = '';
    try {
      rgba = 'rgba(${[
        (r * 255.0).round().clamp(0, 255),
        (g * 255.0).round().clamp(0, 255),
        (b * 255.0).round().clamp(0, 255),
        double.parse(a.toStringAsFixed(1))
      ].join(',')})';
    } catch (e) {
      rgba = 'rgba(0,0,0,0)';
    }
    return rgba;
  }
}
