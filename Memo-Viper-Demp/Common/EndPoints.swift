//
//  EndPoints.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/27/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation

struct API{
    static let base_url = "https://fierce-cove-29863.herokuapp.com"
}

protocol EndPoint{
    var path: String { get }
    var url: String { get }
}

enum EndPoints{
    enum posts: EndPoint{
        case fetch
        
        public var path: String{
            switch self {
            case .fetch: return "/getAllPosts"
            }
        }
            
        public var url: String{
            switch self{
            case .fetch: return "\(API.base_url)\(path)"
            }
        }
    }
}
