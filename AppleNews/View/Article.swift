//
//  Article.swift
//  AppleNews
//
//  Created by Kekeletso Phasha on 2023/06/22.
//

import SwiftUI

struct Article: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct Article_Previews: PreviewProvider {
    static var previews: some View {
        Article(url: "https://www.21stcenturystudio.co.za")
    }
}
