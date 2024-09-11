//
//  ColorManager.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
//

import Foundation

@MainActor
@Observable class ColorManager {
    var colors = ColorObject.basicCollection()

    nonisolated init() {}

    func addColor(coclorObject: ColorObject) {
        guard !colors.contains(coclorObject) else { return }
        colors.append(coclorObject)
    }
}
