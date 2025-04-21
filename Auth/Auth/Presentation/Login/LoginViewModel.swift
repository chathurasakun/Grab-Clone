//
//  LoginViewModel.swift
//  Auth
//
//  Created by CHATHURA ELLAWALA on 06/11/2024.
//

protocol LoginViewModelProtocol {
    var username: String { get set }
    var password: String { get set }
    func loginUser(completion: @escaping (Bool) -> Void)
    func loginUserPasswordless(completion: @escaping (Bool) -> Void)
    func checkBiometricType() -> String?
    func validateEmail(text: String) -> Bool
    func validatePassword(text: String) -> Bool
}

class LoginViewModel: NSObject, LoginViewModelProtocol {
    let loginUseCase: LoginUseCaseProtocol
    var username: String = ""
    var password: String = ""
    
    init(userUseCase: LoginUseCaseProtocol) {
        self.loginUseCase = userUseCase
    }
    
    func loginUser(completion: @escaping (Bool) -> Void) {
        loginUseCase.loginUser(username: username, password: password) { isSuccess in
            completion(isSuccess)
        }
    }
    
    func loginUserPasswordless(completion: @escaping (Bool) -> Void) {
        loginUseCase.loginUserPasswordless { isSuccess in
            completion(isSuccess)
        }
    }
    
    func checkBiometricType() -> String? {
        return self.loginUseCase.checkBiometricType()
    }
    
    func validateEmail(text: String) -> Bool {
        return self.loginUseCase.validateEmailText(textString: text)
    }
    
    func validatePassword(text: String) -> Bool {
        return self.loginUseCase.validatePasswordText(textString: text)
    }
}
