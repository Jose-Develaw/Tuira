//
//  ContentView.swift
//  Tuira
//
//  Created by José Ibáñez Bengoechea on 12/6/22.
//

import SwiftUI
import AVKit

struct Separator: View {
    
    var body: some View {
               Divider()
                    .padding(.top, 2)
    }
}

struct ContentView: View {
    
    @State var tweets = [Tweet]()
    private let gridItemLayout = [GridItem(.adaptive(minimum: 360, maximum: .infinity))]

    
    var body: some View {
        ScrollView {
            LazyVStack (){
                ForEach (tweets, id: \.id) { tweet in
                    VStack{
                        if let retweetedby = tweet.retweetedBy {
                            VStack{
                                Text("\(retweetedby.displayName) has retwetted")
                                    .font(.caption2.bold())
                                    .frame(maxWidth: 100)
                            }
                        }
                        HStack (alignment: .top){
                            Image(uiImage: tweet.user?.profilePic ?? UIImage(systemName: "person.crop.circle")!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50, alignment: .topLeading)
                                .padding(.trailing, 5)
                            
                            VStack(alignment: .leading){
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
        }
        .onAppear(){
            TweetDatabase.seedTweets()
            tweets = TweetDatabase.getAllTweets()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
