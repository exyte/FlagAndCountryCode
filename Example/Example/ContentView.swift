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
    @State var text = ""

    var body: some View {
        HStack {
            HStack {
                currentCountry.getCountryImage(with: FlagType(rawValue: selectedSegment) ?? .roundedRect)
                    .frame(width: 30)
                Divider()
                    .frame(height: 15)
            }
            TextField(".", text: $text)
                .foregroundColor(.black)
        }
        .onChange(of: currentCountry) { value in
            text = value.countryDialCode
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
    @Binding var allCountries: [CountryFlag]
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
    @State var allCountries = CountryFlags().all
    @State var currentCountry: CountryFlag?
    @State private var selectedSegment = 0
    @State private var text = ""

    var body: some View {
        VStack {
            Text("Flag Type")
                .font(.title2)

            VStack(spacing: 30) {
                FlagTypePicker(selectedSegment: $selectedSegment)
                VStack {
                    CustomTextField(selectedSegment: $selectedSegment, currentCountry: $currentCountry.toUnwrapped(defaultValue: allCountries[0]))
                    ListOfCountries(allCountries: $allCountries, currentCountry: $currentCountry.toUnwrapped(defaultValue: allCountries[0]), selectedSegment: $selectedSegment)
                    Spacer()
                }
            }

        }
        .onAppear(perform: {
            currentCountry = allCountries[0]
            text = currentCountry?.countryDialCode ?? ""
        })
        .padding()
    }
}

