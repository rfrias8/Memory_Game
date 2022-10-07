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
        .padding(.horizontal)
        .foregroundColor(.red)
        
    }
}

//These are what the cards look like and contain inside
struct CardView: View {
    var body: some View {
        ZStack {
            if faceUp {
                Circle()
                    .fill()
                    .foregroundColor(.white)
                Circle()
                    .stroke(lineWidth: 4)
                Text("😎")
                    .font(.largeTitle)
            }else {
                Circle()
                    .fill()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
    
}
