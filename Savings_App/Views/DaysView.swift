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
    
    @State private var currentMonth = Date()
    
    /// create a variable to check if the budget was respected that day
    @State var wasRespected: Bool = false
    
    /// clicking on the day -> see more details for that day as how much
    /// we went beyond the budget or we saved
    
    var body: some View {
        NavigationView {
            VStack {
                // title
                Text("CALENDAR")
                    .fontWeight(.heavy)
                    .font(.system(size: 40))
                Spacer()
                /// here create something like ForEach day in daysInCalendar
                /// and build the view
                HStack {
                    VStack {
                        Text("\(currentMonth, format: Date.FormatStyle().month())")
                            .fontWeight(.heavy)
                            .font(.system(size: 22))
                        Text("\(currentMonth, format: Date.FormatStyle().day())")
                            .font(.system(size: 50))
                            .fontWeight(.heavy)
                            .foregroundColor(wasRespected ? .green : .red)
                        
                    }
                    .padding()
                    Spacer()
                }
                Spacer(minLength: 600) // this has to be done with Geometry
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
