//
//  PostListRemoteDataManager.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/27/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation
import Alamofire 

class PostListRemoteDataManager: PostListRemoteDataManagerInputProtocol{
    var remoteRequestHandler: PostListRemoteDataManagerOutputProtocol?
    
    func retrievePostList() {
        Alamofire
                    .request(EndPoints.posts.fetch.url, method: .get, parameters: nil)
                    .validate()
                .responsePostModel { response in
                switch response.result{
                case .success(let posts):
                    self.remoteRequestHandler?.onPostsRetrieved(posts)
                case .failure(let error):
                    print(error.localizedDescription)
                    self.remoteRequestHandler?.onError(error: error.localizedDescription)
                }
        }
    }
}
