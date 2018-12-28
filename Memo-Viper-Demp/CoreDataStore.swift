//
//  CoreDataStore.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/27/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import CoreData
import UIKit

class CoreDataStore{
    
    static var persistentStoreCoordinator: NSPersistentStoreCoordinator?{
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            return appDelegate.persistentContainer.persistentStoreCoordinator
        }
        return nil
    }
    
    static var managedObjectModel: NSManagedObjectModel?{
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            return appDelegate.persistentContainer.managedObjectModel
        }
        return nil
    }
    
    static var managedObjectContext: NSManagedObjectContext?{
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            return appDelegate.persistentContainer.viewContext
        }
        return nil
    }
}
