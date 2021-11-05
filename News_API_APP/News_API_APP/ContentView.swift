//
//  ContentView.swift
//  News_API_APP
//
//  Created by samuel Jeong on 2021/10/29.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    //ObservedObject 변수를 subscribe하면 위 프로퍼티를 사용할 수 있다.
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                HStack {
                    Text(String(post.points))
                    Text(post.title)
                }
            }
            .navigationTitle("Hacker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }// ViewWillAppear와 같은 역할을 한다.
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Hello"),
//    Post(id: "3", title: "Hello")
//]
