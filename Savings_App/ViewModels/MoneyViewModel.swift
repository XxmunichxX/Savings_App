//
//  MoneyViewModel.swift
//  Savings_App
//
//  Created by Francesco Monaco on 30/01/23.
//

import Foundation

class MoneyViewModel: ObservableObject {
    @Published var money = Money()
    
    func addAmount(add amount: Double) {
        money.amount += amount
    }
}
