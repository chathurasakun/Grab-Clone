//
//  DetailTVCell.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 29/12/2024.
//
import UIKit
import Common

class DetailTVCell: UITableViewCell {
    static let identifier: String = "DetailTVCell"
    private var list: [RecentRestaurants] = []
    
    // Components
    private let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = AppColor.Title.color
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Recent Restaurants"
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
        self.backgroundColor = .clear
        self.selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    private func setUI() {
        self.backgroundColor = .clear
        
        addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            topView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            topView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            topView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        topView.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0),
            headerLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 20),
        ])
        
        topView.addSubview(circleView)
        NSLayoutConstraint.activate([
            circleView.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 0),
            circleView.rightAnchor.constraint(equalTo: rightAnchor, constant: -7),
            circleView.heightAnchor.constraint(equalToConstant: 30),
            circleView.widthAnchor.constraint(equalToConstant: 30)
        ])
        circleView.layer.cornerRadius = 15
        
        circleView.addSubview(arrowImage)
        NSLayoutConstraint.activate([
            arrowImage.centerXAnchor.constraint(equalTo: circleView.centerXAnchor, constant: 0),
            arrowImage.centerYAnchor.constraint(equalTo: circleView.centerYAnchor, constant: 0),
            arrowImage.heightAnchor.constraint(equalToConstant: 18),
            arrowImage.widthAnchor.constraint(equalToConstant: 18)
        ])
        
        let topViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(onTapTopAction))
        topView.addGestureRecognizer(topViewTapGesture)
        
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 15),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            collectionView.heightAnchor.constraint(equalToConstant: 270)
        ])
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DetailCVCell.self, forCellWithReuseIdentifier: DetailCVCell.identifier)
    }
    
    @objc private func onTapTopAction() {
        
    }
    
    // MARK: - Configure View
    func configureView(with list: [RecentRestaurants], header: String) {
        self.list = list
        headerLabel.text = header
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

// MARK: - CollectionView Datasource
extension DetailTVCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCVCell.identifier, for: indexPath) as? DetailCVCell {
            cell.configureView(
                with: list[indexPath.row].imageUrl,
                headline: list[indexPath.row].title,
                add: list[indexPath.row].ad,
                distance: list[indexPath.row].subtitle,
                rateValue: list[indexPath.row].rating,
                discount: list[indexPath.row].discount
            )
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - CollectionView Delegate
extension DetailTVCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 270)
    }
}
