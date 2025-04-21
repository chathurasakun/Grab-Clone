//
//  ApiClient.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 06/11/2024.
//

public class ApiClient: ApiClientProtocol {
    
    public init() {
        
    }
    
    public func loginUser(username: String, password: String, completion: @escaping (Result<UserResponse, any Error>) -> Void) {
        // Can implement Network Manager which will handle encoding decoding params, url, http methods and etc.
        // Or can implement with combine framework
        
        // AF -> retry, adapt, validateBodyStatus
        // Can use urlRequestConvertible protocol from
        
        // Send Dummy success response for now
        let response = UserResponse(id: "AA7845", name: "Chathura Ellawala", email: "chathura.sakun@gmail.com", password: "Abcd@1234", createdAt: Date(), updatedAt: Date(), isActive: true, isDeleted: false, accessToken: "aaas2324dgjshgdj26536287482912nkdf9", refreshToken: "dhdskhfk231743287682376234012dljdlsfsf")
        completion(Result<UserResponse, any Error>.success(response))
    }
    
    public func fetchHomeData(completion: @escaping (Result<HomeResponse, any Error>) -> Void) {
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
            RecentRestaurants(id: "r1", imageUrl: "IMG_96ECFBFB5A03-1", ad: "Ad", title: "Bing Shifu Mini Bowl", subtitle: "4.8km", rating: 4.7, discount: 0),
            RecentRestaurants(id: "r1", imageUrl: "IMG_808DD1949984-1", ad: "Ad", title: "Seni Sattisoru - kombo", subtitle: "9.8km", rating: 4.4, discount: 11),
            RecentRestaurants(id: "r1", imageUrl: "IMG_4563C78993C2-1", ad: "Ad", title: "Oh Yeah Banana Leaf", subtitle: "7.8km", rating: 3.9, discount: 0),
            RecentRestaurants(id: "r1", imageUrl: "IMG_BDEBEFBAA0AB-1", ad: "Ad", title: "Panjabi Rasoi - Brickfileds", subtitle: "0.8km", rating: 4.4, discount: 7),
            RecentRestaurants(id: "r1", imageUrl: "IMG_FDC3561F0A98-1", ad: "Ad", title: "jolibee - Sri Permaisuri", subtitle: "4.8km", rating: 4.8, discount: 35),
        ]
        let recomendedRestaurants: [RecentRestaurants] = [
            RecentRestaurants(id: "r1", imageUrl: "IMG_39AB8DE105CC-1", ad: "", title: "Dominos Pizza Maluri", subtitle: "4.8km", rating: 3.9, discount: 11),
            RecentRestaurants(id: "r1", imageUrl: "IMG_4B9547222A02-1", ad: "", title: "Pizza Hut Cochrane", subtitle: "4.8km", rating: 4.0, discount: 7),
            RecentRestaurants(id: "r3", imageUrl: "IMG_15E79211039A-1", ad: "", title: "Hydrabad Recipes", subtitle: "9.1km", rating: 4.9, discount: 0),
            RecentRestaurants(id: "r4", imageUrl: "IMG_08923BEBE953-1", ad: "", title: "VMD food corner", subtitle: "8.8km", rating: 4.8, discount: 10)
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
        let response = HomeResponse(monthlyUpdates: monthlyUpdates, diningDiscount: "40", suggesstions: suggesstions, topSugessted: topSugessted, recentRestaurants: recentRestaurants, recomendedRestaurants: recomendedRestaurants, orderDinnerFrom: orderDinnerFrom, Discover: discover, recomendedFood: recomemndedFood, orderWithGrabMart: orderWithGrabMart, keepDiscovering: keepqDiscovering)
        completion(Result<HomeResponse, any Error>.success(response))
        
    }
}



// LEarnings

/// UI tests using record (accessmodiers)
/// tuist - modularization https://tuist.dev/
/// https://ronanociosoig.medium.com/modular-apps-with-a-tuist-8fdd8d3fd4bb
