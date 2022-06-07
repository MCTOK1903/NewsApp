//
//  ErrorView.swift
//  NewsAppSwiftUI
//
//  Created by Muhammed Celal Tok on 7.06.2022.
//

import SwiftUI

struct ErrorView: View {
    
    typealias ErrorViewActionHandler = () -> Void
    
    let error: Error
    let handle: ErrorViewActionHandler
    
    internal init(error: Error,
                  handle: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handle = handle
    }
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 4)
            Text("OOOOpss")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
                .multilineTextAlignment(.center)
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
            
            Button {
                handle()
            } label: {
                Text("Retry")
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.system(size: 15))
            .cornerRadius(10)
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError, handle: {})
            .previewLayout(.sizeThatFits)
    }
}
