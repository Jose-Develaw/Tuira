//
//  User.swift
//  Tuira
//
//  Created by José Ibáñez Bengoechea on 12/6/22.
//

import SwiftUI

class User : ObservableObject {
    
    var displayName : String
    var atName : String
    var isVerified : Bool
    @Published var profilePic : UIImage?
    
    init(displayName: String, atName: String, isVerified: Bool = false){
        self.displayName = displayName
        self.atName = atName
        self.isVerified = isVerified
    }
}
