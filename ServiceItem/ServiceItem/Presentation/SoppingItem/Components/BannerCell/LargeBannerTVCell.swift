//
//  LargeBannerTVCell.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 29/12/2024.
//
import UIKit

class LargeBannerTVCell: UITableViewCell {
    static let identifier: String = "LargeBannerTVCell"
    private var suggestions: [Suggestions] = []
    
    // Components
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 320),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0)
        ])
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LargeBannerCVCell.self, forCellWithReuseIdentifier: LargeBannerCVCell.identifier)
    }
    
    // MARK: - Configure View
    func configureView(with sugesstionList: [Suggestions]) {
        suggestions = sugesstionList
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionView Datasource
extension LargeBannerTVCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suggestions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargeBannerCVCell.identifier, for: indexPath) as? LargeBannerCVCell {
            cell.configureView(with: suggestions[indexPath.row].title, image: suggestions[indexPath.row].url, title: suggestions[indexPath.row].task, subTitle: suggestions[indexPath.row].subtitle)
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionView Delegate
extension LargeBannerTVCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 50, height: 300)
    }
}
