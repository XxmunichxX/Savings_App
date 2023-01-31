//
//  ExtensionView.swift
//  Savings_App
//
//  Created by Francesco Monaco on 30/01/23.
//

import Foundation
import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}
