import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

class OpenFileDialog {
  static const MethodChannel _channel =
      const MethodChannel('open_file_dialog');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> openFileDialog(String rootPath) async {
    final String path = await _channel.invokeMethod('openFileDialog', {'rootPath': rootPath});
    return path;
  }
}
