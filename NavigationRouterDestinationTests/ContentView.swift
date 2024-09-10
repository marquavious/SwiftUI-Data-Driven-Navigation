//
//  ContentView.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(RouterPath.self) private var routerPath

    var pageTitle: String
    var pageDescription: String
    var backgroundColor: Color

    var body: some View {
        ZStack {
            backgroundColor
            VStack(spacing: 18) {
                VStack {
                    Text(pageTitle)
                    Text(pageDescription)
                    if let previousPageTitle = routerPath.previousPage?.title {
                        Text("I came from the \(previousPageTitle)")
                    }

                    Button {
                        // Implment sheet
                    } label: {
                        Text("Show Sheet")
                    }
                    .buttonStyle(.bordered)
                }

                HStack {
                    ForEach(RouterDestination.allSetCases) { destination in
                        Button {
                            routerPath.navigate(to: destination)
                        } label: {
                            Text(destination.title)
                                .foregroundStyle(.white)
                                .font(.caption)
                                .padding([.vertical], 2)
                                .fontWeight(.bold)
                        }
                        .buttonStyle(.bordered)
                        .background(destination.color)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .frame(height: 30)
                    }
                }

                Button {
                    routerPath.navigate(to: .customPage(color: Color.random, description: String.random(length: 5)))
                } label: {
                    Text("Click Here To Go To Custom")
                        .foregroundStyle(.white)
                        .font(.caption)
                        .padding([.vertical], 2)
                        .fontWeight(.bold)
                }
                .buttonStyle(.bordered)
                .background(Color.pink)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(height: 30)


                Button {
                    routerPath.popToRoot()
                } label: {
                    Text("Click Here To Pop To Root")
                        .foregroundStyle(.white)
                        .font(.caption)
                        .padding([.vertical], 2)
                        .fontWeight(.bold)
                }
                .buttonStyle(.bordered)
                .background(Color.pink)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(height: 30)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Tab()
}

enum RouterDestination: Identifiable, Hashable {
    static var allSetCases = [Self.redPage,
                           Self.bluePage,
                           Self.yellowPage,
                           Self.greenPage]

    case redPage
    case bluePage
    case yellowPage
    case greenPage
    case customPage(color: Color, description: String)

    var id: String {
        title
    }

    var title: String {
        switch self {
        case .redPage:
            "Red Page"
        case .bluePage:
            "Blue Page"
        case .yellowPage:
            "Yello Page"
        case .greenPage:
            "Green Page"
        case .customPage:
            "Custom Color"
        }
    }

    var description: String {
        switch self {
        case .redPage:
            "Red Page Description"
        case .bluePage:
            "Blue Page Description"
        case .yellowPage:
            "Yello Page Description"
        case .greenPage:
            "Green Page Description"
        case .customPage(_, let description):
            description
        }
    }

    var color: Color {
        switch self {
        case .redPage:
                .red
        case .bluePage:
                .blue
        case .yellowPage:
                .yellow
        case .greenPage:
                .green
        case .customPage(color: let color, _):
            color
        }
    }
}

@MainActor
@Observable public class RouterPath {

    var path: [RouterDestination] = [] {
        didSet {
            previousPage = path.last
        }
    }
    var previousPage: RouterDestination?

    nonisolated init() {}

    func navigate(to: RouterDestination) {
        path.append(to)
    }

    func popToRoot() {
        path = []
        previousPage = nil
    }
}

@MainActor
struct Tab: View {
    @State var routerPath = RouterPath()

    var body: some View {
        NavigationStack(path: $routerPath.path) {
            ContentView(
                pageTitle: "Init",
                pageDescription: "Init",
                backgroundColor: .orange
            )
            .withAppRouter()
        }.environment(routerPath)
    }
}

@MainActor
extension View {
    func withAppRouter() -> some View {
        navigationDestination(for: RouterDestination.self) { destination in
            createView(destination: destination)
        }
    }
}

extension View {
    @ViewBuilder
    func createView(destination: RouterDestination) -> some View {
        ContentView(
            pageTitle: destination.title,
            pageDescription: destination.description,
            backgroundColor: destination.color
        )
        .navigationTitle(destination.title)
    }
}

extension Color {
    static var random: Color {
        return [.red, .yellow, .blue, .cyan, .purple, .pink, .orange].randomElement()!
    }
}

extension String {
    static func random(length: Int, using characters: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") -> String {
        return (0..<length).map { _ in characters.randomElement()!.lowercased() }.joined()
    }
}
