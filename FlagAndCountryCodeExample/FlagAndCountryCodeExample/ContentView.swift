//
//  ContentView.swift
//  Example
//
//  Created by vadim.vitkovskiy on 24.11.2023.
//

import SwiftUI
import FlagAndCountryCode

struct ContentView: View {

    @State private var currentCountry = CountryFlagInfo(code: "", name: "", dialCode: "", languageNative: "", languageEnglish: "")
    @State private var selectedSegment = 0
    @State private var text = ""
    private var allCountries = CountryFlagInfo.all

    var body: some View {
        if !allCountries.isEmpty {
            VStack(alignment: .leading, spacing: 12) {
                HeaderLabel(text: "Flag Type")
                    .padding(.top, 8)
                FlagTypePicker(selectedType: $selectedSegment)
                    .padding(.bottom, 20)

                HeaderLabel(text: "Country flag & country code")
                CustomTextField(selectedSegment: $selectedSegment, currentCountry: $currentCountry)
                    .cornerRadius(16)
                    .padding(.bottom, 20)

                CountriesPicker(allCountries: allCountries, currentCountry: $currentCountry, selectedSegment: $selectedSegment)
                    .padding(.horizontal, -12)
            }
            .padding(12)
            .onAppear {
                if let first = allCountries.first {
                    currentCountry = first
                    text = first.dialCode
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

struct HeaderLabel: View {

    var text: String

    var body: some View {
        Text(text)
            .padding(.horizontal, 5)
            .textCase(.uppercase)
            .foregroundStyle(.divider)
            .font(.custom(FontHelper.chakraPetchMedium, size: 15))
    }
}
