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
                Image("mandoo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:200.0, height: 200.0)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                    .padding(.bottom, 10.0)
                Text("만두")
                    .font(Font.custom("MaruBuri-Bold", size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Text("고양이")
                    .foregroundColor(.white)
                    .font(
                        Font.custom("MaruBuri-Regular", size: 25)
                    )
                    .padding(.top, 2.0)
                Divider()
                    .padding()
                InfoView(text: "010 9201 8000", imageName: "phone.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(.green)
                Text(text)
            })
            .padding(.all)
    }
}
