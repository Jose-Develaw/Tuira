//
//  TweetDatabase.swift
//  Tuira
//
//  Created by José Ibáñez Bengoechea on 12/6/22.
//

import SwiftUI
import AVKit

class TweetDatabase {
    
    private static var allTweets : [Tweet] = []
    
    static func getAllTweets() -> [Tweet]{
        return allTweets
    }
    
    static func getMainTweets () -> [Tweet]{
        return allTweets.filter({$0.isCommentOf == nil})
    }
    
    static func seedTweets()  {
        
        let profilePic = UIImage(named: "JoseDevelaw")!
        let braisImage = UIImage(named: "Brais")
        
        
        //For tweet with video
        let videoUrl: String = "https://bit.ly/swswift"
        let player = AVPlayer(url: URL(string: videoUrl)!)
        
        let user = User(displayName: "José", atName: "JoseDevelaw")
        user.profilePic = profilePic
        
        let user2 = User(displayName: "Other", atName: "Od", isVerified: true)
        
        let tweetBuilder = TweetBuilder()
        
        let tweet = tweetBuilder
            .withUser(user)
            .withText("Example text")
            .withVideo(player)
            .isAdd(true)
            .build()
        
        let tweet2 = tweetBuilder
            .withUser(user)
            .retweetedBy(user2)
            .withText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation")
            .build()
        
        let tweet3 = tweetBuilder
            .withUser(user2)
            .isCommentOf(tweet2.id)
            .withImage(braisImage!)
            .withText("Yet another amazing tweet for testing purposes")
            .build()
        
        allTweets.append(contentsOf: [tweet, tweet2, tweet3])
    }
}
