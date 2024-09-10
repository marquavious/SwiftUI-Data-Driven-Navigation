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

    var body: some Scene {
        WindowGroup {
            Tab()
        }
    }
}

extension View {
    @ViewBuilder
    func createView(destination: RouterDestination) -> some View {
        ContentView(
            pageTitle: destination.title, 
            pageDescription: "Wow",
            backgroundColor: destination.color
        )
    }
}
