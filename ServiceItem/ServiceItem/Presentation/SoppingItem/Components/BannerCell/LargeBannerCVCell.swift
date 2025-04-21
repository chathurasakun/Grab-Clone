//
//  LargeBannerCVCell.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 29/12/2024.
//
import UIKit
import Common

class LargeBannerCVCell: UICollectionViewCell {
    static let identifier: String = "LargeBannerCVCell"
    
    // Components
    private let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let orderNowLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColor.Title.color
        label.text = "Order Now"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColor.LightGray.color
        return view
    }()
    
    private let arrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.tintColor = .black
        return imageView
    }()
    
    private let imageContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 7
        return imageView
    }()
    
    private let largeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColor.Title.color
        label.text = "large title"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let smallTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColor.GrayLine.color
        label.text = "small title"
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
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
        
        addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            topView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            topView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            topView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        topView.addSubview(orderNowLabel)
        NSLayoutConstraint.activate([
            orderNowLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0),
            orderNowLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 20),
        ])
        
        topView.addSubview(circleView)
        NSLayoutConstraint.activate([
            circleView.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0),
            circleView.leftAnchor.constraint(equalTo: orderNowLabel.rightAnchor, constant: 7),
            circleView.heightAnchor.constraint(equalToConstant: 20),
            circleView.widthAnchor.constraint(equalToConstant: 20)
        ])
        circleView.layer.cornerRadius = 10
        
        circleView.addSubview(arrowImage)
        NSLayoutConstraint.activate([
            arrowImage.centerXAnchor.constraint(equalTo: circleView.centerXAnchor, constant: 0),
            arrowImage.centerYAnchor.constraint(equalTo: circleView.centerYAnchor, constant: 0),
            arrowImage.heightAnchor.constraint(equalToConstant: 14),
            arrowImage.widthAnchor.constraint(equalToConstant: 14)
        ])
        
        let topViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapTopAction))
        topView.addGestureRecognizer(topViewTapGesture)
        
        addSubview(imageContainer)
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 16),
            imageContainer.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            imageContainer.heightAnchor.constraint(equalToConstant: 150),
            imageContainer.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
        
        addSubview(largeTitleLabel)
        NSLayoutConstraint.activate([
            largeTitleLabel.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 12),
            largeTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
        
        addSubview(smallTitleLabel)
        NSLayoutConstraint.activate([
            smallTitleLabel.topAnchor.constraint(equalTo: largeTitleLabel.bottomAnchor, constant: 7),
            smallTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
    }
    
    // MARK: - Configure View
    func configureView(with header: String, image: String, title: String, subTitle: String) {
        orderNowLabel.text = header
        imageContainer.image = UIImage(named: image)
        largeTitleLabel.text = title
        smallTitleLabel.text = subTitle
    }
    
    @objc private func onTapTopAction() {
        
    }
}
