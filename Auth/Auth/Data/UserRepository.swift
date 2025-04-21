//
//  UserRepository.swift
//  Auth
//
//  Created by CHATHURA ELLAWALA on 06/11/2024.
//

protocol UserRepositoryProtocol {
    func loginUser(username: String, password: String, completion: @escaping (Bool) -> Void)
    func loginUserPasswordless(completion: @escaping (Bool) -> Void)
    func checkBiometricType() -> String?
}

class UserRepository: UserRepositoryProtocol {
   
    let userDataSource: UserDataSourceProtocol
    
    init(userDataSource: UserDataSourceProtocol) {
        self.userDataSource = userDataSource
    }
    
    func loginUser(username: String, password: String, completion: @escaping (Bool) -> Void) {
        self.userDataSource.loginUser(username: username, password: password) { result in
            switch result {
            case .success(let userResponse):
                self.userDataSource.saveUser(userResponse: userResponse)
                self.userDataSource.storeAccessToken(accessToken: userResponse.accessToken)
                self.userDataSource.storeRefreshToken(refreshToken: userResponse.refreshToken)
                completion(true)
                break
            default:
                completion(false)
                break
            }
        }
    }
    
    func checkBiometricType() -> String? {
        return self.userDataSource.checkBiometricType()
    }
    
    func loginUserPasswordless(completion: @escaping (Bool) -> Void) {
        self.userDataSource.verifyBiometric { result in
            switch result {
            case .success:
                do {
                    let userDetails = try self.userDataSource.fetchUserDetails()
                    guard let password = userDetails?.password, let username = userDetails?.email else {
                        return completion(false)
                    }
                    self.userDataSource.loginUser(username: username, password: password) { result in
                        switch result {
                        case .success(let userResponse):
                            self.userDataSource.saveUser(userResponse: userResponse)
                            self.userDataSource.storeAccessToken(accessToken: userResponse.accessToken)
                            self.userDataSource.storeRefreshToken(refreshToken: userResponse.refreshToken)
                            completion(true)
                            break
                        default:
                            completion(false)
                            break
                        }
                    }
                } catch let error {
                    print("Cannot retrive logs from coredataStack: \(error.localizedDescription)")
                    completion(false)
                }
                break
            case .failure(let error):
                print("Cannot verify biometrics: \(error.localizedDescription)")
                completion(false)
                break
            }
        }
    }
}
