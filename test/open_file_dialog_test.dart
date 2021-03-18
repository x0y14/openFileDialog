import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_file_dialog/open_file_dialog.dart';

void main() async {
  const MethodChannel channel = MethodChannel('open_file_dialog');

  TestWidgetsFlutterBinding.ensureInitialized();

  // setUp(() {
  //   channel.setMockMethodCallHandler((MethodCall methodCall) async {
  //     return '42';
  //   });
  // });
  //
  // tearDown(() {
  //   channel.setMockMethodCallHandler(null);
  // });
  //
  // test('getPlatformVersion', () async {
  //   expect(await OpenFileDialog.platformVersion, '42');
  // });
  test('openFileDialog', () async {
    expect(
      await OpenFileDialog.openDialog('/Users/x0y14/dev/dart/Editor/open_file_dialog/lib/'), '/Users/x0y14/dev/dart/Editor/open_file_dialog/lib/open_file_dialog.dart'
    );
  });
  // await OpenFileDialog.openFileDialog('/Users/x0y14/dev/dart/Editor/open_file_dialog/lib/')
}
