//
//  ContentView.swift
//  Memory_Game
//
//  Created by Rita Frias on 10/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.red)
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
            Text("😆")
        }
    }.padding()
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
