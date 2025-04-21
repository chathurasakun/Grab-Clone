//
//  UserDataSource.swift
//  Auth
//
//  Created by CHATHURA ELLAWALA on 06/11/2024.
//

import CoreData
import Common

protocol UserDataSourceProtocol {
    func saveUser(userResponse: UserResponse)
    func storeAccessToken(accessToken: String)
    func storeRefreshToken(refreshToken: String)
    func fetchUserDetails() throws -> UserDetailsEntity?
    func loginUser(username: String, password: String, completion: @escaping (Result<UserResponse, any Error>) -> Void)
    func checkBiometricType() -> String?
    func verifyBiometric(completion: @escaping(Result<Bool, any Error>) -> Void)
}

class UserDataSource: UserDataSourceProtocol {

    let context: NSManagedObjectContext
    let apiClient: ApiClientProtocol
    let biometricService: BiometricServiceProtocol
    
    init(context: NSManagedObjectContext, apiClient: ApiClientProtocol, biometricService: BiometricServiceProtocol) {
        self.context = context
        self.apiClient = apiClient
        self.biometricService = biometricService
        
    }
    
    func loginUser(username: String, password: String, completion: @escaping (Result<UserResponse, any Error>) -> Void) {
        apiClient.loginUser(username: username, password: password) { result in
            completion(result)
        }
    }
    
    func checkBiometricType() -> String? {
        let biometricType =  self.biometricService.checkBiometrictType()
        switch biometricType {
        case .faceID:
            return "Face ID"
        case .touchID:
            return "Touch ID"
        default:
            return nil
        }
    }
    
    
    func verifyBiometric(completion: @escaping(Result<Bool, any Error>) -> Void) {
        let biometricType = self.biometricService.checkBiometrictType()
        switch biometricType {
        case .faceID, .opticID, .touchID:
            self.biometricService.verifyBiometrics { result in
                completion(result)
            }
            break
        default:
            completion(.failure(NSError(domain: "Biometric type not supported", code: -1, userInfo: nil)))
            break
        }
    }
    
    func saveUser(userResponse: UserResponse) {
        do {
            let userDetailsEntity = UserDetailsEntity(context: context)
            userDetailsEntity.id = userResponse.id
            userDetailsEntity.name = userResponse.name
            userDetailsEntity.email = userResponse.email
            userDetailsEntity.password = userResponse.password
            userDetailsEntity.createdAt = userResponse.createdAt
            userDetailsEntity.updatedAt = userResponse.updatedAt
            userDetailsEntity.userDeleted = userResponse.isDeleted
            context.insert(userDetailsEntity)
            try context.save()
        } catch let error {
            print("Error saving user: \(error.localizedDescription)")
        }
    }
    
    func fetchUserDetails() throws -> UserDetailsEntity? {
        return try context.fetch(UserDetailsEntity.fetchRequest()).first
    }
    
    func storeAccessToken(accessToken: String) {
        // store in keyChain
    }
    
    func storeRefreshToken(refreshToken: String) {
        // store in keyChain
    }
    
    
}
