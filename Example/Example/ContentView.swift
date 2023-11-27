//
//  ContentView.swift
//  Example
//
//  Created by vadim.vitkovskiy on 24.11.2023.
//

import SwiftUI
import CountryFlag

struct CustomTextField: View {

    @Binding var selectedSegment: Int
    @Binding var currentCountry: CountryFlag
    private let maxCharCount = 15
    @State var text = ""

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
            text = value.countryDialCode
        }
        .onChange(of: text) { value in
            if value.count < currentCountry.countryDialCode.count {
                text = currentCountry.countryDialCode
            }
            if value.count > maxCharCount {
                text = String(value.prefix(maxCharCount))
            }
            text = text.filter {"+0123456789".contains($0)}
        }
        .onAppear(perform: {
            text = currentCountry.countryDialCode
        })
        .padding()
        .background(Color(.white))
        .cornerRadius(6)
    }
}

struct ListOfCountries: View {
    var allCountries: [CountryFlag]
    @Binding var currentCountry: CountryFlag
    @Binding var selectedSegment: Int

    var body: some View {
        VStack {
            Picker(selection: $currentCountry, label: Text("")) {
                ForEach(allCountries, id: \.self) { country in
                    HStack {
                        country.getCountryImage(with: FlagType(rawValue: selectedSegment) ?? .roundedRect)
                            .frame(width: 30)
                        Text(country.countryName)
                        Text(country.countryDialCode)
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
    @State var currentCountry: CountryFlag
    @State private var selectedSegment = 0
    @State private var text = ""
    private var allCountries = CountryFlags().all

    init() {
        currentCountry = allCountries.first ?? CountryFlag.defaultValue
    }

    var body: some View {
        VStack {
            Text("Flag Type")
                .font(.title2)

            VStack(spacing: 30) {
                FlagTypePicker(selectedSegment: $selectedSegment)
                VStack {
                    CustomTextField(selectedSegment: $selectedSegment, currentCountry: $currentCountry)
                    ListOfCountries(allCountries: allCountries, currentCountry: $currentCountry, selectedSegment: $selectedSegment)
                    Spacer()
                }
            }

        }
        .onAppear(perform: {
            currentCountry = allCountries.first ?? CountryFlag.defaultValue
            text = currentCountry.countryDialCode
        })
        .padding()
    }
}

