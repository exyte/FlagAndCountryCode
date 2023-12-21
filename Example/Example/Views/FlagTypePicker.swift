//
//  FlagTypePicker.swift
//  Example
//
//  Created by Alisa Mylnikova on 21.12.2023.
//

import SwiftUI
import FlagAndCountryCode

struct FlagTypePicker: View {

    @Binding var selectedType: Int
    @Namespace var namespace
    @State var selectedIndex = 0
    @State private var animationsRunning = false

    private let types = FlagType.allCases
    private let horPadding = 8.0
    private let selectedWidth = 80.0

    var body: some View {
        GeometryReader { g in
            HStack(spacing: 0) {
                ForEach(0..<types.count, id: \.self) { i in
                    HStack {
                        Text(types[i].displayName)
                            .textCase(.uppercase)
                            .foregroundStyle(selectedIndex == i ? .darkFont : .lightFont)
                            .foregroundStyle(.lightFont)
                            .font(.custom(FontHelper.chakraPetchMedium, size: 15))
                    }
                    .frame(width: g.size.width / 3 - 18)
                    .padding(.horizontal, horPadding)
                    .padding(.vertical, 14)
                    .background {
                        if selectedIndex == i {
                            Capsule().fill(.appOrange)
                                .frame(height: 41)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.spring(.snappy(extraBounce: 0.3))) {
                            selectedIndex = i
                            selectedType = i
                            animationsRunning.toggle()
                        }
                    }
                }
            }
            .frame(width: g.size.width)
            .background(.darkBG)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay (
                RoundedRectangle(cornerRadius: 24)
                    .stroke(.divider, lineWidth: 1)
            )
        }
        .frame(height: 42)
    }
}

