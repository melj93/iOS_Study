//
//  WebView.swift
//  News_API_APP
//
//  Created by samuel Jeong on 2021/11/16.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { // Property로 WKWebView를 사용한다.
        //WKWebView는 웹 컨텐츠를 보여주는
        if let safeString = urlString {
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
