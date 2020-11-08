//
//  ContentView.swift
//  testDraw
//
//  Created by Indra Kurniawan on 08/11/20.
//

import SwiftUI

struct ContentView: View {
    let numbers = [5,3,2]
    
    var body: some View {
        
        ZStack{
            Color.black
            Drawing1()
            VStack {
                ForEach((numbers), id: \.self) { index in
                    Text("\(index)")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
