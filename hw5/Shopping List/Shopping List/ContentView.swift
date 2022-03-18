//
//  ContentView.swift
//  Shopping List
//
//  Created by Tony Hong on 3/11/22.
//

import SwiftUI

class Items: Identifiable{
    
    let imageName: String
    
    let itemName: String
    
    let quantity: Int
    
    init(imgName: String, itmName: String, qty: Int){
        self.imageName = imgName
        
        self.itemName = itmName
        
        self.quantity = qty
    }
    
}

struct ContentView: View {

        var listOther = [Items(imgName: "banana", itmName: "Bananas", qty: 3),
                        Items(imgName: "apple", itmName: "Apples", qty: 4),
                        Items(imgName: "eggs", itmName: "Eggs", qty: 12)]
    
        var listMelon = [Items(imgName: "watermelon", itmName: "Watermelon", qty: 1),
                        Items(imgName: "canteloupe", itmName: "Canteloupe", qty: 1),
                        Items(imgName: "honeydew", itmName: "Honeydew", qty: 1),
                         Items(imgName: "bittermelon", itmName: "Bittermelon", qty: 1000)]
    
        var listFlowers = [Items(imgName: "broccoli", itmName: "Broccoli", qty: 5),
                        Items(imgName: "cauliflower", itmName: "Cauliflower", qty: 5),
                        Items(imgName: "squash blossoms", itmName: "Squash  blossoms", qty: 5)]
        
        var body: some View {
            NavigationView{
                
                List{
                    Section(header: Text("Melons")){
                        ForEach(listMelon){i in
                            CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                        }
                    }
                    
                    Section(header: Text("Flowers")){
                        ForEach(listFlowers){i in
                            CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                        }
                    }
                    
                    Section(header: Text("Other")){
                        ForEach(listOther){i in
                            CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                        }
                    }
                }
            .navigationTitle("Shopping List")
        }
    }
}
