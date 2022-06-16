//
//  ActionsView.swift
//  Tuira
//
//  Created by José Ibáñez Bengoechea on 13/6/22.
//

import SwiftUI

struct ActionsView: View {
    
    @StateObject var tweet : Tweet
    
    var body: some View {
        HStack (alignment: .center, spacing: 1){
            Group{
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .foregroundColor(tweet.retweetedByUser ? .green : .secondary)
                }
                Text(tweet.numberOfComments.formatted(.number))
                        .font(.caption.monospacedDigit())
                        .foregroundColor(tweet.numberOfComments <= 0 ? .secondary.opacity(0) : .secondary)
                
                Spacer()
                Button {
                    withAnimation{
                        tweet.retweetedByUser.toggle()
                        if tweet.retweetedByUser {
                            tweet.numberOfRetweets += 1
                        } else {
                            tweet.numberOfRetweets -= 1
                        }
                    }
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .foregroundColor(tweet.retweetedByUser ? .green : .secondary)
                }
                Text(tweet.numberOfRetweets.formatted(.number))
                        .font(.caption.monospacedDigit())
                        .foregroundColor(tweet.numberOfRetweets <= 0 ? .secondary.opacity(0) : tweet.retweetedByUser ? .green : .secondary)
                Spacer()
                
                Button {
                    withAnimation{
                        tweet.likedByUser.toggle()
                        if tweet.likedByUser {
                            tweet.numberOfLikes += 1
                        } else {
                            tweet.numberOfLikes -= 1
                        }
                    }
                } label: {
                    Image(systemName: tweet.likedByUser ? "heart.fill" :"heart")
                        .foregroundColor(tweet.likedByUser ? .pink : .secondary)
                }
                
                Text(tweet.numberOfLikes.formatted(.number))
                        .font(.caption.monospacedDigit())
                        .foregroundColor(tweet.numberOfLikes <= 0 ? .secondary.opacity(0) : tweet.likedByUser ? .pink : .secondary)
                        
                
                Spacer()
            }
            Image(systemName: "square.and.arrow.up")
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding(.vertical, 3)
    }
}

struct ActionsView_Previews: PreviewProvider {
    static var previews: some View {
        ActionsView(tweet: Tweet())
    }
}
