//
//  PostDetailPresenter.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/28/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation

class PostDetailPresenter: PostDetailPresenterProtocol{
    var view: PostDetailViewProtocol?
    var wireFrame: PostDetailWireFrameProtocol?
    var post: PostModel?
    
    func viewDidLoad() {
        if let post = self.post{
            view?.showPostDetail(forPost: post)
        }
    }
}
