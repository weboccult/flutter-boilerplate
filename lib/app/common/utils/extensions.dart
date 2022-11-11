import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

extension HexColor on Color {
  /// Convert HexString to flutter inbuilt colors.
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

/// Strings Convert Extensions.
extension Convert on String {
  /// Convert an Image Path directly to base64 encoded String.
  Future<String> imagePathToBase64String() async {
    Uint8List tempList = await File(this).readAsBytes();
    return "data:image/${split(".").last};base64,${base64Encode(tempList)}";
  }

  /// Converts a Hex String to [Color].
  Color toColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Capitalization of First letter in a Strings
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}
