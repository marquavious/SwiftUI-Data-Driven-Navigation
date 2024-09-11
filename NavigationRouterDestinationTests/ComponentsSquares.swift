//
//  ComponentsSquares.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
//

import Foundation
import SwiftUI

struct ComponentsSquares: View {
    @Environment(ColorManager.self) var colorManager

    var onTap: (ColorObject) -> Void

    let rows = [
        GridItem(.fixed(30), spacing: 1, alignment: .center),
        GridItem(.fixed(30), spacing: 1, alignment: .center)
    ]

    var body: some View {
        LazyHGrid(rows: rows, alignment: .center, spacing: 1, pinnedViews: [], content: {
            ForEach(colorManager.colors) { colorObject in
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(colorObject.color)

                    .onTapGesture {
                        onTap(colorObject)
                    }
            }
        })
    }
}
