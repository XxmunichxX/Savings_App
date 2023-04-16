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
                firstItemView
            } else {
                VStack {
                    List {
                        ForEach(itemVM.savedItems) { item in
                            ItemView(itemName: item.name ?? "", itemValue: item.value)
                        }
                        .onDelete(perform: itemVM.removeItem)
                    }
                    .toolbar {
                        EditButton()
                    }
                    Spacer()
                    
                    Button(action: {showModal.toggle()}) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
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
        .sheet(isPresented: $showModal) {
            AddItemView()
                .presentationDetents([.medium])
        }
    }
}

// MARK: Components

// First Item View
extension BucketListView {
    var firstItemView: some View {
        ZStack {
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
        .sheet(isPresented: $showModal) {
            AddItemView()
                .presentationDetents([.medium])
        }
    }
}

struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
            .environmentObject(ItemViewModel())
    }
}
