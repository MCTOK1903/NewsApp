//
//  ArticleView.swift
//  NewsAppSwiftUI
//
//  Created by Muhammed Celal Tok on 7.06.2022.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            newsImage(imageUrlString: article.image ?? "")
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N/A")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}

struct PlaceHolderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct newsImage: View {
    
    let imageUrlString: String
    
    var body: some View {
        if let url = URL(string: imageUrlString) {
            URLImage(url) { error, retry in
                PlaceHolderImageView()
            } content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 100, height: 100)
            .cornerRadius(10)
        }
    }
}
