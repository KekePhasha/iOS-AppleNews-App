//
//  NewsManager.swift
//  AppleNews
//
//  Created by Kekeletso Phasha on 2023/06/22.
//

import Foundation

class NewsManager: ObservableObject {
    
    // Passing to the view object
  @Published  var posts = [Posts]()
    
    // Perform the request
    func fetchData(){
        
        // 1. url
        if  let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2023-06-21&to=2023-06-21&sortBy=popularity&apiKey=b2cc57c4eb7540e0b897d38c8fe9c228") {
            
            let sesson = URLSession(configuration: .default)
            let task = sesson.dataTask(with: url) { data, response, error in
                // checking that there is no error
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        
                        do {
                            // Decoding the info to the structs created in the NewsData Model
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.articles
                            }
                        } catch {
                            print(error)
                        }
                    }
                    
                } else {
                    print("Session Error: \(String(describing: error))")
                }
                    
            }
            task.resume()
        }
    }
}
