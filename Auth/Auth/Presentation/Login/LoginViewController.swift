//
//  LoginViewController.swift
//  Auth
//
//  Created by CHATHURA ELLAWALA on 06/11/2024.
//

import UIKit
import Common

class LoginViewController: UIViewController {
    // Variables
    var viewModel: LoginViewModelProtocol!
    weak var coordinator: AuthCoordinator?
    var hidden: Bool = true
    
    // Components
    private var topImage: UIImageView!
    private var loginLabel: UILabel!
    
    private var emailStackView: UIStackView!
    private var emailImage: UIImageView!
    private var emailTextField: UITextField!
    private var emailBottomLine: UIView!
    private var emailConstraint: NSLayoutConstraint!
    
    private var passwordStackView: UIStackView!
    private var passwordImage: UIImageView!
    private var passwordTextField: UITextField!
    private var passwordBottomLine: UIView!
    private var passwordConstraint: NSLayoutConstraint!
    private var rightEyecon: UIButton!
    
    private var forgotPasswordButton: UIButton!
    
    private var loginButton: PrimaryButton!
    
    private var leftSpaceview: UIView!
    private var orLable: UILabel!
    private var rightSpaceview: UIView!
    
    private var biometricStackView: UIStackView!
    private var biometricLabel: UILabel!
    private var biometricButton: UIButton!
    
    private var signUpStackView: UIStackView!
    private var infoLabel: UILabel!
    private var signUpButton: UIButton!
    
    private var gapView: UIView!
    
    // MARK: - Life Cycle methods
    init(viewModel: LoginViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = AppColor.MainBG.color
        setUpUI()
        configUI()
    }
    
    deinit {
        print("LoginViewController deinit")
    }
    
    // MARK: - Setup UI
    private func setUpUI() {
        let safeArea = view.safeAreaLayoutGuide
        self.navigationController?.navigationBar.isHidden = true
        
        topImage = UIImageView()
        topImage.translatesAutoresizingMaskIntoConstraints = false
        topImage.image = UIImage(named: "happyWoman")
        topImage.contentMode = .scaleAspectFit
        view.addSubview(topImage)
        
        NSLayoutConstraint.activate([
            topImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            topImage.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20),
            topImage.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20),
            topImage.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        loginLabel = UILabel()
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.text = "Login"
        loginLabel.font = .systemFont(ofSize: 35, weight: .semibold)
        loginLabel.textColor = AppColor.Title.color
        view.addSubview(loginLabel)
        
        NSLayoutConstraint.activate([
            loginLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            loginLabel.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: (25))
        ])
        
        emailStackView = UIStackView()
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        emailStackView.axis = .horizontal
        emailStackView.distribution = .fill
        emailStackView.spacing = 25
        view.addSubview(emailStackView)
        
