//
//  AuthDataResultModel.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 21.08.2023.
//

import Foundation
import FirebaseAuth

struct AuthDataResulModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}
