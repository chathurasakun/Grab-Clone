//
//  RectangleShapedView.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 28/12/2024.
//
import UIKit

public class RectangleShapedView: UIView {
    // Components
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = AppColor.GrayLine.color
        label.textAlignment = .left
        label.text = "Category"
        label.numberOfLines = 1
        return label
    }()
    
    private let taskNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = AppColor.Title.color
        label.text = "Task Name"
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let categoryIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        self.backgroundColor = .clear
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = AppColor.LightGray.color.cgColor
        
        addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            categoryLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
        ])
        
        addSubview(taskNameLabel)
        NSLayoutConstraint.activate([
            taskNameLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5),
            taskNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            taskNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
        ])
        
        addSubview(categoryIcon)
        NSLayoutConstraint.activate([
            categoryIcon.leftAnchor.constraint(equalTo: taskNameLabel.rightAnchor, constant: 12),
            categoryIcon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            categoryIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            categoryIcon.heightAnchor.constraint(equalToConstant: 20),
            categoryIcon.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    // MARK: - Configure UI
    public func configure(with header: String, task: String, icon: UIImage?) {
        categoryLabel.text = header
        taskNameLabel.text = task
        categoryIcon.image = icon
    }
}
