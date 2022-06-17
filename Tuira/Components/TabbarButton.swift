//
//  TabbarButton.swift
//  Tuira
//
//  Created by José Ibáñez Bengoechea on 16/6/22.
//

import SwiftUI

struct TabbarButton: View {
    
    @Binding var selected : Int
    let systemImage : String
    let selectionNumber : Int
    
    @State var size : CGFloat = 25
    
    
    
    var body: some View {
        Button {
            withAnimation{
                selected = selectionNumber
                
            }
        }
        label: {
            Image(systemName: selected == selectionNumber ? "\(systemImage).fill" : systemImage)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
            .foregroundColor(.primary)
        }
    }
}

