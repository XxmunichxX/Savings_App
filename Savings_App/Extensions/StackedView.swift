//
//  StackedView.swift
//  Savings_App
//
//  Created by Francesco Monaco on 30/01/23.
//

import Foundation
import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        var offset:Double {
            if Double(total - position) > 3 {
                return 3
            }
            return Double(total - position)
            }
        return self.offset(x: 0, y: offset * 10)
    }
}
