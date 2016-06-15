//
//  ShotCollectionViewController.swift
//  Dribble
//
//  Created by 丁暐哲 on 2016/6/14.
//  Copyright © 2016年 Din. All rights reserved.
//

import UIKit

private let reuseIdentifier = "shotsCell"

class ShotCollectionViewController: UICollectionViewController {
    var shots: [Shots]!
    var cellHeight: CGFloat = 240
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    @IBOutlet var ShotCollectView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shots"

        collectionView!.backgroundColor = UIColor.whiteColor()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let cellWidth = self.view.frame.width/2
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        shots = [Shots]()
        let api = DribbleAPI()
        api.ConnectAPI(didLoadShot)
    }
    
    
    func didLoadShot(shots: [Shots]) {
        self.shots = shots
        self.ShotCollectView.reloadData()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print(shots.count)
        return shots.count
    }

     override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ShotCollectionViewCell
    
         let shot = shots[indexPath.row]
//        print(shots)
        print("shot = \(shot.title)")
//        print(shot.commentsCount)
        cell.titleLabel.text = shot.title
        cell.nameLabel.text = shot.user!.name
        asyncLoadShotImage(shot, imageView: cell.ImageView)
      
        return cell
    }
    func asyncLoadShotImage(shot: Shots, imageView: UIImageView) {
        let downloadQueue = dispatch_queue_create("com.iShots.processdownload", nil)
        
        dispatch_async(downloadQueue) {
            let data = NSData(contentsOfURL: NSURL(string: shot.imageURL)!)
            
            var image: UIImage!
            
            if data != nil {
                shot.imageData = data
                image = UIImage(data: data!)!
            }
            dispatch_async(dispatch_get_main_queue()) {
                imageView.image = image
            }
        }
    }

  

}
