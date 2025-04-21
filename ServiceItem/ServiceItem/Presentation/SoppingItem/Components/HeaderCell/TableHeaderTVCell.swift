//
//  TableHeader.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 25/12/2024.
//
import UIKit
import Common

protocol TableHeaderTVCellProtocol: AnyObject {
    func favoriteButtonTapped()
    func searchButtonTapped()
}

class TableHeaderTVCell: UITableViewCell {
    static let identifier = "TableHeaderTVCell"
    weak var delegate: TableHeaderTVCellProtocol?
    var sugestions: [Suggestions] = []
    private var colorViewHeightConstraint: NSLayoutConstraint?
    
    // Components
    private let colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    private let promotionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let promotionSubTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let promotionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let searchStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 10
        return view
    }()
    
    private let searchView: SearchView = {
        let view = SearchView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scanView: SquareShapedIcon = {
        let view = SquareShapedIcon()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let categoryStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 10
        return view
    }()
    
    private let sugesstionStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 10
        return view
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        categoryStackView.subviews.forEach { $0.removeFromSuperview() } // remove the populated views before reuse the cell
    }
    
    // MARK: - Setup View
    private func setupView() {
        addSubview(colorView)
        NSLayoutConstraint.activate([
            colorView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            colorView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            colorView.topAnchor.constraint(equalTo: topAnchor, constant: 0)
        ])
        colorViewHeightConstraint = colorView.heightAnchor.constraint(equalToConstant: 120)
        colorViewHeightConstraint?.isActive = true
        
        colorView.addSubview(promotionTitle)
        NSLayoutConstraint.activate([
            promotionTitle.leftAnchor.constraint(equalTo: colorView.leftAnchor, constant: 20),
            promotionTitle.centerYAnchor.constraint(equalTo: colorView.topAnchor, constant: 40),
        ])
        
        colorView.addSubview(promotionSubTitle)
        NSLayoutConstraint.activate([
            promotionSubTitle.leftAnchor.constraint(equalTo: colorView.leftAnchor, constant: 20),
            promotionSubTitle.topAnchor.constraint(equalTo: promotionTitle.bottomAnchor, constant: 9),
        ])
        
        colorView.addSubview(promotionImage)
        NSLayoutConstraint.activate([
            promotionImage.heightAnchor.constraint(equalToConstant: 50),
            promotionImage.widthAnchor.constraint(equalToConstant: 70),
            promotionImage.rightAnchor.constraint(equalTo: colorView.rightAnchor, constant: -20),
            promotionImage.centerYAnchor.constraint(equalTo: colorView.centerYAnchor, constant: 0)
        ])
        
        addSubview(searchStackView)
        NSLayoutConstraint.activate([
            searchStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            searchStackView.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: -20),
            searchStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            searchStackView.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        searchStackView.addArrangedSubview(scanView)
        scanView.configureView(image: UIImage(named: "scan")!, cornerRadius: 12, tintColor: .black)
        NSLayoutConstraint.activate([
            scanView.widthAnchor.constraint(equalToConstant: 55),
        ])
        
        searchView.delegate = self
        searchStackView.addArrangedSubview(searchView)
        
        addSubview(categoryStackView)
        NSLayoutConstraint.activate([
            categoryStackView.topAnchor.constraint(equalTo: searchStackView.bottomAnchor, constant: 25),
            categoryStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            categoryStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20)
        ])
        
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: categoryStackView.bottomAnchor, constant: 10),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RectangleShapedCVCell.self, forCellWithReuseIdentifier: RectangleShapedCVCell.identifier)
    }
    
    // MARK: - Configure view
    func configureView(with monthlyUpdates: MonthlyUpdates, diningDiscount: Int, suggestions: [Suggestions]) {
        ["Car","Dine Out", "Food", "All"].forEach { category in
            let roundedIcon = RoundedIcon()
            roundedIcon.translatesAutoresizingMaskIntoConstraints = false
            roundedIcon.configureView(image: UIImage(named: category), category: category, color: AppColor.BgColorSpecial.color, discount: category == "Dine Out" ? "~\(diningDiscount)%" : "")
            categoryStackView.addArrangedSubview(roundedIcon)
        }
        self.sugestions = suggestions
        DispatchQueue.main.async { self.collectionView.reloadData() }
        
        colorView.backgroundColor = UIColor(hex: monthlyUpdates.bannerColor)
        promotionTitle.text = monthlyUpdates.topic
        promotionSubTitle.text = monthlyUpdates.dueDate
        promotionImage.image = UIImage(named: monthlyUpdates.picture)
    }
}

// MARK: - Collection View Datasource
extension TableHeaderTVCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sugestions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RectangleShapedCVCell.identifier, for: indexPath) as? RectangleShapedCVCell {
            let image = UIImage(named: sugestions[indexPath.row].url)
            cell.configure(with: sugestions[indexPath.row].title, task: sugestions[indexPath.row].task, icon: image)
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - CollectionView Delegate
extension TableHeaderTVCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension TableHeaderTVCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = sugestions[indexPath.row].task
        let cellWidth = 72 + title.size(withAttributes: [.font: UIFont.systemFont(ofSize: 14, weight: .semibold)]).width
        return CGSize(width: cellWidth, height: 60)
    }
}

// MARK: - SearchView Delegate
extension TableHeaderTVCell: SearchViewProtocol {
    func favoriteButtonTapped() {
        delegate?.favoriteButtonTapped()
    }
    
    func searchButtonTapped() {
        delegate?.searchButtonTapped()
    }
}

