//
//  ItemViewModel.swift
//  Savings_App
//
//  Created by Francesco Monaco on 20/03/23.
//

import Foundation
import SwiftUI
import CoreData

class ItemViewModel: ObservableObject {
    
    @Published var savedItems = [Item]()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "ItemModel")
        container.loadPersistentStores { description, error in
            if let error {
                print("ERROR LOADING COREDATA: \(error)")
            }
        }
        fetchItems()
    }
    
    func fetchItems() {
        let request = NSFetchRequest<Item>(entityName: "Item")
        do {
            savedItems = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching: \(error)")
        }
    }
    
    func removeItem(at offsets: IndexSet) {
      for index in offsets {
            let item = savedItems[index]
            container.viewContext.delete(item)
           do {
                try container.viewContext.save()
            } catch let error {
                print("Error while saving data: \(error)")
            }
        }
    }
    
    func addItem(name: String, value: Double) {
        let newItem = Item(context: container.viewContext)
        newItem.name = name
        newItem.value = value
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchItems()
        } catch let error {
            print("Error while saving Item: \(error)")
        }
    }
    
}
