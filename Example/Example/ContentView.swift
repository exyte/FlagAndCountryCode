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
            Rectangle()
                .foregroundColor(.accentColor1)
                .frame(width: 0.4, height: 30)
            TextField("", text: $text)
                .keyboardType(.numberPad)
                .padding(.horizontal, 8)
                .font(.custom(FontHelper.ibmPlexMonoRegular.rawValue, size: 17))
                .foregroundColor(.accentColor3)
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
        .accentColor(.accentColor4)
        .padding()
        .background(.accentColor2)
        .cornerRadius(6)
    }
}

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
            ZStack {
                HStack(spacing: 0) {
                    ForEach(0..<types.count, id: \.self) { i in
                        HStack {
                            Text(types[i].displayName)
                                .textCase(.uppercase)
                                .foregroundStyle(selectedIndex == i ? .background : .accentColor3)
                                .foregroundStyle(.accentColor3)
                                .font(.custom(FontHelper.chakraPetchMedium.rawValue, size: 15))
                        }
                        .frame(width: g.size.width / 3 - 18)
                        .padding(.horizontal, horPadding)
                        .padding(.vertical, 14)
                        .background {
                            if selectedIndex == i {
                                Capsule().fill(.accentColor4)
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

            }
            .frame(width: g.size.width)
            .background(.accentColor2)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay (
                RoundedRectangle(cornerRadius: 24)
                    .stroke(.accentColor1, lineWidth: 1)
            )
        }
        .frame(height: 42)
    }
}

struct CountriesPicker: View {

    var allCountries: [CountryFlagInfo]
    @Binding var currentCountry: CountryFlagInfo
    @Binding var selectedSegment: Int

    var body: some View {
        List(allCountries, id: \.self) { country in
            HStack {
                country.getCountryImage(with: FlagType(rawValue: selectedSegment) ?? .roundedRect)
                    .frame(width: 30)
                Text(country.name)
                    .font(.custom(FontHelper.chakraPetchRegular.rawValue, size: 18))
                    .foregroundStyle(.accentColor3)
                Spacer()
                Text(country.dialCode)
                    .font(.custom(FontHelper.ibmPlexMonoRegular.rawValue, size: 14))
                    .foregroundStyle(.accentColor3)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                currentCountry = country
            }
            .listRowSeparator(.hidden)
            .listRowBackground(currentCountry == country ? .accentColor2 : Color.clear)
        }
        .padding(.vertical)
        .scrollIndicators(.hidden)
        .listStyle(PlainListStyle())
        .overlay (
            LinearGradient(gradient: Gradient(colors: [.gradient.opacity(0.9),
                                                       .gradient.opacity(0),
                                                       .gradient.opacity(0.9)]),
                           startPoint: .top, endPoint: .bottom)
            .allowsHitTesting(false)
        )
        .background(.gradient)
        .cornerRadius(30)
    }
}

struct ContentView: View {

    @State private var currentCountry = CountryFlagInfo(code: "", name: "", dialCode: "")
    @State private var selectedSegment = 0
    @State private var text = ""
    private var allCountries = CountryFlagInfo.all

    var body: some View {
        if !allCountries.isEmpty {
            VStack(alignment: .leading) {
                HeaderLabel(text: "Flag Type")
                    .padding(.top, 8)
                FlagTypePicker(selectedType: $selectedSegment)
                    .padding(.bottom, 40)
                HeaderLabel(text: "Country flag & country code")
                CustomTextField(selectedSegment: $selectedSegment, currentCountry: $currentCountry)
                    .cornerRadius(16)
                CountriesPicker(allCountries: allCountries, currentCountry: $currentCountry, selectedSegment: $selectedSegment)
                    .padding(.top, 32)
            }
            .padding(12)
            .onAppear {
                if let first = allCountries.first {
                    currentCountry = first
                    text = first.dialCode
                }
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
            .foregroundStyle(.accentColor1)
            .font(.custom(FontHelper.chakraPetchMedium.rawValue, size: 15))
    }
}
