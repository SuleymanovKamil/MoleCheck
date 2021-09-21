//
//  View.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

struct Leading: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
        }
        .padding(.leading, 20)
    }
}

extension View {
    func leadingView() -> some View {
        self
            .modifier(Leading())
    }
}

struct Backround: ViewModifier{
    func body(content: Content) -> some View {
        content
        .background(Color.colors.background.cornerRadius(18)
        .shadow(color: Color.colors.black.opacity(0.1), radius: 16))
    }
}


extension View {
    func mainBackground() -> some View {
        self
            .modifier(Backround())
    }
}


struct RectangleFrame: ViewModifier{
    func body(content: Content) -> some View {
        content
        .frame(width: screen.width - 30, height: 114)
    }
}


extension View {
    func rectangleFrame() -> some View {
        self
            .modifier(RectangleFrame())
    }
}
