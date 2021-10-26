//
//  ContentView.swift
//  SwiftUI_Cat_practice
//
//  Created by samuel Jeong on 2021/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ZStack{
                Color(red: 0.97, green: 0.84, blue: 0.58, opacity: 1.00)
                    .edgesIgnoringSafeArea(.all)
                Text("만두")
                    .font(Font.custom("MaruBuri-Bold", size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
