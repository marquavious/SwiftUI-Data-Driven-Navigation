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

    @State var pageTitle: String
    @State var pageDescription: String
    @State var backgroundColor: Color

    var body: some View {
        ZStack {
            backgroundColor
            VStack(spacing: 18) {
                VStack {
                    Text("Page: \(pageTitle)")
                    Text("Nice Color Pick. I like \(pageDescription), too!")

                    Button {
                         // Implment sheet
                    } label: {
                        Text("Show Sheet")
                    }
                    .buttonStyle(.bordered)
                }

                HStack {
                    ForEach(RouterDestination.allCases) { destination in
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
    }
}

#Preview {
    Tab()
}

enum RouterDestination: Identifiable, Hashable, CaseIterable {
    static var allCases = [Self.redPage,
                           Self.bluePage,
                           Self.yellowPage,
                           Self.greenPage]

    case redPage
    case bluePage
    case yellowPage
    case greenPage
//    case customPage(color: Color)

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
//        case .customPage(_):
//            "Custom Color"
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
//        case .customPage(color: let color):
//            color
        }
    }
}

@MainActor
@Observable public class RouterPath {

    var path: [RouterDestination] = []

    nonisolated init() {}

    func navigate(to: RouterDestination) {
      path.append(to)
    }

    func popToRoot() {
        path = []
    }

}

@MainActor
struct Tab: View {
    @State var routerPath = RouterPath()

    var body: some View {
        NavigationStack(path: $routerPath.path) {
            ContentView(
                pageTitle: "Init", 
                pageDescription: "Init Tab",
                backgroundColor: .white
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
