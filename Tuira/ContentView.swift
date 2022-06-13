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
                    .frame(height: 0.3)
                    .overlay(.secondary)
                    .padding(.top, 2)
                    .padding(.horizontal, 10)
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
                                Text(tweet.text ?? "")
                                if let image = tweet.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: 350, maxHeight: 250)
                                        .cornerRadius(15)
                                }
                                
                                if let video = tweet.video {
                                    VideoPlayer(player: video)
                                        .frame(height: 200)
                                        .cornerRadius(15)
                                }
                                
                                //Actions
                                HStack (alignment: .center){
                                    Image(systemName: "bubble.right")
                                    Spacer()
                                    Image(systemName: "arrow.2.squarepath")
                                    Spacer()
                                    Image(systemName: "heart")
                                    Spacer()
                                    Image(systemName: "square.and.arrow.up")
                                    Spacer()
                                        
                                }
                                .padding(.vertical, 3)
                                
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
