//
//  User.swift
//  Dribble
//
//  Created by 丁暐哲 on 2016/6/13.
//  Copyright © 2016年 Din. All rights reserved.
//

import Foundation

class User {
    var userID:Int
    var avataURL:String
    var name:String
    var location:String
    var followingCount:Int
    var followerCount: Int
    var shotsCount: Int
    var shotsURL: String
    var followingURL:String
    var avatarData:NSData?
    var  user:User!
    
    
    init(data:NSDictionary){
        
        
        self.avataURL = data["avatar_url"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.location = data["location"] as? String ?? ""
        
        self.userID = data["id"] as? Int ?? 0
        self.followingCount = data["followings_count"] as? Int ?? 0
        self.followerCount = data["followers_count"] as? Int ?? 0
        self.shotsCount = data["shots_count"] as? Int ?? 0
        
        self.shotsURL = data["shots_url"] as? String ?? ""
        self.followingURL = data["following_url"] as? String ?? ""
        
        
    }
    
}
