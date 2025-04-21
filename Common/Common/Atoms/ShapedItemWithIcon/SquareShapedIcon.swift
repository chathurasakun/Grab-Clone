//
//  SquareShapedIcon.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 25/12/2024.
//
import UIKit

public class SquareShapedIcon: UIView {
    // Components
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    private func setUI() {
        self.backgroundColor = AppColor.MainBG.color
        self.addShadow(radius: 12, opacity: 0.1, offset: CGSize(width: 7, height: 7))
        
        addSubview(icon)
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            icon.heightAnchor.constraint(equalToConstant: 25),
            icon.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scanBtnTapped))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: - configure UI
    public func configureView(image: UIImage, cornerRadius: CGFloat, tintColor: UIColor) {
        icon.image = image
        icon.tintColor = tintColor
        self.layer.cornerRadius = cornerRadius
    }
    
    @objc private func scanBtnTapped() {
        print("it's tapped")
    }
}
