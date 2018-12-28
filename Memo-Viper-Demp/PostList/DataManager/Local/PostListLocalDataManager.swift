//
//  PostListLocalDataManager.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/27/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import CoreData

class PostListLocalDataManager: PostListLocalDataManagerInputProtocol{
    
    func reterivePostList() throws -> [Post]{
        guard let managedObjectContext = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        let request: NSFetchRequest<Post> = NSFetchRequest(entityName: String(describing: Post.self))
        return try managedObjectContext.fetch(request)
    }
    
    func savePost(postData: PostModel) throws {
        guard let managedObjectContext = CoreDataStore.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newPost = NSEntityDescription.entity(forEntityName: "Post", in: managedObjectContext){
            let post = Post(entity: newPost, insertInto: managedObjectContext)
            post.id = Int32(postData.id ?? 0)
            post.imageUrl = postData.imageUrl
            post.title = postData.postTitle
            post.thumbImageUrl = postData.thumbImageUrl
           
            do{
                try managedObjectContext.save()
            }catch {
                throw PersistenceError.couldNotSaveObject
            }
        }
    }
}
