//
//  LargeAdViewTVCell.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 01/01/2025.
//
import UIKit
import Common

class LargeAdViewTVCell: UITableViewCell {
    static let identifier: String = "LargeAdViewTVCell"
    var addList: [Discover] = []
    
    // Components
    private let headerLine: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = AppColor.Title.color
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Discover things you'd love"
        return label
    }()
    
    private let subHeaderLine: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints =  false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = AppColor.GrayLine.color
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Ad. swipe to be inspired"
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Ui
    private func setupUI() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        contentView.isUserInteractionEnabled = false
        
        addSubview(headerLine)
        NSLayoutConstraint.activate([
            headerLine.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            headerLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
        ])
        
        addSubview(subHeaderLine)
        NSLayoutConstraint.activate([
            subHeaderLine.topAnchor.constraint(equalTo: headerLine.bottomAnchor, constant: 10),
            subHeaderLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
        ])
        
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: subHeaderLine.bottomAnchor, constant: 12),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            collectionView.heightAnchor.constraint(equalToConstant: 310)
        ])
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LargeAdViewCVCell.self, forCellWithReuseIdentifier: LargeAdViewCVCell.identifier)
    }
    
    // MARK: - Configure View
    func configureView(with ad: [Discover]) {
        self.addList = ad
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - CollectionView Datasource
extension LargeAdViewTVCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LargeAdViewCVCell.identifier, for: indexPath) as? LargeAdViewCVCell {
            cell.configureView(with: addList[indexPath.row].url)
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - CollectionView Delegate
extension LargeAdViewTVCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 310)
    }
}




