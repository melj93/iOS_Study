//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by samuel Jeong on 2021/08/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Hello, SwiftUI!")
                    .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .colorInvert()
                
            }
            Button(action: signIn) {
                Text("Sign In")
            }
        }
    }
    
    func signIn(){
        print("idk yet")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
