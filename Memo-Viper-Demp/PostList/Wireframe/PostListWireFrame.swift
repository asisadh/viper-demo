//
//  PostListWireFrame.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/28/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import UIKit

class PostListWireFrame: PostListWireFrameProtocol{
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createPostListModule() -> UIViewController {
        let navigationController = mainStoryboard.instantiateViewController(withIdentifier: "PostsNavigationController")
        if let view = navigationController.children.first as? PostListView{
            let presenter: PostListPresenterProtocol & PostListInteractorOutputProtocol = PostListPresenter()
            let interactor: PostListInteractorInputProtocol & PostListRemoteDataManagerOutputProtocol = PostListInteractor()
            let localDataManager: PostListLocalDataManagerInputProtocol = PostListLocalDataManager()
            let remoteDataManager: PostListRemoteDataManagerInputProtocol = PostListRemoteDataManager()
            let wireFrame: PostListWireFrameProtocol = PostListWireFrame()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            
            interactor.presenter = presenter
            interactor.localDataManager = localDataManager
            interactor.remoteDataManager = remoteDataManager
            
            remoteDataManager.remoteRequestHandler = interactor
            
            return navigationController
        }
        return UIViewController()
    }
    
    func presentPostDetailScreen(from view: PostListViewProtocol, forPost post: PostModel) {
        #warning(" TO BE IMPLEMENTED")
        let postDetailViewController = PostDetailWireFrame.createPostDetailModule(forPost: post)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(postDetailViewController, animated: true)
        }
    }
}
