//
//  TweetView.swift
//  Tuira
//
//  Created by José Ibáñez Bengoechea on 16/6/22.
//

import SwiftUI
import AVKit

struct TweetView: View {
    
    let tweet: Tweet
    
    var body: some View {
        VStack (alignment: .leading){
            HStack (alignment: .top, spacing: 5){
                VStack (alignment: .trailing){
                    if tweet.retweetedBy != nil {
                        Image(systemName: "arrow.2.squarepath")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.secondary)
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 2)
                    }
                    Image(uiImage: tweet.user?.profilePic ?? UIImage(systemName: "person.crop.circle")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding(.trailing, 2)
                }
                VStack(alignment: .leading){
                    VStack(alignment: .center){
                        if let retweetedby = tweet.retweetedBy {
                            Text("\(retweetedby.displayName) has retwetted")
                                .font(.caption2.bold())
                                .foregroundColor(.secondary)
                                .padding(.bottom, 3)
                        }
                    }
                    HStack (spacing: 3){
                        Text(tweet.user!.displayName)
                            .bold()
                        if tweet.user!.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.twitterBlue)
                        }
                        Text("@\(tweet.user!.atName)")
                            .foregroundColor(Color.secondary)
                        Spacer()
                        Button {
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.secondary)
                        }
                        
                    }
                    
                    TweetText(tweet: tweet)
                    if let image = tweet.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)
                    }
                    
                    if let video = tweet.video {
                        VideoPlayer(player: video)
                            .frame(height: 300)
                            .cornerRadius(15)
                    }
                    
                    //Actions
                    ActionsView(tweet: tweet)
                    
                    if tweet.isAd {
                        HStack (spacing: 1){
                            Image(systemName: "arrow.up.forward.square.fill")
                                .foregroundColor(.secondary)
                            Text("Advertisement")
                                .font(.callout)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .padding(.top, 5)
            .padding(.horizontal, 20)
        }
       
        Separator()
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView(tweet: Tweet())
    }
}
