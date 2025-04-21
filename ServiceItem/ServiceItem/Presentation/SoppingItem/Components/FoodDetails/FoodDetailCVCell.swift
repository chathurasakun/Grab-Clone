//
//  FoodDetailCVCell.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 05/01/2025.
//
import UIKit
import Common

class FoodDetailCVCell: UICollectionViewCell {
    static let identifier: String = "FoodDetailCVCell"
    
    // Components
    let imageContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 7
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = AppColor.Title.color
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let secondaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = AppColor.Title.color
        label.textAlignment = .left
        label.text = "Secondary Label"
        label.numberOfLines = 1
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = AppColor.Title.color
        label.textAlignment = .left
        label.text = "Price Label"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        discountView.isHidden = true
    }
    
    // MARK: - Setup UI
    private func setUI() {
        self.backgroundColor = .clear
        
        addSubview(imageContainer)
        NSLayoutConstraint.activate([
            imageContainer.heightAnchor.constraint(equalToConstant: 130),
            imageContainer.widthAnchor.constraint(equalToConstant: 130),
            imageContainer.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageContainer.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        ])
        
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 15),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -2)
        ])
        
        addSubview(secondaryLabel)
        NSLayoutConstraint.activate([
            secondaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            secondaryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            secondaryLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -2)
        ])
        
        addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: secondaryLabel.bottomAnchor, constant: 10),
            priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -2),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    // MARK: - Configure View
    func configureView(
        with image: String,
        headline: String,
        subHeadline: String,
        price: String
    ) {
        imageContainer.image = UIImage(named: image)
        titleLabel.text = headline
        secondaryLabel.text = subHeadline
        priceLabel.text = price
    }
}

