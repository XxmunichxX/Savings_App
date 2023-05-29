//
//  OnboardingTabView.swift
//  Savings_App
//
//  Created by Francesco Monaco on 22/02/23.
//

import SwiftUI

struct OnboardingTabView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView {
            OnboardFirstView()
            OnboardSecondView()
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .background( colorScheme == .light ? Color.theme.ligthBG : .black).ignoresSafeArea()
    }
}

struct OnboardingTabView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTabView()
            .environmentObject(Logic())
            .environmentObject(MoneyViewModel())
            .environmentObject(ItemViewModel())
    }
}
