//
//  ShoppingItemViewController.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 06/11/2024.
//
import UIKit
import Common

class ShoppingItemViewController: UIViewController {
    // Variables
    var viewModel: ShoppingItemViewModelProtocol!
    weak var coordinator: ShoppingCoordinator?
    
    // Components
    private let contentTableView: UITableView = {
        let tbView = UITableView()
        tbView.translatesAutoresizingMaskIntoConstraints = false
        tbView.showsVerticalScrollIndicator = false
        tbView.backgroundColor = .clear
        tbView.separatorStyle = .none
        tbView.accessibilityIdentifier = "contentTableView" /// for testing
        return tbView
    }()
    
    // Add internal access for tests
    var testableContentTableView: UITableView {
        return contentTableView
    }
    
    // MARK: - Life Cycle
    init(viewModel: ShoppingItemViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.MainBG.color
        setupView()
        getHomePageData()
    }
    
    // MARK: - Setup View
    private func setupView() {
        let safeArea = view.safeAreaLayoutGuide
//        self.navigationController?.toolbar.isHidden = true
        view.addSubview(contentTableView)
        
        NSLayoutConstraint.activate([
            contentTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            contentTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            contentTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            contentTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
        ])
        contentTableView.delegate = self
        contentTableView.dataSource = self
        
        // Register Cells
        contentTableView.register(TableHeaderTVCell.self, forCellReuseIdentifier: TableHeaderTVCell.identifier)
        contentTableView.register(LargeBannerTVCell.self, forCellReuseIdentifier: LargeBannerTVCell.identifier)
        contentTableView.register(DetailTVCell.self, forCellReuseIdentifier: DetailTVCell.identifier)
        contentTableView.register(LargeAdViewTVCell.self, forCellReuseIdentifier: LargeAdViewTVCell.identifier)
        contentTableView.register(FoodDetailTVCell.self, forCellReuseIdentifier: FoodDetailTVCell.identifier)
    }
}

// MARK: - TableView DataSource
extension ShoppingItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.homePageItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = viewModel.homePageItems[indexPath.row].cellType
        switch cellType {
        case .TableHeader:
            if let headerCell = tableView.dequeueReusableCell(withIdentifier: TableHeaderTVCell.identifier, for: indexPath) as? TableHeaderTVCell {
                if let tableHeaderContent = viewModel.homePageItems[indexPath.row].content as? TableHeaderContent {
                    headerCell.configureView(
                        with: tableHeaderContent.monthlyUpdates,
                        diningDiscount: tableHeaderContent.discount,
                        suggestions: tableHeaderContent.suggestions
                    )
                    headerCell.delegate = self
                    return headerCell
                }
                return UITableViewCell()
            }
            return UITableViewCell()
        case .TopSuggested:
            if let largeBannerCell = tableView.dequeueReusableCell(withIdentifier: LargeBannerTVCell.identifier, for: indexPath) as? LargeBannerTVCell {
                if let largeBannerCellContent = viewModel.homePageItems[indexPath.row].content as? [Suggestions] {
                    largeBannerCell.configureView(with: largeBannerCellContent)
                    return largeBannerCell
                }
                return UITableViewCell()
            }
            return UITableViewCell()
        case .RecentRestaurants:
            if let recentRestaurantsCell = tableView.dequeueReusableCell(withIdentifier: DetailTVCell.identifier, for: indexPath) as? DetailTVCell {
                if let recentRestaurantsContent = viewModel.homePageItems[indexPath.row].content as? [RecentRestaurants] {
                    recentRestaurantsCell.configureView(with: recentRestaurantsContent, header: "Recent restaurants")
                    return recentRestaurantsCell
                }
                return UITableViewCell()
            }
            return UITableViewCell()
        case .RecomendedRestaurants:
            if let recommendedRestaurantsCell = tableView.dequeueReusableCell(withIdentifier: DetailTVCell.identifier, for: indexPath) as? DetailTVCell {
                if let recommendedRestaurantsContent = viewModel.homePageItems[indexPath.row].content as? [RecentRestaurants] {
                    recommendedRestaurantsCell.configureView(with: recommendedRestaurantsContent, header: "Recommended restaurants")
                }
                return UITableViewCell()
            }
            return UITableViewCell()
        case .Discover:
            if let discoveredCell = tableView.dequeueReusableCell(withIdentifier: LargeAdViewTVCell.identifier, for: indexPath) as? LargeAdViewTVCell {
                if let discoveredItems = viewModel.homePageItems[indexPath.row].content as? [Discover] {
                    discoveredCell.configureView(with: discoveredItems)
                    return discoveredCell
                }
                return UITableViewCell()
            }
            return UITableViewCell()
        case .RecommendedFood:
            if let foodCell = tableView.dequeueReusableCell(withIdentifier: FoodDetailTVCell.identifier, for: indexPath) as? FoodDetailTVCell {
                if let recomendedFoods = viewModel.homePageItems[indexPath.row].content as? [Food] {
                    foodCell.configureView(with: recomendedFoods, header: "Recommended food")
                    return foodCell
                }
                return UITableViewCell()
            }
            return UITableViewCell()
        }
    }
}

// MARK: - TableView Delegate
extension ShoppingItemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = viewModel.homePageItems[indexPath.row].cellType
        switch cellType {
        case .TableHeader:
            return 380
        case .TopSuggested:
            return 270
        case .RecentRestaurants, .RecomendedRestaurants:
            return 290
        case .Discover:
            return 400
        case .RecommendedFood:
            return 300
        }
    }
}

// MARK: - TableHeaderTVCell Delegates
extension ShoppingItemViewController: TableHeaderTVCellProtocol {
    func favoriteButtonTapped() {
        print("favorite tapped")
    }
    
    func searchButtonTapped() {
        print("search button tapped")
    }
}

// MARK: - Requests
extension ShoppingItemViewController {
    private func getHomePageData() {
        viewModel.fetchHomeDetails { success in
            
        }
    }
}
