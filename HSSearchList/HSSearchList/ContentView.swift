//
//  ContentView.swift
//  HSSearchList
//
//  Created by dongxia zhu on 2021/10/8.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var searchText: String = "" {
        willSet {
            print(newValue)
        }
    }
    @State private var searchResult: [HSResultModel] = []
    var body: some View {
        NavigationView {
            VStack {
                HSSearchBar(text: $searchText)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal, 15.0/*@END_MENU_TOKEN@*/)
                if searchText.count > 0 {
                    HSResultList(results: requestSearchResult(searchText))
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .background(backgroundColor.ignoresSafeArea())
            .navigationBarTitle(Text("Search"))
            .navigationBarHidden(searchText.count > 0)
        }
    }
    
    func requestSearchResult(_ text: String) -> [HSResultModel] {
        return ResultData().requestSearchResult(text)
    }
}

