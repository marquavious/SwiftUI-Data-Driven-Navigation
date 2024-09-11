//
//  String+Ext.swift
//  NavigationRouterDestinationTests
//
//  Created by Marquavious Draggon on 9/10/24.
//

import Foundation

extension String {
    static func random(length: Int, using characters: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") -> String {
        return (0..<length).map { _ in characters.randomElement()!.uppercased() }.joined()
    }
}