        NSLayoutConstraint.activate([
            emailStackView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),
            emailStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            emailStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)
        ])
        
        emailImage = UIImageView()
        emailImage.translatesAutoresizingMaskIntoConstraints = false
        emailImage.image = UIImage(named: "email")
        emailImage.tintColor = AppColor.ImageTint.color
        emailImage.contentMode = .scaleAspectFit
        emailStackView.addArrangedSubview(emailImage)
        
        NSLayoutConstraint.activate([
            emailImage.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
        emailTextField.placeholder = "Email ID"
        emailTextField.borderStyle = .none
        emailTextField.returnKeyType = .next
        emailTextField.font = .systemFont(ofSize: 15, weight: .regular)
        emailTextField.textColor = AppColor.Title.color
        emailStackView.addArrangedSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        emailBottomLine = UIView()
        emailBottomLine.translatesAutoresizingMaskIntoConstraints = false
        emailBottomLine.backgroundColor = AppColor.GrayLine.color
        emailTextField.addSubview(emailBottomLine)
        
        NSLayoutConstraint.activate([
            emailBottomLine.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: -2),
            emailBottomLine.leftAnchor.constraint(equalTo: emailTextField.leftAnchor, constant: 0),
            emailBottomLine.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: 0)
        ])
        emailConstraint = emailBottomLine.heightAnchor.constraint(equalToConstant: 1)
        emailConstraint.isActive = true
        
        passwordStackView = UIStackView()
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        passwordStackView.axis = .horizontal
        passwordStackView.distribution = .fill
        passwordStackView.spacing = 25
        view.addSubview(passwordStackView)
        
        NSLayoutConstraint.activate([
            passwordStackView.topAnchor.constraint(equalTo: emailBottomLine.bottomAnchor, constant: 22),
            passwordStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            passwordStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25)
        ])
        
        passwordImage = UIImageView()
        passwordImage.translatesAutoresizingMaskIntoConstraints = false
        passwordImage.image = UIImage(named: "password")
        passwordImage.tintColor = AppColor.ImageTint.color
        passwordImage.contentMode = .scaleAspectFit
        passwordStackView.addArrangedSubview(passwordImage)
        
        NSLayoutConstraint.activate([
            passwordImage.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate = self
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = hidden
        passwordTextField.borderStyle = .none
        passwordTextField.returnKeyType = .done
        passwordTextField.font = .systemFont(ofSize: 15, weight: .regular)
        passwordTextField.textColor = AppColor.Title.color
        passwordStackView.addArrangedSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        rightEyecon = UIButton()
        rightEyecon.translatesAutoresizingMaskIntoConstraints = false
        rightEyecon.setImage(UIImage(named: "eye-open"), for: .normal)
        rightEyecon.tintColor = AppColor.ImageTint.color
        passwordTextField.rightView = rightEyecon
        passwordTextField.rightViewMode = .always
        
        rightEyecon.addTarget(self, action: #selector(togglePasswordVisible), for: .touchUpInside)
        
        passwordBottomLine = UIView()
        passwordBottomLine.translatesAutoresizingMaskIntoConstraints = false
        passwordBottomLine.backgroundColor = AppColor.GrayLine.color
        passwordTextField.addSubview(passwordBottomLine)
        
        NSLayoutConstraint.activate([
            passwordBottomLine.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: -2),
            passwordBottomLine.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor, constant: 0),
            passwordBottomLine.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: 0)
        ])
        passwordConstraint =   passwordBottomLine.heightAnchor.constraint(equalToConstant: 1)
        passwordConstraint.isActive = true
        
        forgotPasswordButton = UIButton()
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitle("Forgot Password?", for: .normal)
        forgotPasswordButton.setTitleColor(AppColor.ButtonActive.color, for: .normal)
        forgotPasswordButton.tintColor = AppColor.ButtonActive.color
        forgotPasswordButton.backgroundColor = .clear
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 15,weight: .medium)
        view.addSubview(forgotPasswordButton)
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20)
        ])
        
        forgotPasswordButton.addTarget(self, action: #selector(onTapForgotPassword), for: .touchUpInside)
        
        loginButton = PrimaryButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.configureUI(title: "Login")
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 22),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
        ])
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        leftSpaceview = UIView()
        leftSpaceview.translatesAutoresizingMaskIntoConstraints = false
        leftSpaceview.backgroundColor = AppColor.GrayLine.color
        view.addSubview(leftSpaceview)
        
        NSLayoutConstraint.activate([
            leftSpaceview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            leftSpaceview.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 40),
            leftSpaceview.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        orLable = UILabel()
        orLable.translatesAutoresizingMaskIntoConstraints = false
        orLable.text = "OR"
        orLable.font = .systemFont(ofSize: 17, weight: .medium)
        orLable.textColor = AppColor.GrayLine.color
        view.addSubview(orLable)
        
        NSLayoutConstraint.activate([
            orLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orLable.centerYAnchor.constraint(equalTo: leftSpaceview.centerYAnchor),
            orLable.leftAnchor.constraint(equalTo: leftSpaceview.rightAnchor, constant: 7)
        ])
        
        rightSpaceview = UIView()
        rightSpaceview.translatesAutoresizingMaskIntoConstraints = false
        rightSpaceview.backgroundColor = AppColor.GrayLine.color
        view.addSubview(rightSpaceview)
        
        NSLayoutConstraint.activate([
            rightSpaceview.leftAnchor.constraint(equalTo: orLable.rightAnchor, constant: 7),
            rightSpaceview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            rightSpaceview.centerYAnchor.constraint(equalTo: leftSpaceview.centerYAnchor, constant: 0),
            rightSpaceview.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        biometricStackView = UIStackView()
        biometricStackView.translatesAutoresizingMaskIntoConstraints = false
        biometricStackView.axis = .horizontal
        biometricStackView.alignment = .fill
        biometricStackView.distribution = .fill
        biometricStackView.spacing = 10
        view.addSubview(biometricStackView)
        
        NSLayoutConstraint.activate([
            biometricStackView.topAnchor.constraint(equalTo: orLable.bottomAnchor, constant: 15),
            biometricStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25),
            biometricStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
        ])
        
        signUpStackView = UIStackView()
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        signUpStackView.axis = .horizontal
        signUpStackView.distribution = .fill
        signUpStackView.spacing = 10
        view.addSubview(signUpStackView)
        
        NSLayoutConstraint.activate([
            signUpStackView.topAnchor.constraint(equalTo: biometricStackView.bottomAnchor, constant: 30),
            signUpStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            signUpStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0)
        ])
        
        infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.textColor = AppColor.Title.color
        infoLabel.textAlignment = .center
        infoLabel.font = .systemFont(ofSize: 15)
        infoLabel.text = "Don't have an account? "
        signUpStackView.addArrangedSubview(infoLabel)
        
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(AppColor.ButtonActive.color, for: .normal)
        signUpButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        signUpButton.backgroundColor = .clear
        signUpStackView.addArrangedSubview(signUpButton)
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        gapView = UIView()
        gapView.translatesAutoresizingMaskIntoConstraints = false
        gapView.backgroundColor = .clear
        view.addSubview(gapView)
        
        NSLayoutConstraint.activate([
            gapView.topAnchor.constraint(equalTo: signUpStackView.bottomAnchor, constant: 0),
            gapView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            gapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            gapView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        ])
    }
    
    private func configUI() {
        emailTextField.becomeFirstResponder()
        
        let biometricType = viewModel.checkBiometricType()
        if biometricType == "Face ID" || biometricType == "Touch ID" {
            biometricLabel = UILabel()
            biometricLabel.translatesAutoresizingMaskIntoConstraints = false
            biometricLabel.text = "click the biometric icon to login with passwordless"
            biometricLabel.textAlignment = .left
            biometricLabel.numberOfLines = 2
            biometricLabel.font = .systemFont(ofSize: 14, weight: .light)
            biometricLabel.textColor = AppColor.GrayLine.color
            biometricStackView.addArrangedSubview(biometricLabel)
            
            biometricButton = UIButton()
            biometricButton.translatesAutoresizingMaskIntoConstraints = false
            
            let biometricImage = biometricType == "Face ID" ? UIImage(named: "face-id") : UIImage(named: "touch-id")
            biometricButton.setImage(biometricImage, for: .normal)
            biometricButton.tintColor = AppColor.GrayLine.color
            biometricStackView.addArrangedSubview(biometricButton)
            
            NSLayoutConstraint.activate([
                biometricButton.widthAnchor.constraint(equalToConstant: 44),
                biometricButton.heightAnchor.constraint(equalToConstant: 44)
            ])
            
            biometricButton.addTarget(self, action: #selector(onTapPasswordless), for: .touchUpInside)
        }
    }
    
    @objc private func onTapPasswordless() {
        viewModel.loginUserPasswordless { isSuccess in
            if isSuccess {
                DispatchQueue.main.async {
                    self.coordinator?.navigatetoShoppingCartView()
                }
            } else {
                
            }
        }
    }
    
    @objc private func togglePasswordVisible() {
        self.hidden = !self.hidden
        if hidden {
            rightEyecon.setImage(UIImage(named: "eye-open"), for: .normal)
        } else {
            rightEyecon.setImage(UIImage(named: "eye-close"), for: .normal)
        }
        passwordTextField.isSecureTextEntry = hidden
    }
    
    @objc private func onTapForgotPassword() {
        
    }
    
    @objc private func loginButtonTapped() {
        viewModel.loginUser { isSuccess in
            if (isSuccess) {
                self.coordinator?.navigatetoShoppingCartView()
            } else {
                
            }
        }
    }
    
    @objc private func signUpButtonTapped() {
        coordinator?.navigatetoSignUpScreen()
    }
    
}

// MARK: - TextField Delegates
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            emailBottomLine.backgroundColor = AppColor.ActiveLine.color
            emailConstraint.constant = 2
        case passwordTextField:
            passwordBottomLine.backgroundColor = AppColor.ActiveLine.color
            passwordConstraint.constant = 2
        default:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            emailBottomLine.backgroundColor = AppColor.GrayLine.color
            emailConstraint.constant = 1
        case passwordTextField:
            passwordBottomLine.backgroundColor = AppColor.GrayLine.color
            passwordConstraint.constant = 1
        default:
            break
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let textValue = textField.text else { return }
        print(textValue)
        
        switch textField {
        case emailTextField:
            viewModel.username = textValue
        case passwordTextField:
            viewModel.password = textValue
        default:
            break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
