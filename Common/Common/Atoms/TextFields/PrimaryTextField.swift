//
//  PrimaryTextField.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 24/11/2024.
//

import UIKit

public protocol PrimaryTextFieldDelegate: AnyObject {
    func primaryTextFieldDidBeginEditing(text: String, type: TextFieldType)
}

public class PrimaryTextField: UIView {
    private var stackView: UIStackView!
    private var textFieldImage: UIImageView!
    private var textField: UITextField!
    private var textFieldBottomLine: UIView!
    private var textFieldConstraint: NSLayoutConstraint!
    private var rightEyecon: UIButton!
    private var errorMsg: UILabel!
    
    private var isVisible: Bool?
    private var type: TextFieldType?
    public weak var delegate: PrimaryTextFieldDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 25
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
        ])
        
        textFieldImage = UIImageView()
        textFieldImage.translatesAutoresizingMaskIntoConstraints = false
        textFieldImage.image = UIImage(named: "")
        textFieldImage.tintColor = AppColor.ImageTint.color
        textFieldImage.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(textFieldImage)
        
        NSLayoutConstraint.activate([
            textFieldImage.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.placeholder = ""
        textField.borderStyle = .none
        textField.returnKeyType = .next
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = AppColor.Title.color
        stackView.addArrangedSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        textFieldBottomLine = UIView()
        textFieldBottomLine.translatesAutoresizingMaskIntoConstraints = false
        textFieldBottomLine.backgroundColor = AppColor.GrayLine.color
        textField.addSubview(textFieldBottomLine)
        
        NSLayoutConstraint.activate([
            textFieldBottomLine.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: -2),
            textFieldBottomLine.leftAnchor.constraint(equalTo: textField.leftAnchor, constant: 0),
            textFieldBottomLine.rightAnchor.constraint(equalTo: textField.rightAnchor, constant: 0)
        ])
        textFieldConstraint = textFieldBottomLine.heightAnchor.constraint(equalToConstant: 1)
        textFieldConstraint.isActive = true
    }
    
    // MARK: - Configure View
    public func configureUI(type: TextFieldType, placeholder: String, validated: Bool?) {
        if let validated = validated {
            textFieldBottomLine.backgroundColor = validated ? AppColor.ButtonActive.color : AppColor.Error.color
        } else {
            textFieldBottomLine.backgroundColor = AppColor.GrayLine.color
        }
        self.type = type
        
        switch type {
        case .email:
            textFieldImage.image = UIImage(named: "email")
            textField.placeholder = placeholder
        case .passowrd:
            textFieldImage.image = UIImage(named: "password")
            textField.placeholder = placeholder
            textField.isSecureTextEntry = isVisible ?? false
            
            rightEyecon = UIButton()
            rightEyecon.translatesAutoresizingMaskIntoConstraints = false
            rightEyecon.setImage(UIImage(named: "eye-open"), for: .normal)
            rightEyecon.tintColor = AppColor.ImageTint.color
            textField.rightView = rightEyecon
            textField.rightViewMode = .always
            
            rightEyecon.addTarget(self, action: #selector(togglePasswordVisible), for: .touchUpInside)
        }
    }
    
    @objc private func togglePasswordVisible(_sender: UIButton) {
        guard let isVisible else { return }
        self.isVisible = !isVisible
        if isVisible {
            rightEyecon.setImage(UIImage(named: "eye-close"), for: .normal)
        } else {
            rightEyecon.setImage(UIImage(named: "eye-open"), for: .normal)
        }
    }
}

// MARK: - TextField Delegates
extension PrimaryTextField: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldBottomLine.backgroundColor = AppColor.ActiveLine.color
        textFieldConstraint.constant = 2
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldBottomLine.backgroundColor = AppColor.GrayLine.color
        textFieldConstraint.constant = 1
    }
    
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let textValue = textField.text else { return }
        guard let type = type else { return }
        delegate?.primaryTextFieldDidBeginEditing(text: textValue, type: type)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.becomeFirstResponder()
        return true
    }
}

