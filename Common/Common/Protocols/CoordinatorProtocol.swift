//
//  CoordinatorProtocol.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 14/11/2024.
//
import UIKit

public protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [CoordinatorProtocol] { get set }
    func start()
}
