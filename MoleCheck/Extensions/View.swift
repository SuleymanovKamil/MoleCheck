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


struct Center: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

extension View {
    func centerView() -> some View {
        self
            .modifier(Center())
    }
}
