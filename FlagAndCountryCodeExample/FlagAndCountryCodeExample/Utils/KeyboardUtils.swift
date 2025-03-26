//
//  KeyboardUtils.swift
//  Example
//
//  Created by Alisa Mylnikova on 21.12.2023.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
