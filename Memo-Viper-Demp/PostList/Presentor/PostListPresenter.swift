//
//  PostListPresenter.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/27/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation

class PostListPresenter: PostListPresenterProtocol{
        
    var view: PostListViewProtocol?
    var interactor: PostListInteractorInputProtocol?
    var wireFrame: PostListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrievePostList()
    }
    
    func showPostDetail(forPost post: PostModel) {
        if let view = view{
            wireFrame?.presentPostDetailScreen(from: view, forPost: post)
        }
    }
    
    func updatePostList() {
        interactor?.updatePostList()
    }
}

extension PostListPresenter: PostListInteractorOutputProtocol{
    
    func didRetrivePosts(_ posts: [PostModel]) {
        view?.hideLoading()
        view?.showPosts(with: posts)
    }
    
    func onError(message: String) {
        view?.hideLoading()
        view?.showError(message: message)
    }
}
