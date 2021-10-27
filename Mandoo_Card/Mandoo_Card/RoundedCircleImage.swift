//
//  RoundedCircleImage.swift
//  Mandoo_Card
//
//  Created by samuel Jeong on 2021/10/27.
//

import SwiftUI

struct RoundedCircleImage: View {
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:200.0, height: 200.0)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .padding(.vertical, 15.0)
    }
}

struct RoundedCircleImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCircleImage(image: "mandoo")
            .previewLayout(.sizeThatFits)
    }
}
