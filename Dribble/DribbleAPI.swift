//
//  DribbleAPI.swift
//  Dribble
//
//  Created by 丁暐哲 on 2016/6/12.
//  Copyright © 2016年 Din. All rights reserved.
//

import Foundation

class DribbleAPI {
    let accessToken = "9b28a7f07cbb52a79bcb0954ac131548a2dbff350a0d30411a09729686c2816c"
    
//    let accessToken = "5fb1cce4afe684e411d4a8484827070ce62ccd69037c226dbe3267fd8a2be963"
    
    func ConnectAPI(completion:(([Shots]) -> Void)!){
        let url = "https://api.dribbble.com/v1/shots?access_token=" + accessToken
        let session = NSURLSession.sharedSession()
        let DataURl = NSURL(string: url)
        
        let task = session.dataTaskWithURL(DataURl!){(data, response, err)  in
            do {
                 let shotData = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSArray
//                print(shotData)
               var shotList = [Shots]()
                for shot in shotData {
                    let shot = Shots(data: shot as! NSDictionary)
                    shotList.append(shot)
                }
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        //                        print(shotData)
                        completion(shotList)
                    }
                }
            }catch{
                print("error = \(error)")
            }
            
        }
        task.resume()
    }
}
    
