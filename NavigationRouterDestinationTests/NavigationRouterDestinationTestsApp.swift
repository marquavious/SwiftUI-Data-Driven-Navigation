//
//  NavigationRouterDestinationTestsApp.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
//

import SwiftUI
import SwiftData
import Observation

@main
struct NavigationRouterDestinationTestsApp: App {
    @State var colorManager = ColorManager()

    var body: some Scene {
        WindowGroup {
            Tab().environment(colorManager)
        }
    }
}
