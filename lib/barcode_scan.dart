import 'dart:async';

import 'package:flutter/services.dart';

enum OverlayTheme { LIBRA }

class BarcodeScanner {
  static const CameraAccessDenied = 'PERMISSION_NOT_GRANTED';
  static const MethodChannel _channel =
      const MethodChannel('com.apptreesoftware.barcode_scan');
  static Future<String> scan(OverlayTheme theme) async {
    assert(theme != null);
    String themeStr;
    if (theme == OverlayTheme.LIBRA) {
      themeStr = "libra";
    }
    final Map<String, dynamic> params = <String, dynamic>{
      'theme': themeStr,
    };
    return await _channel.invokeMethod('scan', params);
  }
}
