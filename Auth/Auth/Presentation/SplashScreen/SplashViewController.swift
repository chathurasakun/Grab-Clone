//
//  SplashViewController.swift
//  Auth
//
//  Created by CHATHURA ELLAWALA on 16/11/2024.
//
import UIKit

class SplashViewController: UIViewController {
    // Variables
    weak var coordinator: AuthCoordinator?
    
    // MARK: - Life Cycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigateToLoginScreen()
    }
    
    private func navigateToLoginScreen() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { [weak self] _ in
            self?.coordinator?.navigatetoLoginScreen()
        })
    }
}
