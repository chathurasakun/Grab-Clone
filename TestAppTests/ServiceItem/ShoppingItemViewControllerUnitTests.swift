//
//  ShoppingItemViewControllerUnitTests.swift
//  TestApp
//
//  Created by CHATHURA ELLAWALA on 16/01/2025.
//
import XCTest
import Common
@testable import ServiceItem

// MARK: - Mock ViewModel
class MockShoppingItemViewModel: ShoppingItemViewModelProtocol {
    var homePageItems: [SectionItem] = []
    var fetchHomeDetailsCalled = false

    func fetchHomeDetails(completion: @escaping (Bool) -> Void) {
        fetchHomeDetailsCalled = true
        completion(true)
    }
}

class ShoppingItemViewControllerTests: XCTestCase {
    var sut: ShoppingItemViewController!
    var mockViewModel: MockShoppingItemViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockViewModel = MockShoppingItemViewModel()
        sut = ShoppingItemViewController(viewModel: mockViewModel)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        mockViewModel = nil
        try super.tearDownWithError()
    }

    func testViewDidLoad_setsUpView() {
        // Assert background color
        XCTAssertEqual(sut.view.backgroundColor, AppColor.MainBG.color)

        // Assert contentTableView is added to the view hierarchy
        XCTAssertTrue(sut.view.subviews.contains(sut.testableContentTableView))
    }

    func testTableViewConfiguration() {
        // Assert tableView delegate and dataSource
        XCTAssertNotNil(sut.testableContentTableView.delegate)
        XCTAssertNotNil(sut.testableContentTableView.dataSource)
        XCTAssertTrue(sut.testableContentTableView.delegate is ShoppingItemViewController)
        XCTAssertTrue(sut.testableContentTableView.dataSource is ShoppingItemViewController)

        // Assert tableView cell registration
//        XCTAssertEqual(sut.testableContentTableView.registeredCellIdentifiers.count, 5)
    }
    
    func testNumberofRowsInSection_Zero_TableView() {
        mockViewModel.homePageItems = []
        let rowCount = sut.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(rowCount, 0)
    }
    
    func testNumberofRowsInSection_HasValue_TableView() {
        mockViewModel.homePageItems = [
            SectionItem(cellType: .RecentRestaurants, content: [
                RecentRestaurants(id: "rc1", imageUrl: "", title: "A", subtitle: "b", rating: 4.4, ad: "", discount: 20),
                RecentRestaurants(id: "rc2", imageUrl: "", title: "E", subtitle: "c", rating: 4.4, ad: "", discount: 20),
            ]),
            SectionItem(cellType: .TableHeader, content: TableHeaderContent(monthlyUpdates: MonthlyUpdates(topic: "Buy one get one", dueDate: "2025-01-20", picture: "", bannerColor: "#fefefe"), discount: 10, suggestions: [
                Suggestions(id: "s1", title: "suggestion1", task: "tesk1", subtitle: "subtitle1", url: "")
            ]))
        ]
        let rowCount = sut.tableView(UITableView(), numberOfRowsInSection: 2)
        XCTAssertEqual(rowCount, mockViewModel.homePageItems.count)
    }

    func testFetchHomePageData_callsViewModelFetch() {
        // Act
        sut.viewDidLoad()

        // Assert
        XCTAssertTrue(mockViewModel.fetchHomeDetailsCalled)
    }
}

