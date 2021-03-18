import Cocoa
import FlutterMacOS

public class OpenFileDialogPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "open_file_dialog", binaryMessenger: registrar.messenger)
    let instance = OpenFileDialogPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "openFileDialog":
        var rootPath = "/"
        let arguments = call.arguments as! [String: Any]
//         guard rootPath = arguments["rootPath"] as? String
        if let unwrapped = arguments["rootPath"] {
            rootPath = unwrapped as! String
        }
        result(self.openFileDialog(rootPath))
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    
    func openFileDialog(_ rootPath: String) -> [String]? {
        let dialog = NSOpenPanel();
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.allowsMultipleSelection = true;
        dialog.canChooseDirectories = true;

        let launcherLogPathWithTilde = rootPath as NSString
        let expandedLauncherLogPath = launcherLogPathWithTilde.expandingTildeInPath
        dialog.directoryURL = NSURL.fileURL(withPath: expandedLauncherLogPath, isDirectory: true)

        var paths: [String] = []

        if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
            let urls = dialog.urls
            for p in urls {
                paths.append(p.path)
            }
            return paths
        } else {
            return nil
        }
    }
}
