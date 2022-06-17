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

struct HomeView: View {
    @State var tweets = [Tweet]()
    var body: some View {
        ScrollView {
            LazyVStack (pinnedViews: [.sectionHeaders]){
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

struct ContentView: View {
    
    
    @State private var selected = 1
    
    var body: some View {
        ZStack(alignment: Alignment.bottom) {
                    TabView(selection: $selected) {
                        HomeView().tabItem {
                            Text("") // < invisible tab item
                        }.tag(1)
                    }
            HStack(alignment: .top){
                Group{
                        Spacer()
                    TabbarButton(selected: $selected, systemImage: "house", selectionNumber: 1)
                       
                        Spacer()
                    TabbarButton(selected: $selected, systemImage: "magnifyingglass.circle", selectionNumber: 2)
                        Spacer()
                }
                Group{
                    TabbarButton(selected: $selected, systemImage: "person.2", selectionNumber: 3)
                        
                        Spacer()
                    TabbarButton(selected: $selected, systemImage: "bell", selectionNumber: 4)
                        
                        Spacer()
                    TabbarButton(selected: $selected, systemImage: "envelope", selectionNumber: 5)
                        
                        Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
