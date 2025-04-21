//
//  ShoppingItemViewModelTests.swift
//  TestApp
//
//  Created by CHATHURA ELLAWALA on 14/01/2025.
//
import XCTest
@testable import ServiceItem

class MockShoppingItemUseCase: ShoppingItemUseCaseProtocol {
    var shouldReturnSuccess: Bool = true
    var mockResponse: HomeEntity?
    
    func getHomeScreenItems(completion: @escaping (HomeEntity?, Bool) -> Void) {
        completion(mockResponse, shouldReturnSuccess)
    }
    
    func mapHomeEntitiesToSections(entities: HomeEntity) -> [SectionItem] {
        var sections: [SectionItem] = []
        let header = TableHeaderContent(monthlyUpdates: entities.monthlyUpdates, discount: 10, suggestions: entities.suggesstions)
        let headerSection = SectionItem(cellType: .TableHeader, content: header)
        sections.append(headerSection)
        
        let topSuggestedSection = SectionItem(cellType: .TopSuggested, content: entities.topSugessted)
        sections.append(topSuggestedSection)
        
        let recentRestaurantsSection = SectionItem(cellType: .RecentRestaurants, content: entities.recentRestaurants)
        sections.append(recentRestaurantsSection)
        
        let recomendedRestaurantsSection = SectionItem(cellType: .RecomendedRestaurants, content: entities.recomendedRestaurants)
        sections.append(recomendedRestaurantsSection)
        
        let discoveredItemsSection = SectionItem(cellType: .Discover, content: entities.Discover)
        sections.append(discoveredItemsSection)
        
        let recomendedFoodSection = SectionItem(cellType: .RecommendedFood, content: entities.recomendedFood)
        sections.append(recomendedFoodSection)
        return sections
    }
    
    
}

