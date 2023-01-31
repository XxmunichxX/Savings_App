//
//  MoneyView.swift
//  Savings_App
//
//  Created by Francesco Monaco on 30/01/23.
//

import SwiftUI

struct MoneyView: View {
    
    @EnvironmentObject var vm: MoneyViewModel
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var offset = CGSize.zero
    
    let money: Money
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(maxWidth: .infinity)
            .frame(height: 250)
            .foregroundColor(colorScheme == .light ? .white : .black)
            .overlay {
                Text("$")
                    .fontWeight(.heavy)
                    .font(.system(size: 40))
                    .offset(x:150, y: -90)
            }
            .overlay {
                Text(String(format: "%.2f", money.amount))
                    .fontWeight(.heavy)
                    .font(.system(size: 100))
            }
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(colorScheme == .light ? .black : .white, lineWidth: 8)
            }
            .rotationEffect(.degrees(Double(offset.width / 5)))
            .offset(x: offset.width * 5, y: 0)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
                    .onEnded { _ in
                        swipeMoney(width: offset.width)
                    }
            )
            .padding()
    }
    
    func swipeMoney(width: CGFloat) {
            switch width {
            case -500...(-50):
                offset = CGSize(width: -500, height: 0)
                vm.money.amount -= 1
            case 50...500:
                offset = CGSize(width: 500, height: 0)
                vm.money.amount += 1
            default:
                offset = .zero
            }
        }
}

struct MoneyView_Previews: PreviewProvider {    
    static var previews: some View {
        MoneyView(money: Money.example)
            .environmentObject(MoneyViewModel())
    }
}
