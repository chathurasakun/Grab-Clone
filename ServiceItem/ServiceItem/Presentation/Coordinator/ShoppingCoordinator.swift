//
//  ShoppingCoordinator.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 16/11/2024.
//

import UIKit
import Common
import Swinject

public class ShoppingCoordinator: CoordinatorProtocol {
    public var navigationController: UINavigationController
    public var childCoordinators: [any CoordinatorProtocol] = []
    public weak var parentCoordinator: CoordinatorProtocol?
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        let viewModel = Container.sharedServiceItemDIContainer.resolve(ShoppingItemViewModelProtocol.self)!
        let shoppingItemViewController = ShoppingItemViewController(viewModel: viewModel)
        shoppingItemViewController.coordinator = self
        navigationController.setViewControllers([shoppingItemViewController], animated: true)
    }
    
    
}
