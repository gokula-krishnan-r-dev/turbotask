import Foundation
import AVFoundation
import AppKit

@objc class FocusToastSoundManager: NSObject {
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
