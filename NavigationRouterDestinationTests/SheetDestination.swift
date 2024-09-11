//
//  SheetDestination.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
//

import Foundation
import SwiftUI

enum SheetDestination: Identifiable, Hashable {
    case colorSheet(color: Color, colorName: String)

    var id: String {
        UUID().uuidString
    }
}
