//
//  ContentView.swift
//  SwiftUI practice
//
//  Created by samuel Jeong on 2021/09/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello")
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .colorInvert()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
