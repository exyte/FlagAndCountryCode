//
//  File.swift
//  
//
//  Created by Alisa Mylnikova on 21.12.2023.
//

import SwiftUI
import FlagAndCountryCode

struct CustomTextField: View {

    @Binding var selectedSegment: Int
    @Binding var currentCountry: CountryFlagInfo

    @State private var text = ""
    private let maxCharCount = 15

    var body: some View {
        HStack {
            currentCountry.getCountryImage(with: FlagType(rawValue: selectedSegment) ?? .roundedRect)
                .frame(width: 30)
            Rectangle()
                .foregroundColor(.divider)
                .frame(width: 0.4, height: 30)
            TextField("", text: $text)
                .keyboardType(.numberPad)
                .padding(.horizontal, 8)
                .font(.custom(FontHelper.ibmPlexMonoRegular, size: 17))
                .foregroundColor(.lightFont)
        }
        .onChange(of: currentCountry) { _, value in
            text = value.dialCode
        }
        .onChange(of: text) { _, value in
            if value.count < currentCountry.dialCode.count {
                text = currentCountry.dialCode
            }
            if value.count > maxCharCount {
                text = String(value.prefix(maxCharCount))
            }
            text = text.filter {"+0123456789".contains($0)}
        }
        .onAppear {
            text = currentCountry.dialCode
        }
        .accentColor(.appOrange)
        .padding()
        .background(.darkBG)
        .cornerRadius(6)
    }
}

