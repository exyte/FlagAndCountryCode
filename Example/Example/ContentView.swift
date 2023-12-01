//
//  ContentView.swift
//  Example
//
//  Created by vadim.vitkovskiy on 24.11.2023.
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
            Divider()
                .frame(height: 15)
            TextField("", text: $text)
                .keyboardType(.numberPad)
                .foregroundColor(.black)
        }
        .onChange(of: currentCountry) { value in
            text = value.dialCode
        }
        .onChange(of: text) { value in
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
        .padding()
        .background(Color.white)
        .cornerRadius(6)
    }
}

struct CountriesPicker: View {

    var allCountries: [CountryFlagInfo]
    @Binding var currentCountry: CountryFlagInfo
    @Binding var selectedSegment: Int

    var body: some View {
        VStack {
            Picker(selection: $currentCountry, label: Text("")) {
                ForEach(allCountries, id: \.self) { country in
                    HStack {
                        country.getCountryImage(with: FlagType(rawValue: selectedSegment) ?? .roundedRect)
                            .frame(width: 30)
                        Text(country.name)
                        Text(country.dialCode)
                    }
                }
            }
            .pickerStyle(.wheel)
        }
    }
}

struct FlagTypePicker: View {

    @Binding var selectedSegment: Int

    var body: some View {
        VStack {
            Picker(selection: $selectedSegment, label: Text("")) {
                ForEach(0 ..< FlagType.allCases.count, id: \.self) { index in
                    Text(FlagType(rawValue: index)?.displayName ?? "")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct ContentView: View {

    @State private var currentCountry = CountryFlagInfo(code: "", name: "", dialCode: "")
    @State private var selectedSegment = 0
    @State private var text = ""
    private var allCountries = CountryFlagInfo.all

    var body: some View {
        if !allCountries.isEmpty {
            VStack {
                Text("Flag Type")
                    .font(.title2)

                VStack {
                    FlagTypePicker(selectedSegment: $selectedSegment)
                        .padding(.bottom, 20)
                    CustomTextField(selectedSegment: $selectedSegment, currentCountry: $currentCountry)
                    CountriesPicker(allCountries: allCountries, currentCountry: $currentCountry, selectedSegment: $selectedSegment)
                    Spacer()
                }
            }
            .onAppear {
                if let first = allCountries.first {
                    currentCountry = first
                    text = first.dialCode
                }
            }
            .padding()
        }
    }
}

