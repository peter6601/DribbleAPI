//
//  DataType.swift
//  Dribble
//
//  Created by 丁暐哲 on 2016/6/12.
//  Copyright © 2016年 Din. All rights reserved.
//

import Foundation

class Shots
{
    var id:Int
    var title:String
    var description:String
    var commentsCount:Int
    var viewsCount:Int
    var likesCount:Int
    var commentURL:String
    var imageURL:String
    var imageData:NSData?
    var date:String
    var user:User?
    
    
    init(data: NSDictionary){
        self.id = data["id"] as? Int ?? 0
        self.commentsCount = data["comments_count"] as? Int  ?? 0
        self.likesCount = data["likes_count"] as? Int  ?? 0
        self.viewsCount = data["views_count"] as? Int ?? 0
        
        self.commentURL = data["comments_url"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
        self.date = data["created_at"] as? String ?? ""
        self.description = data["description"] as? String ?? ""
        let images = data["images"] as? NSDictionary
        self.imageURL = images!["normal"] as? String ?? ""
        
        if let userData = data["user"] as? NSDictionary {
            self.user = User(data: userData)
        }

    }

}