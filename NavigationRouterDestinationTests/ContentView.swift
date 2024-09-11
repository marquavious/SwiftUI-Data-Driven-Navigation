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
    @Environment(ColorManager.self) var colorManager

    @State var pageTitle: String = "Select Color"
    @State var pageDescription: String = "Page description will go here..."
    @State var previousPageText: String = ""
    @State var selectedColor: Color = .white
    @State var randomColorButtonColor: Color = Color.random()
    @State var shouldShowPopToRootButton: Bool = false
    @State var isNewColor: Bool = false

    var body: some View {
        ZStack {
            selectedColor
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 18) {
                Button {
                    routerPath.sheet = .colorSheet(color: selectedColor, colorName: pageTitle)
                } label: {
                    Text("Show Sheet")
                        .fontWeight(.semibold)
                }
                .buttonStyle(.bordered)

                HStack {
                    ForEach(colorManager.colors.prefix(4)) { colorObject in
                        Button {
                            routerPath.navigate(to: .colorPage(colorObject: colorObject))
                        } label: {
                            Text("\(colorObject.title) Page")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .padding([.vertical], 2)
                                .fontWeight(.semibold)
                        }
                        .buttonStyle(.bordered)
                        .background(colorObject.color)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .frame(height: 30)
                    }
                }

                Button {
                    let newColorObject = ColorObject(
                        id: UUID().uuidString,
                        title: String.random(length: 5),
                        description: "HERE IS A CUSTOM COLOR !",
                        color: randomColorButtonColor
                    )
                    colorManager.addColor(coclorObject: newColorObject)
                    routerPath.navigate(to: .colorPage(colorObject: newColorObject, isNewColor: true))
                    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                } label: {
                    Text("Click here to make a New Color 👀")
                        .foregroundStyle(.white)
                        .font(.caption)
                        .padding([.vertical], 2)
                        .fontWeight(.bold)
                }
                .buttonStyle(.bordered)
                .background(randomColorButtonColor)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(height: 30)

                Button {
                    routerPath.popToRoot()
                } label: {
                    Text("Pop To Root")
                        .foregroundStyle(.white)
                        .font(.caption)
                        .padding([.vertical], 2)
                        .fontWeight(.bold)
                }
                .buttonStyle(.bordered)
                .background(Color.pink)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(height: 30)
                .opacity(shouldShowPopToRootButton ? 1 : 0)

                ComponentsSquares { colorObject in
                    routerPath.navigate(to: .colorPage(colorObject: colorObject))
                }.frame(maxWidth: UIScreen.main.bounds.width)
            }
        }
        .overlay(alignment: .topLeading) {
            VStack(alignment: .leading) {
                Text(pageDescription)
                Text(previousPageText)
            }
            .italic()
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding([.horizontal], 16)
        }
        .onAppear {
            if let previousPage = routerPath.previousPage {
                switch previousPage {
                case .colorPage(colorObject: let colorObject, _):
                    previousPageText = "...I came from the \(colorObject.title) Page..."
                }
            }
            shouldShowPopToRootButton = !routerPath.path.isEmpty
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        }
        .navigationTitle(isNewColor ? "✨ \(pageTitle) ✨" : pageTitle)
        .toolbarRole(.editor)
    }
}

#Preview {
    Tab().environment(ColorManager())
}

