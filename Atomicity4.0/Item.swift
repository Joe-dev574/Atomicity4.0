//
//  Item.swift
//  Atomicity4.0
//
//  Created by Joseph DeWeese on 10/12/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
