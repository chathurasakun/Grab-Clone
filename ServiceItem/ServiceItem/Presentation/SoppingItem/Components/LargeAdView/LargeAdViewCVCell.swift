//
//  LargeAdViewCVCell.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 01/01/2025.
//
import UIKit

class LargeAdViewCVCell: UICollectionViewCell {
    static let identifier: String = "LargeAdViewCVCell"
    
    // Components
    private let adView: UIImageView = {
        let ad = UIImageView()
        ad.translatesAutoresizingMaskIntoConstraints = false
        ad.contentMode = .scaleAspectFill
        ad.clipsToBounds = true
        ad.layer.cornerRadius = 12
        return ad
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setUpUI() {
        self.backgroundColor = .clear
        
        addSubview(adView)
        NSLayoutConstraint.activate([
            adView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            adView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            adView.heightAnchor.constraint(equalToConstant: 300),
            adView.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    // MARK: - configure view
    func configureView(with ad: String) {
        adView.image = UIImage(named: ad)
    }
}

