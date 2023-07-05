//
//  ContentView.swift
//  AppleNews
//
//  Created by Kekeletso Phasha on 2023/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var newsManager = NewsManager()
    
    
    
    var body: some View {
        NavigationView {
            List (newsManager.posts, id: \.title) { post in
                NavigationLink(destination: Article(url: post.url), label: {
                    ListItem(title: post.title, source: post.source.name, author: post.author ?? "Unknown", url: post.urlToImage)
                    
                }
                )
                
            }
            .navigationTitle("Apple Daily")
            .onAppear{
                newsManager.fetchData()
            }
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
