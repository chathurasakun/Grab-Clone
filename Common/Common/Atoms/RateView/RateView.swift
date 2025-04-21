//
//  RateView.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 29/12/2024.
//
import UIKit

public class RateView: UIView {
    // Components
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "star")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let rateValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = AppColor.Title.color
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        addSubview(starImageView)
        NSLayoutConstraint.activate([
            starImageView.leftAnchor.constraint(equalTo: leftAnchor,constant: 0),
            starImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            starImageView.heightAnchor.constraint(equalToConstant: 12),
            starImageView.widthAnchor.constraint(equalToConstant: 12)
        ])
        
        addSubview(rateValueLabel)
        NSLayoutConstraint.activate([
            rateValueLabel.leftAnchor.constraint(equalTo: starImageView.rightAnchor, constant: 5),
            rateValueLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            rateValueLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5)
        ])
    }
    
    // MARK: - configure View
    public func configureView(with rating: Double) {
        rateValueLabel.text = String(rating)
    }
}
