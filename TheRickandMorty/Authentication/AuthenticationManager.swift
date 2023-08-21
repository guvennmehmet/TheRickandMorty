//
//  AuthenticationManager.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 21.08.2023.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private init() { }
    
    func getAuthenticatedUser() throws -> AuthDataResulModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResulModel(user: user)
    }
    
    func createUser(email: String, password: String) async throws -> AuthDataResulModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResulModel(user: authDataResult.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
