//
//  DaysView.swift
//  Savings_App
//
//  Created by Francesco Monaco on 29/01/23.
//

import SwiftUI

struct DaysView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Text("DAYS")
                    .fontWeight(.heavy)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {dismiss.callAsFunction()}) {
                    Text("Back")
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .fontWeight(.heavy)
                }
            }
        }

    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView()
    }
}
