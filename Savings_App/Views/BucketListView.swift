//
//  BucketListView.swift
//  Savings_App
//
//  Created by Francesco Monaco on 29/01/23.
//

import SwiftUI

struct BucketListView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var itemVM: ItemViewModel
    
    @State private var showModal = false
    
    var body: some View {
        NavigationView {
            
            if itemVM.savedItems.isEmpty {
                VStack {
                    Text("Add your first item!")
                        .fontWeight(.semibold)
                        .font(.system(size: 30))
                        .padding()
                    
                    Button(action: {showModal.toggle()}) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 25))
                            .foregroundColor(colorScheme == .light ?  .black : .white)
                    }
                }
            }
            
            List(itemVM.savedItems) { item in
                Text(item.name ?? "")
                Text("\(item.value)")
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {dismiss.callAsFunction()}) {
                    Text("Back")
                        .foregroundColor(colorScheme == .light ?.black : .white)
                        .fontWeight(.heavy)
                }
            }
        }
    }
}

struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
            .environmentObject(ItemViewModel())
    }
}
