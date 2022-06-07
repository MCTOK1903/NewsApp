//
//  HomeView.swift
//  NewsAppSwiftUI
//
//  Created by Muhammed Celal Tok on 6.06.2022.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error,
                          handle: viewModel.getArticles)
            case .success(content: let articles):
                ArticleListView(articles: articles, handler: load(url:))
            }
        }.onAppear {
            viewModel.getArticles()
        }
    }
    
    func load(url: String?) {
        guard let url = url,
        let link = URL(string: url) else { return }
        
        openUrl(link)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ArticleListView: View {
    
    let articles: [Article]
    let handler: (_ url: String) -> Void
    
    var body: some View {
        NavigationView {
            List(articles, id: \.id) { article in
                ArticleView(article: article)
                    .onTapGesture {
                        handler(article.url ?? "")
                    }
            }
        }
        .navigationTitle(Text("News"))
    }
}

