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
            Color(.systemGray)
                .edgesIgnoringSafeArea(.all)
            VStack {
                RoundedCircleImage(image: "mandoo")
                Title()
                SubTitle()
                Divider()
                    .padding()
                InfoView(text: "010 9201 8000", imageName: "phone.fill")
                InfoView(text: "mandoo@cat.com", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct Title: View {
    var body: some View {
        Text("만두")
            .font(Font.custom("MaruBuri-Bold", size: 40))
            .foregroundColor(Color.white)
    }
}

struct SubTitle: View {
    var body: some View {
        Text("고양이")
            .font(
                Font.custom("MaruBuri-Regular", size: 25)
            )
            .foregroundColor(.white)
            .padding(.top, 2.0)
    }
}
