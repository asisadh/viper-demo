//
//  PersistenceError.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/27/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import Foundation

enum PersistenceError: Error{
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}
