//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Ivy on 4/29/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    
    var favorited:Bool = false
    var tweetId : Int = -1
    var retweeted:Bool = false
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited:Bool = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (Error) in
                print("Favorite failed: \(Error)")
            })
        }else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (Error) in
                print("Unfavorite failed: \(Error)")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
    }
    

    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if favorited {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
