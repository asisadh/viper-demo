//
//  PostModel.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/27/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation
import Alamofire

//Alamofire.request(url).responseHomeModel { response in
//     if let homeModel = response.result.value {
//       ...
//     }
//   }

typealias PostModelArray = [PostModel]

struct PostModel: Codable {
    let id: Int
    let postTitle: String
    let imageUrl, thumbImageUrl: String
    
    init?(id: Int, postTitle: String, imageUrl: String, thumbImageUrl: String){
        self.id = id
        self.postTitle = postTitle
        self.imageUrl = imageUrl
        self.thumbImageUrl = thumbImageUrl
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case postTitle = "title"
        case imageUrl = "url"
        case thumbImageUrl = "thumbUrl"
    }
}

