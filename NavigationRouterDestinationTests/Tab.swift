//
//  Tab.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
//

import Foundation
import SwiftUI

@MainActor
struct Tab: View {
    @State var routerPath = RouterPath()

    var body: some View {
        NavigationStack(path: $routerPath.path) {
            ContentView()
                .withNavigationDestination()
        }
        .withSheetDestinations(sheetDestinations: $routerPath.sheet)
        .environment(routerPath)
        .accentColor(.white)
    }
}
