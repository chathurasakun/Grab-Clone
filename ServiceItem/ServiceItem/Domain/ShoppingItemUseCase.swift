//
//  ShoppingItemUseCase.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 06/11/2024.
//

protocol ShoppingItemUseCaseProtocol {
    func getHomeScreenItems(completion: @escaping (_ homeDetails: HomeEntity?, _ success:  Bool) -> Void)
    func mapHomeEntitiesToSections(entities: HomeEntity) -> [SectionItem]
}

class ShoppingItemUseCase: ShoppingItemUseCaseProtocol {
    let shoppingItemRepository: ShoppingItemRepositoryProtocol
    
    init(shoppingItemRepository: ShoppingItemRepositoryProtocol) {
        self.shoppingItemRepository = shoppingItemRepository
    }
    
    func getHomeScreenItems(completion: @escaping (_ homeDetails: HomeEntity?, _ success: Bool) -> Void) {
        shoppingItemRepository.fetchHomeItems { (response, success) in
            completion(response, success)
        }
    }
    
    func mapHomeEntitiesToSections(entities: HomeEntity) -> [SectionItem] {
        var sections: [SectionItem] = []
        let mirror = Mirror(reflecting: entities)
        
        var monthlyUpdates: MonthlyUpdates = MonthlyUpdates(topic: "", dueDate: "", picture: "", bannerColor: "")
        var discount: Int = 0
        var suggestions: [Suggestions] = []
        var topSuggested: [Suggestions] = []
        var recentRestaurants: [RecentRestaurants] = []
        var recomendedRestaurants: [RecentRestaurants] = []
        var discoverItems: [Discover] = []
        var recomendedFood: [Food] = []
        
        for child in mirror.children {
            if child.label == "monthlyUpdates" {
                if let child = child.value as? MonthlyUpdates {
                    monthlyUpdates = MonthlyUpdates(topic: child.topic, dueDate: child.dueDate, picture: child.picture, bannerColor: child.bannerColor)
                }
            }
            if child.label == "diningDiscount" {
                if let discountValue = child.value as? String {
                    guard let unwrappedDiscount = Int(discountValue) else { continue }
                    discount = unwrappedDiscount
                }
            }
            if child.label == "suggesstions" {
                if let child = child.value as? [Suggestions] {
                    child.forEach { suggestion in
                        suggestions.append(Suggestions(id: suggestion.id, title: suggestion.task, task: suggestion.task, subtitle: suggestion.subtitle, url: suggestion.url))
                    }
                }
            }
            if child.label == "topSugessted" {
                if let child = child.value as? [Suggestions] {
                    child.forEach { suggestion in
                        topSuggested.append(Suggestions(id: suggestion.id, title: suggestion.task, task: suggestion.task, subtitle: suggestion.subtitle, url: suggestion.url))
                    }
                }
            }
            if child.label == "recentRestaurants" {
                if let child = child.value as? [RecentRestaurants] {
                    child.forEach { recent in
                        recentRestaurants.append(RecentRestaurants(id: recent.id, imageUrl: recent.imageUrl, title: recent.title, subtitle: recent.subtitle, rating: recent.rating, ad: recent.ad, discount: recent.discount))
                    }
                }
            }
            if child.label == "recomendedRestaurants" {
                if let child = child.value as? [RecentRestaurants] {
                    child.forEach { recent in
                        recomendedRestaurants.append(RecentRestaurants(id: recent.id, imageUrl: recent.imageUrl, title: recent.title, subtitle: recent.subtitle, rating: recent.rating, ad: recent.ad, discount: recent.discount))
                    }
                }
            }
            if child.label == "Discover" {
                if let child = child.value as? [Discover] {
                    child.forEach { discover in
                        discoverItems.append(Discover(id: discover.id, url: discover.url))
                    }
                }
            }
            if child.label == "recomendedFood" {
                if let child = child.value as? [Food] {
                    child.forEach { food in
                        recomendedFood.append(Food(id: food.id, foodUrl: food.foodUrl, title: food.title, shop: food.shop, price: food.price))
                    }
                }
            }
        }
        let header = TableHeaderContent(monthlyUpdates: monthlyUpdates, discount: discount, suggestions: suggestions)
        let headerSection = SectionItem(cellType: .TableHeader, content: header)
        sections.append(headerSection)
        
        let topSuggestedSection = SectionItem(cellType: .TopSuggested, content: topSuggested)
        sections.append(topSuggestedSection)
        
        let recentRestaurantsSection = SectionItem(cellType: .RecentRestaurants, content: recentRestaurants)
        sections.append(recentRestaurantsSection)
        
        let recomendedRestaurantsSection = SectionItem(cellType: .RecomendedRestaurants, content: recomendedRestaurants)
        sections.append(recomendedRestaurantsSection)
        
        let discoveredItemsSection = SectionItem(cellType: .Discover, content: discoverItems)
        sections.append(discoveredItemsSection)
        
        let recomendedFoodSection = SectionItem(cellType: .RecommendedFood, content: recomendedFood)
        sections.append(recomendedFoodSection)
        
        return sections
    }
}
