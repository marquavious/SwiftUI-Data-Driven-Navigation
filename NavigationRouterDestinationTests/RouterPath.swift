//
//  RouterPath.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
//

import Foundation

@MainActor
@Observable public class RouterPath {

    var path: [RouterDestination] = [] {
        didSet {
            previousPage = oldValue.last
        }
    }

    var previousPage: RouterDestination?
    var sheet: SheetDestination?

    nonisolated init() {}

    func navigate(to: RouterDestination) {
        path.append(to)
    }

    func popToRoot() {
        path = []
        previousPage = nil
    }

    func clearSheet() {
        sheet = nil
    }
}
