//
//  PostDetailProtocols.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/28/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation
import UIKit

protocol PostDetailViewProtocol: class{
    var presenter: PostDetailPresenterProtocol? { get set }
    
    // Presenter -> View
    func showPostDetail(forPost post: PostModel)
}

protocol PostDetailWireFrameProtocol: class{
     static func createPostDetailModule(forPost post: PostModel) -> UIViewController
}

protocol PostDetailPresenterProtocol: class{
    var view: PostDetailViewProtocol? { get set }
    var wireFrame: PostDetailWireFrameProtocol? { get set }
    var post: PostModel? { get set }
    
    // VIEW -> Presenter
    func viewDidLoad()
}
