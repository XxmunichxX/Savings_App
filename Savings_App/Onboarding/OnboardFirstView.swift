//
//  OnboardFirstView.swift
//  Savings_App
//
//  Created by Francesco Monaco on 22/02/23.
//

import SwiftUI

struct OnboardFirstView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    func bgColor() -> Color {
        return colorScheme == .light ? .theme.ligthBG : .black
    }
    
    var body: some View {
        ZStack {
            bgColor().ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("WELCOME TO MYDAILY")
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .font(.system(size: 55))
                    .fontWeight(.heavy)
                    .padding()
                
                Text("THE APP THAT HELPS YOU TO SAVE YOUR MONEY AND REACH YOUR GOALS")
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .padding()
            }
        }
    }
}

struct OnboardFirstView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardFirstView()
    }
}
