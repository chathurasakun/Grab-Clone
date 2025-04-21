//
//  ShoppingItemDataSource.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 25/12/2024.
//
import Common

protocol ShoppingItemDataSourceProtocol {
    func fetchHomeItems(completion: @escaping (HomeEntity?, Bool) ->  Void)
}

class ShoppingItemDataSource:ShoppingItemDataSourceProtocol {
        
    let apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchHomeItems(completion: @escaping (HomeEntity?, Bool) -> Void) {
        apiClient.fetchHomeData { result in
            switch result {
            case .success(let data):
                let homeEntity = self.convertToHomeEntity(backendResponse: data)
                completion(homeEntity, true)
            case .failure:
                completion(nil, false)
            }

        }
    }
    
    func convertToHomeEntity(backendResponse: HomeResponse) -> HomeEntity {

        let monthlyUpdates = MonthlyUpdates(topic: backendResponse.monthlyUpdates.topic, dueDate: backendResponse.monthlyUpdates.dueDate, picture: backendResponse.monthlyUpdates.picture, bannerColor: backendResponse.monthlyUpdates.bannerColor)
        let diningDiscounts = backendResponse.diningDiscount
        
        var suggesstions: [Suggestions] = []
        backendResponse.suggesstions.forEach{ suggestion in
            suggesstions.append(Suggestions(id: suggestion.id, title: suggestion.title, task: suggestion.task, subtitle: suggestion.subtitle, url: suggestion.url))
        }
        
        var topSugessted: [Suggestions] = []
        backendResponse.topSugessted.forEach { suggestion in
            topSugessted.append(Suggestions(id: suggestion.id, title: suggestion.title, task: suggestion.task, subtitle: suggestion.subtitle, url: suggestion.url))
        }
        
        var recentRestaurants: [RecentRestaurants] = []
        backendResponse.recentRestaurants.forEach { restaurant in
            recentRestaurants.append(RecentRestaurants(id: restaurant.id, imageUrl: restaurant.imageUrl, title: restaurant.title, subtitle: restaurant.subtitle, rating: restaurant.rating, ad: restaurant.ad, discount: restaurant.discount))
        }
        
        var recomendedRestaurants: [RecentRestaurants] = []
        backendResponse.recomendedRestaurants.forEach { restaurant in
            recomendedRestaurants.append(RecentRestaurants(id: restaurant.id, imageUrl: restaurant.imageUrl, title: restaurant.title, subtitle: restaurant.subtitle, rating: restaurant.rating, ad: restaurant.ad, discount: restaurant.discount))
        }
        
        var orderDinnerFrom: [OrderDinnerFrom] = []
        backendResponse.orderDinnerFrom.forEach { order in
            orderDinnerFrom.append(OrderDinnerFrom(id: order.id, adUrl: order.adUrl, title: order.title, subtitle: order.subtitle))
        }
        
        var discoverItems: [Discover] = []
        backendResponse.Discover.forEach { discover in
            discoverItems.append(Discover(id: discover.id, url: discover.url))
        }
        
        var recomendedFood: [Food] = []
        backendResponse.recomendedFood.forEach { food in
            recomendedFood.append(Food(id: food.id, foodUrl: food.foodUrl, title: food.title, shop: food.shop, price: food.price))
        }
        
        var orderWithGrabMart: [OrderWithGrabMart] = []
        backendResponse.orderWithGrabMart.forEach { order in
            orderWithGrabMart.append(OrderWithGrabMart(id: order.id, url: order.url))
        }
        
        var keepDiscovering: [KeepDiscovering] = []
        backendResponse.keepDiscovering.forEach { keep in
            keepDiscovering.append(KeepDiscovering(id: keep.id, url: keep.url))
        }
        
        
        let homeEntity = HomeEntity(monthlyUpdates: monthlyUpdates, diningDiscount: diningDiscounts, suggesstions: suggesstions, topSugessted: topSugessted, recentRestaurants:recentRestaurants, recomendedRestaurants: recomendedRestaurants, orderDinnerFrom: orderDinnerFrom, Discover: discoverItems, recomendedFood: recomendedFood, orderWithGrabMart: orderWithGrabMart, keepDiscovering: keepDiscovering)
        return homeEntity
    }
}
