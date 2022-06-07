//
//  ResultState.swift
//  NewsAppSwiftUI
//
//  Created by Muhammed Celal Tok on 7.06.2022.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
