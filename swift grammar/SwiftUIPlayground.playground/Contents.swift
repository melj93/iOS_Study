//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        Text("Hello 🐶 \nSwiftUI 🦁").foregroundColor(.green).italic()
        Text("Hello 🐶 \nSwiftUI 🦁").foregroundColor(.blue).bold().lineLimit(1)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
