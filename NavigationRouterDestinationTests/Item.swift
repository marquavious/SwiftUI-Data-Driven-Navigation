//
//  Item.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
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
