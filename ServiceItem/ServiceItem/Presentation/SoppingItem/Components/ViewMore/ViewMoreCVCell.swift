//
//  ViewMoreCVCell.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 05/01/2025.
//
import UIKit
import Common

class ViewMoreCVCell: UICollectionViewCell {
    static let identifier = "ViewMoreTVCell"
    
    // Components
    private let circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColor.MainBG.color
        return view
    }()
    
    private let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        self.backgroundColor = .clear
        self.contentView.isUserInteractionEnabled = true
        
        addSubview(circleView)
        NSLayoutConstraint.activate([
            circleView.heightAnchor.constraint(equalToConstant: 60),
            circleView.widthAnchor.constraint(equalToConstant: 60),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
        circleView.layer.cornerRadius = 30
        circleView.addShadow(radius: 5, opacity: 0.1, offset: CGSize(width: 1, height: 5))
        
        let buttonTapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapMore))
        circleView.addGestureRecognizer(buttonTapGesture)
        
        circleView.addSubview(arrowImage)
        NSLayoutConstraint.activate([
            arrowImage.heightAnchor.constraint(equalToConstant: 32),
            arrowImage.widthAnchor.constraint(equalToConstant: 32),
            arrowImage.centerXAnchor.constraint(equalTo: circleView.centerXAnchor, constant: 0),
            arrowImage.centerYAnchor.constraint(equalTo: circleView.centerYAnchor, constant: 0)
        ])
    }

    @objc private func onTapMore() {
        print("Tap for more")
    }
}
