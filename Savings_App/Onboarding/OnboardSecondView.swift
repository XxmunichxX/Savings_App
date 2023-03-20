//
//  OnboardSecondView.swift
//  Savings_App
//
//  Created by Francesco Monaco on 22/02/23.
//

import SwiftUI

struct OnboardSecondView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    func bgColor() -> Color {
        return colorScheme == .light ? .theme.ligthBG : .black
    }
    
    var body: some View {
        ZStack {
            bgColor().ignoresSafeArea()
            VStack {
                Text("SET YOUR DAILY BUDGET TRYING TO NOT EXCEED IT")
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .padding()
                
                Text("ADD YOUR DESIRED PURCHASES IN THE BUCKETLIST AND SAVE YOUR MONEY TO BE ABLE TO BUY THEM")
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .padding()
                
                // DISMISS OB 
                Button(action: { }) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .overlay {
                            Text("LET'S START SAVING")
                                .foregroundColor(colorScheme == .light ? .white : .black)
                                .font(.title2)
                                .fontWeight(.heavy)
                                .bold()
                        }
                        .padding()
                }

            }
        }
    }
}

struct OnboardSecondView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardSecondView()
    }
}
