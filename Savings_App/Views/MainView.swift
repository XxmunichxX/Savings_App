//
//  MainView.swift
//  Savings_App
//
//  Created by Francesco Monaco on 29/01/23.
//

import SwiftUI
import CoreHaptics

struct MainView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var vm = MoneyViewModel()
    @EnvironmentObject var logic: Logic
    
    @State private var bucketPressed: Bool = false
    @State private var daysPressed: Bool = false
    @State private var settingsPressed: Bool = false
    
    var body: some View {
        ZStack {
            OnboardingTabView()
                .opacity(logic.onboardingDone ? 0 : 1)
            
            NavigationStack {
                VStack(alignment: .leading) {
                    Text("MY DAILY")
                        .foregroundColor(colorScheme == .light ? .white : .black)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .shadow(color: colorScheme == .light ? .black : .white,
                                radius: 0,
                                x: 4,
                                y: 8)
                        .padding()
                    
                    Spacer()
                    
                    
                    ZStack {
                        ForEach(-1000..<Int(vm.money.amount), id: \.self) { index in
                            MoneyView()
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
                    
                    Button(action: { vm.addAmount(add: 10)}) {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .overlay {
                                Text("ADD DAILY BUDGET")
                                    .foregroundColor(colorScheme == .light ? .white : .black)
                                    .font(.title2)
                                    .fontWeight(.heavy)
                                    .bold()
                            }
                            .padding()
                    }
                }
                .background(colorScheme == .light ? .orange.opacity(0.5) : .black)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView(), isActive: $settingsPressed) {
                            Button(action: {settingsPressed.toggle()}) {
                                Image(systemName: "gear.circle.fill")
                                    .foregroundColor(colorScheme == .light ? .black : .white)
                                    .font(.system(size: 25))
                            }
                        }
                    }
                }
            }
            .opacity(logic.onboardingDone ? 1 : 0)
        }
    }
}

//CUSTOM BUTTONS
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
            .environmentObject(ItemViewModel())
            .environmentObject(Logic())
    }
}
