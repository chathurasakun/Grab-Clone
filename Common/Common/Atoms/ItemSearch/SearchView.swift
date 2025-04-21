//
//  SearchView.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 23/12/2024.
//
import UIKit

public class SearchView: UIView {
    // Variables
    public weak var delegate: SearchViewProtocol?
    
    // Components
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    private let searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 17)
        label.text = "Search places"
        return label
    }()
    
    private let searchBtn: UIView = {
        let btn = UIView()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        return btn
    }()
    
    private let searchIcon: UIImageView = {
        let searchBtn = UIImageView()
        searchBtn.translatesAutoresizingMaskIntoConstraints = false
        searchBtn.image = UIImage(systemName: "magnifyingglass")
        searchBtn.tintColor = .black
        searchBtn.contentMode = .scaleAspectFit
        return searchBtn
    }()
    
    private let line: UIView = {
        let lineView = UIView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = AppColor.LightGray.color
        return lineView
    }()
    
    private let favoriteBtn: UIView = {
        let btn = UIView()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        return btn
    }()
    
    private let favoriteIcon: UIButton = {
        let iconBtn = UIButton()
        iconBtn.translatesAutoresizingMaskIntoConstraints = false
        iconBtn.setImage(UIImage(named: "heart"), for: .normal)
        iconBtn.tintColor = .black
        iconBtn.contentMode = .scaleAspectFit
        return iconBtn
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    private func setUI() {
        self.layer.cornerRadius = 15
        self.layer.backgroundColor = AppColor.MainBG.color.cgColor
        self.addShadow(radius: 12, opacity: 0.1, offset: CGSize(width: 7, height: 7))
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0)
        ])
        
        stackView.addArrangedSubview(searchBtn)
        NSLayoutConstraint.activate([
            searchBtn.widthAnchor.constraint(equalToConstant: 50),
        ])
        
//        searchBtn.addOpacityHighlightOnTap(duration: 0.2, delay: 0.3)
        
        searchBtn.addSubview(searchIcon)
        NSLayoutConstraint.activate([
            searchIcon.centerYAnchor.constraint(equalTo: searchBtn.centerYAnchor),
            searchIcon.centerXAnchor.constraint(equalTo: searchBtn.centerXAnchor),
            searchIcon.heightAnchor.constraint(equalToConstant: 25),
            searchIcon.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        let searchTapGesture = UITapGestureRecognizer(target: self, action: #selector(searchBtnTapped))
        searchBtn.addGestureRecognizer(searchTapGesture)
        
        stackView.addArrangedSubview(searchLabel)
        
        stackView.addArrangedSubview(line)
        NSLayoutConstraint.activate([
            line.widthAnchor.constraint(equalToConstant: 1)
        ])
        
        stackView.addArrangedSubview(favoriteBtn)
        NSLayoutConstraint.activate([
            favoriteBtn.widthAnchor.constraint(equalToConstant: 55),
        ])
        
//        favoriteBtn.addOpacityHighlightOnTap(duration: 0.2, delay: 0.3)
        
        favoriteBtn.addSubview(favoriteIcon)
        NSLayoutConstraint.activate([
            favoriteIcon.centerYAnchor.constraint(equalTo: favoriteBtn.centerYAnchor),
            favoriteIcon.centerXAnchor.constraint(equalTo: favoriteBtn.centerXAnchor),
            favoriteIcon.heightAnchor.constraint(equalToConstant: 25),
            favoriteIcon.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        let favoriteTapGesture = UITapGestureRecognizer(target: self, action: #selector(favoriteBtnTapped))
        favoriteBtn.addGestureRecognizer(favoriteTapGesture)
        
    }
    
    @objc private func searchBtnTapped() {
        delegate?.searchButtonTapped()
    }
    
    @objc private func favoriteBtnTapped() {
        delegate?.favoriteButtonTapped()
    }
}

