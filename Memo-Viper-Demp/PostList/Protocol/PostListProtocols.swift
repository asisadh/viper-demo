//
//  PostListProtocols.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/27/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import UIKit

protocol PostListViewProtocol: class {
    var presenter: PostListPresenterProtocol? { get set }
    
    // Presenter -> View
    func showPosts(with posts: [PostModel])
    func showError(message: String)
    func showLoading()
    func hideLoading()
}

protocol PostListWireFrameProtocol: class {
    static func createPostListModule() -> UIViewController
    
    // Presenter -> WireFrame
    func presentPostDetailScreen(from view: PostListViewProtocol, forPost post: PostModel)
}

protocol PostListPresenterProtocol: class {
    var view: PostListViewProtocol? { get set }
    var interactor: PostListInteractorInputProtocol? { get set }
    var wireFrame: PostListWireFrameProtocol? { get set }
    
    // View -> Presenter
    func viewDidLoad()
    func showPostDetail(forPost post: PostModel)
    func updatePostList()
}

protocol PostListInteractorOutputProtocol: class {
    
    //Interactor -> Presenter
    func didRetrivePosts(_ posts: PostModelArray)
    func onError(message: String)
}

protocol PostListInteractorInputProtocol: class {
    var presenter: PostListInteractorOutputProtocol? { get set }
    var localDataManager: PostListLocalDataManagerInputProtocol? { get set }
    var remoteDataManager: PostListRemoteDataManagerInputProtocol? { get set }
    
    // Presenter -> Interactor
    func retrievePostList()
    func updatePostList()
}

protocol PostListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol PostListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: PostListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrievePostList()
}

protocol PostListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onPostsRetrieved(_ posts: [PostModel])
    func onError(error: String)
}

protocol PostListLocalDataManagerInputProtocol: class{
    // INTERACTOR -> LOCALDATAMANAGER
    func reterivePostList() throws -> [Post]
    func savePost(postData: PostModel) throws
}
