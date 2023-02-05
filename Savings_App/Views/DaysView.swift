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
    
    @EnvironmentObject var vm: MoneyViewModel
    
    var currentMonth = Date()
    
    var wasRespected: Bool {
        vm.money.amount <= 0 ? false : true
    }
    
    /// clicking on the day -> see more details for that day as how much
    /// we went beyond the budget or we saved
    
    ///to find the day = currentDate.filter and search just for the first number available

    var body: some View {
        NavigationView {
            VStack {
                /// here create something like ForEach day in daysInCalendar
                /// and build the view maybe using LazyGrid
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
        .navigationTitle("CALENDAR")
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
            .environmentObject(MoneyViewModel())
    }
}
