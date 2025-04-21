//
//  HomeResponse.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 25/12/2024.
//

public struct HomeResponse {
    public let monthlyUpdates: MonthlyUpdates
    public let diningDiscount: String
    public let suggesstions: [Suggestions]
    public let topSugessted: [Suggestions]
    public let recentRestaurants: [RecentRestaurants]
    public let recomendedRestaurants: [RecentRestaurants]
    public let orderDinnerFrom: [OrderDinnerFrom]
    public let Discover: [Discover]
    public let recomendedFood: [Food]
    public let orderWithGrabMart: [OrderWithGrabMart]
    public let keepDiscovering: [KeepDiscovering]
}

public struct MonthlyUpdates {
    public let topic: String
    public let dueDate: String
    public let picture: String
    public let bannerColor: String
}

public struct Suggestions {
    public let id: String
    public let title: String
    public let task: String
    public let subtitle: String
    public let url: String
}

public struct RecentRestaurants {
    public let id: String
    public let imageUrl: String
    public let ad: String
    public let title: String
    public let subtitle: String
    public let rating: Double
    public let discount: Int
}

public struct Discover {
    public let id: String
    public let url: String
}

public struct OrderDinnerFrom {
    public let id: String
    public let adUrl: String
    public let title: String
    public let subtitle: String
}

public struct Food {
    public let id: String
    public let foodUrl: String
    public let title: String
    public let shop: String
    public let price: String
}

public struct OrderWithGrabMart {
    public let id: String
    public let url: String
}

public struct KeepDiscovering {
    public let id: String
    public let url: String
}
