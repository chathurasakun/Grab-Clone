//
//  SignUpViewController.swift
//  Auth
//
//  Created by CHATHURA ELLAWALA on 15/11/2024.
//

import UIKit
import Common

class SignUpViewController: UIViewController {
    
    // MARK: - Components
    private var textFieldStackView: UIStackView!
    private var firstnameField: PrimaryTextField!
    private var lastnameField: PrimaryTextField!
    private var emailField: PrimaryTextField!
    private var passwordField: PrimaryTextField!
    private var confirmPasswordField: PrimaryTextField!
    private var telephoneField: PrimaryTextField!
    
    private var signUpButton: PrimaryButton!
    
    private var gapView: UIView!
    
    // MARK: - Variables
    var viewModel: SignUpViewModelProtocol!
    
    // MARK: - Life Cycle methods
    init(viewModel: SignUpViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setUpUI()
    }
    
    deinit {
        print("SignUpViewController deinit")
    }
    
    // MARK: - Setup View
    private func setUpUI() {
        let safeArea = view.safeAreaLayoutGuide
        textFieldStackView = UIStackView()
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = 15
        textFieldStackView.distribution = .fill
        textFieldStackView.alignment = .fill
        view.addSubview(textFieldStackView)
        
        NSLayoutConstraint.activate([
            textFieldStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            textFieldStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            textFieldStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0),
            textFieldStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        firstnameField = PrimaryTextField()
        firstnameField.translatesAutoresizingMaskIntoConstraints = false
        firstnameField.delegate = self
        textFieldStackView.addArrangedSubview(firstnameField)
        
        firstnameField.configureUI(type: .email, placeholder: "First Name", validated: nil)
        
        NSLayoutConstraint.activate([
            firstnameField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        lastnameField = PrimaryTextField()
        lastnameField.translatesAutoresizingMaskIntoConstraints = false
        lastnameField.delegate = self
        textFieldStackView.addArrangedSubview(lastnameField)
        
        lastnameField.configureUI(type: .email, placeholder: "Last Name", validated: nil)
        
        NSLayoutConstraint.activate([
            lastnameField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        
        emailField = PrimaryTextField()
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.delegate = self
        textFieldStackView.addArrangedSubview(emailField)
        
        emailField.configureUI(type: .email, placeholder: "Email", validated: nil)
        
        NSLayoutConstraint.activate([
            emailField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        passwordField = PrimaryTextField()
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.delegate = self
        textFieldStackView.addArrangedSubview(passwordField)
        
        passwordField.configureUI(type: .email, placeholder: "Password", validated: nil)
        
        NSLayoutConstraint.activate([
            passwordField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        confirmPasswordField = PrimaryTextField()
        confirmPasswordField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordField.delegate = self
        textFieldStackView.addArrangedSubview(confirmPasswordField)
        
        confirmPasswordField.configureUI(type: .email, placeholder: "Confirm Password:", validated: nil)
        
        NSLayoutConstraint.activate([
            confirmPasswordField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        telephoneField = PrimaryTextField()
        telephoneField.translatesAutoresizingMaskIntoConstraints = false
        telephoneField.delegate = self
        textFieldStackView.addArrangedSubview(telephoneField)
        
        telephoneField.configureUI(type: .email, placeholder: "Telephone", validated: nil)
        
        NSLayoutConstraint.activate([
            telephoneField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        textFieldStackView.setCustomSpacing(30, after: telephoneField)
        
        signUpButton = PrimaryButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        textFieldStackView.addArrangedSubview(signUpButton)
        signUpButton.configureUI(title: "Sign Up")
        
        NSLayoutConstraint.activate([
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        
        gapView = UIView()
        gapView.translatesAutoresizingMaskIntoConstraints = false
        textFieldStackView.addArrangedSubview(gapView)
    }
    
    @objc private func signUpTapped() {
        
    }
}

// MARK: - PrimaryTextField Delegates
extension SignUpViewController: PrimaryTextFieldDelegate {    
    func primaryTextFieldDidBeginEditing(text: String, type: Common.TextFieldType) {
        switch type {
        case .email:
            break
        case .passowrd:
            let (_, success) = viewModel.validatePassword(queryString: text)
            passwordField.configureUI(type: .passowrd, placeholder: "Password", validated: success)
            break
        default:
            break
        }
        print("type ", type, "text ", text);
    }
}
