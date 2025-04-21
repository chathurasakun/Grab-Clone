//
//  ShoppingItemEntity.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 06/11/2024.
//

struct HomeEntity: Equatable {
    static func == (lhs: HomeEntity, rhs: HomeEntity) -> Bool {
        return (lhs.monthlyUpdates == rhs.monthlyUpdates && lhs.orderDinnerFrom == rhs.orderDinnerFrom &&
                lhs.keepDiscovering == rhs.keepDiscovering && lhs.Discover == rhs.Discover &&
                lhs.orderWithGrabMart == rhs.orderWithGrabMart && lhs.recentRestaurants == rhs.recentRestaurants &&
                lhs.recomendedFood == rhs.recomendedFood && lhs.recomendedRestaurants == rhs.recomendedRestaurants)
    }
    
    var monthlyUpdates: MonthlyUpdates
    var diningDiscount: String
    var suggesstions: [Suggestions]
    var topSugessted: [Suggestions]
    var recentRestaurants: [RecentRestaurants]
    var recomendedRestaurants: [RecentRestaurants]
    var orderDinnerFrom: [OrderDinnerFrom]
    var Discover: [Discover]
    var recomendedFood: [Food]
    var orderWithGrabMart: [OrderWithGrabMart]
    var keepDiscovering: [KeepDiscovering]
    
    init(monthlyUpdates: MonthlyUpdates, diningDiscount: String, suggesstions: [Suggestions], topSugessted: [Suggestions], recentRestaurants: [RecentRestaurants], recomendedRestaurants: [RecentRestaurants], orderDinnerFrom: [OrderDinnerFrom], Discover: [Discover], recomendedFood: [Food], orderWithGrabMart: [OrderWithGrabMart], keepDiscovering: [KeepDiscovering]) {
        self.monthlyUpdates = monthlyUpdates
        self.diningDiscount = diningDiscount
        self.suggesstions = suggesstions
        self.topSugessted = topSugessted
        self.recentRestaurants = recentRestaurants
        self.recomendedRestaurants = recomendedRestaurants
        self.orderDinnerFrom = orderDinnerFrom
        self.Discover = Discover
        self.recomendedFood = recomendedFood
        self.orderWithGrabMart = orderWithGrabMart
        self.keepDiscovering = keepDiscovering
    }
}

struct MonthlyUpdates: Equatable {
    var topic: String
    var dueDate: String
    var picture: String
    var bannerColor: String
}

struct Suggestions: Equatable {
    var id: String
    var title: String
    var task: String
    var subtitle: String
    var url: String
}

struct RecentRestaurants: Equatable {
    var id: String
    var imageUrl: String
    var title: String
    var subtitle: String
    var rating: Double
    var ad: String
    var discount: Int
}

struct Discover: Equatable {
    var id: String
    var url: String
}

struct OrderDinnerFrom: Equatable {
    var id: String
    var adUrl: String
    var title: String
    var subtitle: String
}

struct Food: Equatable {
    var id: String
    var foodUrl: String
    var title: String
    var shop: String
    var price: String
}

struct OrderWithGrabMart: Equatable {
    var id: String
    var url: String
}

struct KeepDiscovering: Equatable {
    var id: String
    var url: String
}
