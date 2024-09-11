//
//  View+Ext.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
//

import Foundation
import SwiftUI

@MainActor
extension View {
    func withNavigationDestination() -> some View {
        navigationDestination(for: RouterDestination.self) { destination in
            createView(destination: destination)
        }
    }

    func withSheetDestinations(sheetDestinations: Binding<SheetDestination?>) -> some View {
        sheet(item: sheetDestinations) { destination in
            switch destination {
            case .colorSheet(color: let color, colorName: let name):
                Rectangle().fill(color)
                    .overlay {
                        VStack {
                            Text(name)
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            ComponentsSquares { _ in }
                                .frame(maxHeight: 100)
                        }
                    }
            }
        }
    }
}

extension View {
    @ViewBuilder
    func createView(destination: RouterDestination) -> some View {
        switch destination {
        case .colorPage(colorObject: let colorObject, let isNewColor):
            ContentView(
                pageTitle: colorObject.title,
                pageDescription: colorObject.description,
                selectedColor: colorObject.color,
                isNewColor: isNewColor)
            .navigationTitle(colorObject.title)
        }
    }
}
