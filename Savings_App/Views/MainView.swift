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
    
    @EnvironmentObject var vm: MoneyViewModel
    
    @State private var engine: CHHapticEngine?
    
    @State private var bucketPressed: Bool = false
    @State private var daysPressed: Bool = false
    @State private var settingsPressed: Bool = false
    
    var body: some View {
        NavigationView {
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
                
                // MARK: Daily Budget
                ZStack {
                    ForEach(-1000..<Int(vm.money.amount), id: \.self) { index in
                        MoneyView()
                            .stacked(at: index, in: Int(vm.money.amount))
                            .onTapGesture(perform: hapticFeedback)
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
            .background(.gray.opacity(0.1))
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

//HAPTICS
extension MainView {
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func hapticFeedback() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }

        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }

        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MoneyViewModel())
    }
}
