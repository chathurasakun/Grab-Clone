//
//  SignUpUaseCase.swift
//  Auth
//
//  Created by CHATHURA ELLAWALA on 03/12/2024.
//
import Common

protocol SignupUseCaseProtocol {
    func validatePasswordText(textString: String) -> Bool
    func validateEmailText(textString: String) -> Bool
}

class SignupUseCase: SignupUseCaseProtocol, ValidatorProtocol {
    let userRepository: UserRepositoryProtocol
    
    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
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
