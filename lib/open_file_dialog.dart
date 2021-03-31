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

  static Future<List<String>?> openFileDialog(String rootPath) async {
    var p = '/';
    if (rootPath != '') {
      p = rootPath;
    }

    if (await Directory(p).exists()) {
      var result = await _channel.invokeMethod('openFileDialog', {'rootPath': p});
      if (result == null) {
        return null;
      } else {
        return result.cast<String>();
      }
    } else {
      return null;
    }
  }

  static Future<String?> openSaveDialog(String rootPath) async {
    var p = '/';
    if (rootPath != '') {
      p = rootPath;
    }

    var result = await _channel.invokeMethod('openSaveDialog', {'rootPath': p});
    if (result == null) {
      return null;
    } else {
      return result;
    }
  }

}
