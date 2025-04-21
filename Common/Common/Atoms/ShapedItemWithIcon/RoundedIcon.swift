//
//  RoundedIcon.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 25/12/2024.
//
import UIKit

public class RoundedIcon: UIView {
    // Variables
    private var isDiscountVisible = false {
        didSet {
            if isDiscountVisible {
                addSubview(discountView)
                NSLayoutConstraint.activate([
                    discountView.leftAnchor.constraint(equalTo: imageContainer.rightAnchor, constant: -33),
                    discountView.bottomAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 15),
                    discountView.heightAnchor.constraint(equalToConstant: 22),
                    discountView.widthAnchor.constraint(equalToConstant: 42)
                ])
                discountView.layer.borderWidth = 3
                discountView.layer.borderColor = AppColor.MainBG.color.cgColor
                
                discountView.addSubview(discountLabel)
                NSLayoutConstraint.activate([
                    discountLabel.centerXAnchor.constraint(equalTo: discountView.centerXAnchor, constant: 0),
                    discountView.centerYAnchor.constraint(equalTo: discountLabel.centerYAnchor, constant: 0)
                ])
            }
        }
    }
    
    // Components
    private let discountView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColor.BgSpecial.color
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let discountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let imageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = AppColor.Title.color
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    private func setUI() {
        self.backgroundColor = AppColor.MainBG.color
        
        addSubview(imageContainer)
        NSLayoutConstraint.activate([
            imageContainer.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            imageContainer.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageContainer.heightAnchor.constraint(equalToConstant: 60),
            imageContainer.widthAnchor.constraint(equalToConstant: 60)
        ])
        imageContainer.layer.cornerRadius = 30
        
        imageContainer.addSubview(icon)
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor, constant: 0),
            icon.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor, constant: 0),
            icon.heightAnchor.constraint(equalToConstant: 40),
            icon.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(btnTapped))
        self.addGestureRecognizer(tapGestureRecognizer)
        
        addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor, constant: 0),
            categoryLabel.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 10),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    // MARK: - configure UI
    public func configureView(image: UIImage?, category: String, color: UIColor, discount: String?) {
        imageContainer.backgroundColor = color
        categoryLabel.text = category
        isDiscountVisible = discount != nil && discount != ""
        if let discount {
            discountLabel.text = discount
        }
        if image == nil {
            return
        }
        icon.image = image
    }
    
    @objc private func btnTapped() {
        print("it's tapped")
    }
}

