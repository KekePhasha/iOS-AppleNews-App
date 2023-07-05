//
//  ListItem.swift
//  AppleNews
//
//  Created by Kekeletso Phasha on 2023/06/22.
//

import SwiftUI

struct ListItem: View {
    
    var title: String
    var source: String
    let author: String
    let url: String?
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                if let url = url {
                    AsyncImage(url: URL(string:url), content: {
                        image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .cornerRadius(2)
                        
                    }, placeholder: {
                        
                        ProgressView()
                        
                    }
                    )
                    
                }
            }
            HStack{
                Text(source)
                Spacer()
                Text(author)
                    
            }
            .font(.caption)
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(title: "This iPad Stylus Is Almost 60% Off Right Now", source: "lifehacker.com", author: "Kekeletso Phasha", url:"https://image.tmdb.org/t/p/original/vTltbqzfGxn3u6HTmQrYtEkg34j.jpg" )
            .previewLayout(.fixed(width: 300, height: 70))
           
    }
}
