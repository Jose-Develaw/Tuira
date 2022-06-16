//
//  Builder.swift
//  Tuira
//
//  Created by José Ibáñez Bengoechea on 12/6/22.
//

import Foundation
import UIKit
import AVFoundation


protocol Builder {
    
    func reset() -> Void
    func withUser(_ user: User) -> Self
    func retweetedBy(_ user: User) -> Self
    func isCommentOf(_ isCommentOf: ObjectIdentifier) -> Self
    func withText(_ text: String) -> Self
    func withImage(_ image: UIImage) -> Self
    func withVideo(_ video: AVPlayer) -> Self
    func isAdd(_ isAd: Bool) -> Self
    func withComments(_ number: Int) -> Self
    func withLikes(_ number: Int) -> Self
    func withRetweets(_ number: Int) -> Self
    
}
