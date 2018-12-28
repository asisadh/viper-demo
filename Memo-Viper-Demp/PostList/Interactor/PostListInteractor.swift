//
//  PostListInteractor.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/27/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation

class PostListInteractor: PostListInteractorInputProtocol{
    
    var presenter: PostListInteractorOutputProtocol?
    
    var localDataManager: PostListLocalDataManagerInputProtocol?
    
    var remoteDataManager: PostListRemoteDataManagerInputProtocol?
    
    func retrievePostList() {
        do{
            if let postList = try localDataManager?.reterivePostList(){
                #warning(" bang `!` is used please fix this later ")
                let postModelList = postList.map() {
                    return PostModel(id: Int($0.id), postTitle: $0.title!, imageUrl: $0.imageUrl!, thumbImageUrl: $0.thumbImageUrl!)!
                }
                
                if postModelList.isEmpty{
                    remoteDataManager?.retrievePostList()
                }else{
                    presenter?.didRetrivePosts(postModelList)
                }
            }else{
                remoteDataManager?.retrievePostList()
            }
        }catch{
            presenter?.didRetrivePosts([])
        }
    }
    
    func updatePostList() {
        remoteDataManager?.retrievePostList()
    }
}

extension PostListInteractor: PostListRemoteDataManagerOutputProtocol {

    func onPostsRetrieved(_ posts: [PostModel]) {
        presenter?.didRetrivePosts(posts)
        for postModel in posts {
            do {
                try localDataManager?.savePost(postData: postModel)
            } catch(let error)  {
                #warning(" Need to catch error here! ")
                 print(error)
            }
        }
    }
    
    func onError(error: String) {
        presenter?.onError(message: error)
    }
}
