//
//  PostDetailView.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/28/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import UIKit

class PostDetailView: UIViewController{
    
    var presenter: PostDetailPresenterProtocol?
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension PostDetailView: PostDetailViewProtocol{
    func showPostDetail(forPost post: PostModel) {
        titleLabel?.text = post.postTitle
        let url = URL(string: post.imageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        postImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
}
