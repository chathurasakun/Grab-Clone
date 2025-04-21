//
//  AuthCoordinator.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 14/11/2024.
//

import Foundation
import UIKit
import Common
import ServiceItem
import Swinject

public class AuthCoordinator: CoordinatorProtocol {
    
    public var childCoordinators: [any CoordinatorProtocol] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let splashViewController = SplashViewController()
        splashViewController.coordinator = self
        navigationController.pushViewController(splashViewController, animated: true)
    }

    func navigatetoLoginScreen() {
        let viewModel = Container.sharedAuthDIContainer.resolve(LoginViewModelProtocol.self)!
        let loginViewController = LoginViewController(viewModel: viewModel)
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func navigatetoSignUpScreen() {
        let viewModel = Container.sharedAuthDIContainer.resolve(SignUpViewModelProtocol.self)!
        let signUpViewController = SignUpViewController(viewModel: viewModel)
        navigationController.pushViewController(signUpViewController, animated: true)
    }
    
    func navigatetoShoppingCartView() {
        let shoppingCoordinator = ShoppingCoordinator(navigationController: navigationController)
        shoppingCoordinator.parentCoordinator = self
        childCoordinators.append(shoppingCoordinator)
        shoppingCoordinator.start()
    }
}
