//
//  DiscountTag.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 31/12/2024.
//
import UIKit

public class DiscountTag: UIView {
    // Components
    private let discountIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "price-tag")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .orange
        return imageView
    }()
    
    private let discountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColor.Title.color
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        label.text = "Up to 10%"
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = AppColor.GrayLine.color.cgColor
        
        addSubview(discountIcon)
        NSLayoutConstraint.activate([
            discountIcon.leftAnchor.constraint(equalTo: leftAnchor, constant: 7),
            discountIcon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            discountIcon.heightAnchor.constraint(equalToConstant: 10),
            discountIcon.widthAnchor.constraint(equalToConstant: 15)
        ])
        
        addSubview(discountLabel)
        NSLayoutConstraint.activate([
            discountLabel.leftAnchor.constraint(equalTo: discountIcon.rightAnchor, constant: 5),
            discountLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            discountLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -7)
        ])
    }
    
    // MARK: - Configure view
    public func configureView(with discount: Int) {
        discountLabel.text = "Up to " + String(discount) + "%"
    }
}
