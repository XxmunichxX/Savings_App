//
//  Savings_AppApp.swift
//  Savings_App
//
//  Created by Francesco Monaco on 29/01/23.
//

import SwiftUI

@main
struct Savings_AppApp: App {
    
    @StateObject var moneyVM = MoneyViewModel()
    @StateObject var itemVM = ItemViewModel()
    
    var body: some Scene {
        WindowGroup {
            /// if onboarding {
            ///  OnboardingTableView()
            /// }  else  {
            MainView()
                .environmentObject(MoneyViewModel())
                .environmentObject(ItemViewModel())
        }
    }
}
