//
//  Savings_AppApp.swift
//  Savings_App
//
//  Created by Francesco Monaco on 29/01/23.
//

import SwiftUI

@main
struct Savings_AppApp: App {
    
    @StateObject var vm = MoneyViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(MoneyViewModel())
        }
    }
}
