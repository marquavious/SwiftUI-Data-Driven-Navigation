//
//  ColorObject.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
//

import Foundation
import SwiftUI

struct ColorObject: Identifiable, Hashable {
    let id: String
    let title: String
    let description: String
    let color: Color
}

extension ColorObject {
    static func basicCollection() -> [ColorObject] {
        return [
            ColorObject(
                id: UUID().uuidString,
                title: "Red",
                description: "Red Description",
                color: .red
            ),
            ColorObject(
                id: UUID().uuidString,
                title: "Blue",
                description: "Blue Description",
                color: .blue
            ),
            ColorObject(
                id: UUID().uuidString,
                title: "Green",
                description: "Green Description",
                color: .green
            ),
            ColorObject(
                id: UUID().uuidString,
                title: "Yellow",
                description: "Yellow Description",
                color: .yellow
            )
        ]
    }
}
