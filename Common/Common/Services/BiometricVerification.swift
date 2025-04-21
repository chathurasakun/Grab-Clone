//
//  BiometricVerification.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 23/11/2024.
//

import LocalAuthentication

public protocol BiometricServiceProtocol {
    func verifyBiometrics(completion: @escaping (Result<Bool, Error>) -> Void)
    func checkBiometrictType() -> LABiometryType?
}

public class BiometricService: BiometricServiceProtocol {
       
    let context: LAContext = LAContext()
    
    public init() {}
    
    public func checkBiometrictType() -> LABiometryType? {
        var error: NSError?
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return nil
        }
        return context.biometryType
    }
    
    public func verifyBiometrics(completion: @escaping (Result<Bool, Error>) -> Void) {
        let reason = "Please authenticate to continue"
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, error) in
            if success {
                completion(.success(success))
                return
            }
            
            guard let error = error as? LAError else {
                completion(.failure(error ?? NSError(domain: "Cannot evaluate user with biometrics", code: -1, userInfo: nil)))
                return
            }
            
            completion(.failure(error))
        }
    }
}
