//
//  PostDetailWireFrame.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/28/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation
import UIKit

class PostDetailWireFrame: PostDetailWireFrameProtocol{
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createPostDetailModule(forPost post: PostModel) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "PostDetailView")
        
        if let view = viewController as? PostDetailView{
            let presenter: PostDetailPresenterProtocol = PostDetailPresenter()
            let wireFrame: PostDetailWireFrameProtocol = PostDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.post = post
            
            return view
        }
        
        return UIViewController()
    }
}
