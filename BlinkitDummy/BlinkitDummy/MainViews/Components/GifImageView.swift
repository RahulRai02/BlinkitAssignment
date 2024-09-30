//
//  GifImageView.swift
//  BlinkitDummy
//
//  Created by Rahul Rai on 30/09/24.
//

//import Foundation
//import SwiftUI
//import WebKit
//struct GifImageView: UIViewRepresentable {
//    private let name: String
//    init(_ name: String) {
//        self.name = name
//    }
//func makeUIView(context: Context) -> WKWebView {
//        let webview = WKWebView()
//        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
//        let data = try! Data(contentsOf: url)
//        webview.load(data, mimeType: "image/gif", characterEncodingName: "UTF-8", baseURL: url.deletingLastPathComponent())
//        return webview
//    }
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        uiView.reload()
//    }
//}
