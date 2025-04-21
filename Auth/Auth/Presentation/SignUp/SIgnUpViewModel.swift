//
//  SIgnUpViewModel.swift
//  Auth
//
//  Created by CHATHURA ELLAWALA on 15/11/2024.
//

import Foundation

protocol SignUpViewModelProtocol {
    func validatePassword(queryString: String) -> (String, Bool)
}

class SignUpViewModel: NSObject, SignUpViewModelProtocol {
    
    let signupUseCase: SignupUseCaseProtocol
    
    init(signupUseCase: SignupUseCaseProtocol) {
        self.signupUseCase = signupUseCase
    }
    
    func validatePassword(queryString: String) -> (String, Bool) {
        let validated = signupUseCase.validatePasswordText(textString: queryString)
        let success = ("", validated)
        let error = ("Please enter a valid password which must have atleast one capital, simple, special character and number. Should have lenght of 8 characters",  validated)
        return validated ? success : error
    }
}
