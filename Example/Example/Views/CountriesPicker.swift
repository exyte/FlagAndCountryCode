//
//  CountriesPicker.swift
//  Example
//
//  Created by Alisa Mylnikova on 21.12.2023.
//

import SwiftUI
import FlagAndCountryCode

struct CountriesPicker: View {

    var allCountries: [CountryFlagInfo]
    @Binding var currentCountry: CountryFlagInfo
    @Binding var selectedSegment: Int

    @State var query = ""

    var filteredCountries: [CountryFlagInfo] {
        if query.isEmpty {
            return allCountries
        }
        return allCountries.filter { $0.name.lowercased().contains(query.lowercased()) }
    }

    var body: some View {
        VStack {
            searchField
                .padding(16)
            List(filteredCountries, id: \.self) { country in
                countryCell(country)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        currentCountry = country
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.darkBG)
                    .listRowInsets(EdgeInsets(top: 1, leading: 16, bottom: 1, trailing: 16))
            }
        }
        .padding(.vertical)
        .scrollIndicators(.hidden)
        .listStyle(PlainListStyle())
        .background(.darkBG)
        .cornerRadius(30)
    }

    var searchField: some View {
        HStack(spacing: 16) {
            Image(.search)
            TextField("Search Country", text: $query)
                .font(.custom(FontHelper.chakraPetchRegular, size: 18))
                .foregroundStyle(.lightFont)
                .tint(.appOrange)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 14)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.lightBG)
        }
    }

    func countryCell(_ country: CountryFlagInfo) -> some View {
        HStack {
            country.getCountryImage(with: FlagType(rawValue: selectedSegment) ?? .roundedRect)
                .frame(width: 30)
            Text(country.name)
                .font(.custom(FontHelper.chakraPetchRegular, size: 18))
                .foregroundStyle(.lightFont)
            if currentCountry == country {
                Image(.check)
            }
            Spacer()
            Text(country.dialCode)
                .font(.custom(FontHelper.ibmPlexMonoRegular, size: 14))
                .foregroundStyle(.lightFont)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .overlay {
            if currentCountry == country {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.appOrange.opacity(0.16))
                    .stroke(Color.appOrange, lineWidth: 1)
            }
        }
    }
}
