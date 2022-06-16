//
//  TweetText.swift
//  Tuira
//
//  Created by José Ibáñez Bengoechea on 16/6/22.
//

import SwiftUI

struct TweetText: View {
    
    let tweet : Tweet
    
    func textWithHashtags(_ text: String, color: Color) -> Text {
        let words = text.split(separator: " ")
        var output: Text = Text("")

        for word in words {
            if word.hasPrefix("#") || word.hasPrefix("@") { // Pick out hash in words
                output = output + Text(" ") + Text(String(word))
                    .foregroundColor(color) // Add custom styling here
            } else {
                output = output + Text(" ") + Text(String(word))
            }
        }
        return output
    }
    
    var body: some View {
        textWithHashtags(tweet.text ?? "", color: .twitterBlue)
            .font(.callout)
    }
}

struct TweetText_Previews: PreviewProvider {
    static var previews: some View {
        TweetText(tweet: Tweet())
    }
}
