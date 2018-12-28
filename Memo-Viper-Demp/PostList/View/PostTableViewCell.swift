//
//  PostTableViewCell.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/27/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import UIKit
import AlamofireImage

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func set(forPost post: PostModel) {
        self.selectionStyle = .none
        titleLabel?.text = post.postTitle
        let url = URL(string: post.thumbImageUrl)!
        let placeholderImage = UIImage(named: "placeholder")!
        postImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
}
