//
//  AuthDIContainer.swift
//  Auth
//
//  Created by CHATHURA ELLAWALA on 19/11/2024.
//

import Swinject
import CoreData
import Common
import LocalAuthentication

extension Container {
    static let sharedAuthDIContainer: Container = {
        let container = Container()
        
        /// Register basic services
        // MARK: - Login
        container.register(ApiClientProtocol.self) { _ in ApiClient()}
        container.register(NSManagedObjectContext.self) { _ in
            return CoreDataStack.shared.context!
        }
        container.register(BiometricServiceProtocol.self) { resolver in
            return BiometricService()
        }
        container.register(UserDataSourceProtocol.self) { resolver in
            let context = resolver.resolve(NSManagedObjectContext.self)!
            let apiClient = resolver.resolve(ApiClientProtocol.self)!
            let biometricService = resolver.resolve(BiometricServiceProtocol.self)!
            return UserDataSource(context: context, apiClient: apiClient, biometricService: biometricService)
        }
        container.register(UserRepositoryProtocol.self) { resolver in
            let userDataSource = resolver.resolve(UserDataSourceProtocol.self)!
            return UserRepository(userDataSource: userDataSource)
        }
        container.register(LoginUseCaseProtocol.self) { resolver in
            let userRepository = resolver.resolve(UserRepositoryProtocol.self)!
            return LoginUseCase(userRepository: userRepository)
        }
        container.register(LoginViewModelProtocol.self) { resolver in
            let userUseCase = resolver.resolve(LoginUseCaseProtocol.self)!
            return LoginViewModel(userUseCase: userUseCase)
        }
        
        // MARK: - Sign up
        container.register(SignupUseCaseProtocol.self) { resolver in
            let userRepository = resolver.resolve(UserRepositoryProtocol.self)!
            return SignupUseCase(userRepository: userRepository)
        }
        container.register(SignUpViewModelProtocol.self) { resolver in
            let signupUseCase = resolver.resolve(SignupUseCaseProtocol.self)!
            return SignUpViewModel(signupUseCase: signupUseCase)
        }
        
        return container
    }()
    
    
}
