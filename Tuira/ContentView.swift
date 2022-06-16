//
//  ContentView.swift
//  Tuira
//
//  Created by José Ibáñez Bengoechea on 12/6/22.
//

import SwiftUI


struct Separator: View {
    
    var body: some View {
               Divider()
                    .padding(.top, 2)
    }
}

struct ContentView: View {
    
    @State var tweets = [Tweet]()
    
    var body: some View {
        ScrollView {
            LazyVStack (){
                ForEach (tweets, id: \.id) { tweet in
                    TweetView(tweet: tweet)
            }
        }
        .onAppear(){
            TweetDatabase.seedTweets()
            tweets = TweetDatabase.getAllTweets()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
