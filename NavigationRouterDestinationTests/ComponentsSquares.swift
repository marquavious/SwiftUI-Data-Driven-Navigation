//
//  ComponentsSquares.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
//

import Foundation
import SwiftUI

let squareSize: CGFloat = 10

struct Square: View {
    var color: Color

    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .frame(width: squareSize, height: squareSize, alignment: .center)
            .foregroundColor(color)
    }
}

struct ComponentsSquares: View {
    @Environment(ColorManager.self) var colorManager

    var onTap: (ColorObject) -> Void

    let rows = [
        GridItem(.fixed(squareSize), spacing: 1, alignment: .center),
        GridItem(.fixed(squareSize), spacing: 1, alignment: .center)
    ]
    var body: some View {
        LazyHGrid(rows: rows, alignment: .center, spacing: 1, pinnedViews: [], content: {
            ForEach(colorManager.colors) { colorObject in
                Square(color: colorObject.color)
                    .onTapGesture {
                        onTap(colorObject)
                    }
            }
        })
    }
}
