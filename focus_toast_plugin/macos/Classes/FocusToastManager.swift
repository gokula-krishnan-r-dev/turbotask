import Cocoa
import FlutterMacOS

// MARK: - Sound Manager
class FocusToastSoundManager: NSObject {
    private var regularSound: NSSound?
    private var milestoneSound: NSSound?
    private var isInitialized = false
    
    @objc func initialize() {
        if isInitialized {
            return
        }
        
        // Load sounds from resources
        regularSound = NSSound(named: "chime_soft")
        milestoneSound = NSSound(named: "chime_bright")
        
        // If sounds not found in system, use fallback sounds
        if regularSound == nil {
            regularSound = NSSound(named: "Tink")
        }
        
        if milestoneSound == nil {
            milestoneSound = NSSound(named: "Glass")
        }
        
        isInitialized = true
    }
    
    @objc func playSound(type: String) {
        // Initialize if needed
        if !isInitialized {
            initialize()
        }
        
        // Check if system is in Do Not Disturb mode
        let inDoNotDisturb = checkDoNotDisturbStatus()
        if inDoNotDisturb {
            return
        }
        
        // Select and play the appropriate sound
        let sound: NSSound?
        
        switch type {
        case "milestone":
            sound = milestoneSound
        default:
            sound = regularSound
        }
        
        // Play at reduced volume (40-50%)
        sound?.volume = 0.45
        sound?.play()
    }
    
    private func checkDoNotDisturbStatus() -> Bool {
        // Check macOS Do Not Disturb status
        if #available(macOS 10.15, *) {
            let current = NSUserNotificationCenter.default
            return current.deliveryPolicy == .none
        } else {
            // Older macOS versions - try to access private API
            // This is a fallback and may not work on all systems
            return false
        }
    }
}

// MARK: - Window Manager
class FocusToastWindowManager: NSObject {
    private var toastWindow: NSWindow?
    private var flutterViewController: FlutterViewController?
    
    @objc func initialize(withController controller: FlutterViewController) {
        flutterViewController = controller
    }
    
    @objc func createToastWindow() {
        // Close existing window if any
        closeToastWindow()
        
        // Create a borderless window that stays above all other windows
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 320, height: 80),
            styleMask: [.borderless, .nonactivatingPanel],
            backing: .buffered,
            defer: false
        )
        
        // Configure window properties
        window.level = .floating // Stay above most windows
        window.isOpaque = false
        window.backgroundColor = .clear
        window.hasShadow = false
        window.ignoresMouseEvents = true // Pass through mouse events
        window.isReleasedWhenClosed = false
        window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        
        // Position at top center of main screen
        if let screen = NSScreen.main {
            let screenFrame = screen.visibleFrame
            let notchHeight: CGFloat = hasNotch() ? 32.0 : 0.0
            
            // Position below menu bar and notch if present
            let xPos = screenFrame.midX - 160 // Center horizontally (320/2 = 160)
            let yPos = screenFrame.maxY - 100 - notchHeight // 100px from top, adjusted for notch
            
            window.setFrameOrigin(NSPoint(x: xPos, y: yPos))
        }
        
        // Store reference
        toastWindow = window
    }
    
    @objc func showToastWindow(withView viewId: Int64) {
        guard let window = toastWindow else {
            createToastWindow()
            return
        }
        
        // Get the Flutter view by ID
        if let flutterView = flutterViewController?.view.subviews.first(where: { $0.tag == Int(viewId) }) {
            // Set the Flutter view as the window content
            window.contentView = flutterView
            
            // Show the window if not visible
            if !window.isVisible {
                window.orderFront(nil)
            }
        }
    }
    
    @objc func closeToastWindow() {
        if let window = toastWindow {
            window.orderOut(nil)
            window.contentView = nil
        }
    }
    
    // Check if the device has a notch
    private func hasNotch() -> Bool {
        if #available(macOS 12.0, *) {
            if let screen = NSScreen.main {
                return !screen.safeAreaInsets.top.isZero
            }
        }
        return false
    }
}

// MARK: - View Factory
class FocusToastViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    func create(
        withViewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> NSView {
        // Create a simple container view that will be used as a platform view
        let containerView = NSView(frame: NSRect(x: 0, y: 0, width: 320, height: 80))
        containerView.tag = Int(viewId)
        containerView.wantsLayer = true
        
        return containerView
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}
