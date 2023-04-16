//
//  ItemView.swift
//  Savings_App
//
//  Created by Francesco Monaco on 21/03/23.
//

import SwiftUI

struct ItemView: View {
    
    var itemName: String
    var itemValue: Double
    
    var body: some View {
        VStack(alignment: .leading){
            //Divider()
            HStack(alignment: .center) {
                Text(itemName)
                    .fontWeight(.semibold)
                    .padding(.vertical,1)
                
                Spacer()
                
                Text(String(format: "%.2f", itemValue) + "€")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
            }
            .padding(.horizontal)
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(itemName: "Item", itemValue: 20.00)
    }
}
