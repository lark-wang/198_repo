//
//  CustomCell.swift
//  Shopping List
//
//  Created by Tony Hong on 3/12/22.
//

import SwiftUI

struct CustomCell: View {
    var imageName: String
    
    var itemName: String
    
    var quantity: Int
    
    var body: some View {
        HStack{
        Image(imageName)
            .resizable()
            .frame(width: 36.0, height: 36.0)
        Text(itemName)
        Spacer()
        Text(String(quantity))
        }
    }
}

