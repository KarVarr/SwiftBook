//
//  CommentNetworkService.swift
//  MVC-N
//
//  Created by Karen Vardanian on 25.07.2023.
//

import Foundation


class CommentNetworkService {
    private init() {}
    
    static func getComments(completion: @escaping(GetCommentResponse) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        
        NetworkService.shared.getData(url: url) { json in
            
        }
    }
}