class ShoppingItemViewModelTests: XCTestCase {
    var viewModel: ShoppingItemViewModel!
    var mockUseCase: MockShoppingItemUseCase!
    let monthlyUpdates: MonthlyUpdates = MonthlyUpdates(topic: "Save with GrabMart Kombo Jimat", dueDate: "Only on 23rd, 24th Dec", picture: "IMG_14E4AE9164EF-1", bannerColor: "#26804d")
    let suggesstions: [Suggestions] = [
        Suggestions(id: "s1", title: "Link", task: "GXBank", subtitle: "", url: "GxBank"),
        Suggestions(id: "s2", title: "Schedule", task: "Ride to airport", subtitle: "", url: "calendar"),
        Suggestions(id: "s3", title: "Discover", task: "Dine out deals", subtitle: "", url: "restaurants"),
        Suggestions(id: "s4", title: "Points", task: "5", subtitle: "", url: "crown"),
    ]
    let topSugessted: [Suggestions] = [
        Suggestions(id: "ts1", title: "Order Now", task: "BEST ORANGE CHICKEN IN TOWN", subtitle: "Ad Roclet Express @ Mont Kiara", url: "IMG_2661B007A559-1"),
        Suggestions(id: "ts2", title: "Order Now", task: "Delicious & Healthy Meals - Now on PROMO", subtitle: "Ad. Agrain - Healthy Low Catlorie Grain Bowls", url: "IMG_E3670DDC0E9E-1")
    ]
    let recentRestaurants: [RecentRestaurants] = [
        RecentRestaurants(id: "r1", imageUrl: "IMG_96ECFBFB5A03-1", title: "Ad", subtitle: "Bing Shifu Mini Bowl", rating: 4.8, ad: "", discount: 0),
        RecentRestaurants(id: "r1", imageUrl: "IMG_808DD1949984-1", title: "Ad", subtitle: "Seni Sattisoru - kombo", rating: 4.5, ad: "", discount: 11),
        RecentRestaurants(id: "r1", imageUrl: "IMG_4563C78993C2-1", title: "Ad", subtitle: "Oh Yeah Banana Leaf", rating: 3.8, ad: "", discount: 0),
        RecentRestaurants(id: "r1", imageUrl: "IMG_BDEBEFBAA0AB-1", title: "Ad", subtitle: "Panjabi Rasoi - Brickfileds", rating: 4.8, ad: "", discount: 7),
        RecentRestaurants(id: "r1", imageUrl: "IMG_FDC3561F0A98-1", title: "Ad", subtitle: "jolibee - Sri Permaisuri", rating: 4.1, ad: "", discount: 35),
    ]
    let recomendedRestaurants: [RecentRestaurants] = [
        RecentRestaurants(id: "r1", imageUrl: "IMG_39AB8DE105CC-1", title: "", subtitle: "Dominos Pizza Maluri", rating: 4.4, ad: "", discount: 11),
        RecentRestaurants(id: "r1", imageUrl: "IMG_4B9547222A02-1", title: "", subtitle: "Pizza Hut Cochrane", rating: 4.0, ad: "", discount: 7),
        RecentRestaurants(id: "r3", imageUrl: "IMG_15E79211039A-1", title: "", subtitle: "Hydrabad Recipes", rating: 3.9, ad: "", discount: 0),
        RecentRestaurants(id: "r4", imageUrl: "IMG_08923BEBE953-1", title: "", subtitle: "VMD food corner", rating: 4.2, ad: "", discount: 10)
    ]
    let orderDinnerFrom: [OrderDinnerFrom] = [
        OrderDinnerFrom(id: "od1", adUrl: "", title: "Dominos Pizza Maluri", subtitle: "1.1km"),
        OrderDinnerFrom(id: "od2", adUrl: "", title: "VMD food corner", subtitle: "2.2km"),
        OrderDinnerFrom(id: "od2", adUrl: "", title: "Hydrabad Recipes", subtitle: "1.2km"),
        OrderDinnerFrom(id: "od2", adUrl: "", title: "the Lankan KL", subtitle: "0.2km"),
    ]
    let discover: [Discover] = [
        Discover(id: "d1", url: "IMG_197BB508B8A0-1"),
        Discover(id: "d2", url: "IMG_5051C50B6F67-1"),
        Discover(id: "d23", url: "IMG_A08F0C3FE26E-1"),
    ]
    let recomemndedFood: [Food] = [
        Food(id: "rf1", foodUrl: "IMG_5C800562B664-1", title: "Chicken Wrap 🔥🍗 ", shop: "Shawarma Hub - Bandar Sri", price: "RM13.90"),
        Food(id: "rf2", foodUrl: "IMG_B39FEC7B94EB-1", title: "Chicken Platter 12 pcs", shop: "Shawarma Hub - Bandar Sri", price: "RM29.90"),
        Food(id: "rf3", foodUrl: "IMG_E793D2D2B391-1", title: "Bubur Ayam MB - Si", shop: "Marrybrown - Q Avenue", price: "RM12.00"),
        Food(id: "rf4", foodUrl: "IMG_BA31EC9405AD-1", title: "Spaghetti Bolongnese", shop: "Pasta La Pasta - Tapak Urb", price: "RM13.00"),
    ]
    let orderWithGrabMart: [OrderWithGrabMart] = [
        OrderWithGrabMart(id: "o1", url: ""),
        OrderWithGrabMart(id: "o2", url: "")
    ]
    let keepqDiscovering: [KeepDiscovering] = [
        KeepDiscovering(id: "k1", url: ""),
        KeepDiscovering(id: "k2", url: "")
    ]
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockShoppingItemUseCase()
        viewModel = ShoppingItemViewModel(shoppingItemUseCase: mockUseCase)
    }
    
    override func tearDown() {
        super.tearDown()
        mockUseCase = nil
        viewModel = nil
    }
    
    func testGetHomeCardDetails_Success() {
        mockUseCase.shouldReturnSuccess = true
        let mockEntity = HomeEntity(monthlyUpdates: monthlyUpdates, diningDiscount: "40", suggesstions: suggesstions, topSugessted: topSugessted, recentRestaurants: recentRestaurants, recomendedRestaurants: recomendedRestaurants, orderDinnerFrom: orderDinnerFrom, Discover: discover, recomendedFood: recomemndedFood, orderWithGrabMart: orderWithGrabMart, keepDiscovering: keepqDiscovering)
        mockUseCase.mockResponse = mockEntity
        
        let expectation = self.expectation(description: "Fetch home items success")

        // Act
        viewModel.fetchHomeDetails { success in
            // Assert
            XCTAssertTrue(success)
            
            let sections = self.mockUseCase.mapHomeEntitiesToSections(entities: mockEntity)
            XCTAssertEqual(self.viewModel.homePageItems, sections)
            expectation.fulfill()
            
        }

        wait(for: [expectation], timeout: 1.0)
    }
    
    func testGetHomeCardDetails_Failure() {
        mockUseCase.shouldReturnSuccess = false
        mockUseCase.mockResponse = nil
        
        let expectation = self.expectation(description: "Fetch home items failure")
        
        viewModel.fetchHomeDetails { success in
            XCTAssertFalse(success)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
}
