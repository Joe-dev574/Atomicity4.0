//
//  HapticManager.swift
//  Atomicity4.0
//
//  Created by Joseph DeWeese on 10/13/24.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}

