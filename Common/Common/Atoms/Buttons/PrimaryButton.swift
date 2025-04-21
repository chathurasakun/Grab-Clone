//
//  PrimaryButton.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 24/11/2024.
//

import UIKit

public class PrimaryButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setUpUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle("", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = AppColor.ButtonActive.color
        self.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Configure UI
    public func configureUI(title: String) {
        self.setTitle(title, for: .normal)
    }
}
