//
//  TweetBuilder.swift
//  Tuira
//
//  Created by José Ibáñez Bengoechea on 12/6/22.
//

import SwiftUI
import AVFoundation

class TweetBuilder : Builder {
   
    
    
    private var tweet : Tweet
    
    init(){
        tweet = Tweet()
    }
    
    func reset() {
        tweet = Tweet()
    }
    
    func withUser(_ user: User) -> Self {
        tweet.user = user
        return self
    }
    
    func retweetedBy(_ user: User) -> Self {
        tweet.retweetedBy = user
        return self
    }
    
    func isCommentOf(_ id: ObjectIdentifier) -> Self {
        tweet.isCommentOf = id
        return self
    }
    
    func withText(_ text: String) -> Self {
        tweet.text = text
        return self
    }
    
    func withImage(_ image: UIImage) -> Self {
        tweet.image = image
        return self
    }
    
    func withVideo(_ video: AVPlayer) -> Self {
        tweet.video = video
        return self
    }
    
    func isAdd(_ isAd: Bool) -> Self {
        tweet.isAd = isAd
        return self
    }
    
    func build() -> Tweet {
        let newTweet = tweet.copy()
        reset()
        return newTweet as! Tweet
    }
}