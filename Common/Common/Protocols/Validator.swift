//
//  Validator.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 24/11/2024.
//

import Foundation

public protocol ValidatorProtocol {
    func validatePassword(text: String) throws -> Bool
    func validateEmail(text: String) throws -> Bool
}

public extension ValidatorProtocol {
    func validatePassword(text: String) throws -> Bool {
        let regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: text)
    }
    
    func validateEmail(text: String) throws -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: text)
    }
}
