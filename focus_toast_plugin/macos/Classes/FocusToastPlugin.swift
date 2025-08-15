import Cocoa
import FlutterMacOS

public class FocusToastPlugin: NSObject, FlutterPlugin {
  private let soundManager = FocusToastSoundManager()
  private let windowManager = FocusToastWindowManager()
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "focus_toast_plugin", binaryMessenger: registrar.messenger)
    let instance = FocusToastPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    
    // Initialize managers
    instance.soundManager.initialize()
    
    if let viewController = NSApplication.shared.mainWindow?.contentViewController as? FlutterViewController {
      instance.windowManager.initialize(withController: viewController)
    }
    
    // Register platform view factory
    let factory = FocusToastViewFactory(messenger: registrar.messenger)
    registrar.register(factory, withId: "focus_toast_view")
  }
  
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "playSound":
      if let args = call.arguments as? [String: Any],
         let type = args["type"] as? String {
        soundManager.playSound(type: type)
        result(nil)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENTS", 
                           message: "Invalid arguments for playSound", 
                           details: nil))
      }
      
    case "createToastWindow":
      windowManager.createToastWindow()
      result(nil)
      
    case "showToastWindow":
      if let args = call.arguments as? [String: Any],
         let viewId = args["viewId"] as? Int64 {
        windowManager.showToastWindow(withView: viewId)
        result(nil)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENTS", 
                           message: "Invalid arguments for showToastWindow", 
                           details: nil))
      }
      
    case "closeToastWindow":
      windowManager.closeToastWindow()
      result(nil)
      
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
