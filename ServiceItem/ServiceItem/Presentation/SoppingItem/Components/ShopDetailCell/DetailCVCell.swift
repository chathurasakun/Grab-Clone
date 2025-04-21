//
//  DetailCVCell.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 29/12/2024.
//
import UIKit
import Common

class DetailCVCell: UICollectionViewCell {
    static let identifier: String = "DetailCVCell"
    
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
    
    private let detailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    private let adLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = AppColor.Title.color
        label.textAlignment = .left
        label.text = "Ad"
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
    
    private let rateView: RateView = {
        let view = RateView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let gapLabel: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let discountView: DiscountTag = {
        let view = DiscountTag()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.isHidden = true
        return view
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
        discountView.isHidden = true
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
        
        addSubview(detailStackView)
        NSLayoutConstraint.activate([
            detailStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            detailStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            detailStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
        ])
        
        detailStackView.addArrangedSubview(adLabel)
        detailStackView.addArrangedSubview(secondaryLabel)
        
        detailStackView.setCustomSpacing(7, after: secondaryLabel)
        
        detailStackView.addArrangedSubview(rateView)
        NSLayoutConstraint.activate([
            rateView.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        detailStackView.addArrangedSubview(gapLabel)
        
        addSubview(discountView)
        NSLayoutConstraint.activate([
            discountView.topAnchor.constraint(equalTo: detailStackView.bottomAnchor, constant: 10),
            discountView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            discountView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    // MARK: - Configure View
    func configureView(
        with image: String,
        headline: String,
        add: String,
        distance: String,
        rateValue: Double,
        discount: Int
    ) {
        imageContainer.image = UIImage(named: image)
        titleLabel.text = headline
        adLabel.text = add
        secondaryLabel.text = distance
        rateView.configureView(with: rateValue)
        if discount > 0 {
            discountView.isHidden = false
            discountView.configureView(with: discount)
        }
    }
}
