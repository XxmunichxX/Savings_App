//
//  AddItemView.swift
//  Savings_App
//
//  Created by Francesco Monaco on 21/03/23.
//

import SwiftUI

struct AddItemView: View {
    
    @EnvironmentObject var itemVM: ItemViewModel
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var itemName: String = ""
    @State private var itemValue: String = ""
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 55)
                .foregroundColor(colorScheme == .light ? .white : .black)
                .shadow(color: colorScheme == .light ? .black : .white, radius: 0, x: 7, y: 8)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 3)
                }
                .overlay {
                    TextField("Item name...", text: $itemName, axis: .vertical)
                        .submitLabel(.next)
                        .padding()
                }
                .padding()
            
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 55)
                .foregroundColor(colorScheme == .light ? .white : .black)
                .shadow(color: colorScheme == .light ? .black : .white, radius: 0, x: 7, y: 8)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 3)
                }
                .overlay {
                    TextField("Item value...", text: $itemValue, axis: .vertical)
                        .keyboardType(.decimalPad)
                        .padding()
                }
                .padding()
            
            Button(action: {itemVM.addItem(name: itemName, value: Double(itemValue) ?? 0.0)}) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .overlay {
                        Text("ADD ITEM")
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


struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
            .environmentObject(ItemViewModel())
    }
}
