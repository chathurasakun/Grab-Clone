//
//  UserUseCase.swift
//  Auth
//
//  Created by CHATHURA ELLAWALA on 06/11/2024.
//
import Common

protocol LoginUseCaseProtocol {
    func loginUser(username: String, password: String, completion: @escaping (Bool) -> Void)
    func loginUserPasswordless(completion: @escaping(Bool) -> Void)
    func checkBiometricType() -> String?
    func validatePasswordText(textString: String) -> Bool
    func validateEmailText(textString: String) -> Bool
}

class LoginUseCase: LoginUseCaseProtocol, ValidatorProtocol {

    let userRepository: UserRepositoryProtocol
    
    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
    
    func loginUser(username: String, password: String, completion: @escaping (Bool) -> Void) {
        userRepository.loginUser(username: username, password: password) { isSuccess in
            completion(isSuccess)
        }
    }
    
    func loginUserPasswordless(completion: @escaping(Bool) -> Void) {
        userRepository.loginUserPasswordless { isSuccess in
            completion(isSuccess)
        }
    }
    
    func checkBiometricType() -> String? {
        return self.userRepository.checkBiometricType()
    }
    
    func validatePasswordText(textString: String) -> Bool {
        do {
            return try validatePassword(text: textString)
        } catch {
            return false
        }
    }
    
    func validateEmailText(textString: String) -> Bool {
        do {
            return try validateEmail(text: textString)
        } catch {
            return false
        }
    }
}
