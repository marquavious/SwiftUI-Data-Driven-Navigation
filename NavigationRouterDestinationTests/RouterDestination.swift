//
//  RouterDestination.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
//

import Foundation

enum RouterDestination: Identifiable, Hashable {
    case colorPage(colorObject: ColorObject, isNewColor: Bool = false)

    var id: String {
        switch self {
        case .colorPage(colorObject: let colorObject, _):
            colorObject.id
        }
    }
}
