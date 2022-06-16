//
//  Tweet.swift
//  Tuira
//
//  Created by José Ibáñez Bengoechea on 12/6/22.
//

import SwiftUI
import AVFoundation

class Tweet : ObservableObject, Identifiable, NSCopying {
   
    var user : User?
    var published : Date?
    
    var isAd : Bool = false

    var isCommentOf : ObjectIdentifier?
    var comments : [Tweet]?
    var retweetedBy : User?
    var text : String?
    var image : UIImage?
    var video : AVPlayer?
    
    @Published var numberOfLikes : Int = 0
    @Published var numberOfComments  : Int = 0
    @Published var numberOfRetweets : Int = 0
    @Published var likedByUser : Bool = false
    @Published var retweetedByUser : Bool = false
    
    init(){}
    
    func copy(with zone: NSZone? = nil) -> Any {
        
        let tweet = Tweet()
        tweet.user = self.user
        tweet.published = self.published
        tweet.isCommentOf = self.isCommentOf
        tweet.text = self.text
        tweet.image = self.image
        tweet.video = self.video
        tweet.isAd = self.isAd
        tweet.numberOfLikes = self.numberOfLikes
        tweet.numberOfRetweets = self.numberOfRetweets
        tweet.numberOfComments = self.numberOfComments
        tweet.retweetedBy = self.retweetedBy
        
        return tweet
    }
}
