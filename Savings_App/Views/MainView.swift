//
//  MainView.swift
//  Savings_App
//
//  Created by Francesco Monaco on 29/01/23.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var vm: MoneyViewModel
    
    @State var bucketPressed: Bool = false
    @State var daysPressed: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("APP NAME")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                // MARK: Daily Budget
                ZStack {
                    ForEach(0..<Int(vm.money.amount), id: \.self) { index in
                        MoneyView(money: vm.money)
                            .stacked(at: index, in: Int(vm.money.amount))
                            .padding(.vertical)
                    }
                }
                
                HStack {
                    customButton(label: "Days",
                                 action: {daysPressed.toggle()},
                                 destination: DaysView(),
                                 isActive: $daysPressed)
                    customButton(label: "Bucket List",
                                 action: {bucketPressed.toggle()},
                                 destination: BucketListView(),
                                 isActive: $bucketPressed)
                }
                
                Button(action: {}) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .overlay {
                            Text("SET DAILY BUDGET")
                                .foregroundColor(colorScheme == .light ? .white : .black)
                                .font(.title2)
                                .fontWeight(.heavy)
                                .bold()
                        }
                        .padding()
                }
            }
            .background(.gray.opacity(0.1))
        }
    }
}

extension MainView {
    @ViewBuilder
    func customButton(label: String, action: @escaping ()->(), destination: some View, isActive: Binding<Bool>) -> some View {
        NavigationLink(destination: destination, isActive: isActive) {
            Button(action: action) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
                    .foregroundColor(colorScheme == .light ? .white : .black)
                    .shadow(color: colorScheme == .light ? .black : .white,
                            radius: 0,
                            x: 11,
                            y: 10)
                    .overlay {
                        Text(label)
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .fontWeight(.heavy)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(colorScheme == .light ? .black : .white, lineWidth: 5)
                    }
                    .padding()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MoneyViewModel())
    }
}
