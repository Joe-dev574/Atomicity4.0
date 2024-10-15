//
//  OffsetKey.swift
//  Atomicity4.0
//
//  Created by Joseph DeWeese on 10/14/24.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
