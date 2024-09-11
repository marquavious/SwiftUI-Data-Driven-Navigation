//
//  Color.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
//

import Foundation
import SwiftUI

extension Color {
    static func random() -> Color {
        return Color(UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        ))
    }
}
