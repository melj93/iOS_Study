//
//  ContentView.swift
//  I Am Rich
//
//  Created by samuel Jeong on 2021/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.systemGray)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Mandoo.")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                Image("mandoo").resizable().aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
