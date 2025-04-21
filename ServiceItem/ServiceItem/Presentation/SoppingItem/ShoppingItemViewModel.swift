//
//  ShoppingItemViewModel.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 06/11/2024.
//
import Common

enum CellType {
    case TableHeader, TopSuggested, RecentRestaurants, RecomendedRestaurants, Discover,
    RecommendedFood
}

struct TableHeaderContent {
    var monthlyUpdates: MonthlyUpdates
    var discount: Int
    var suggestions: [Suggestions]
}

struct SectionItem: Equatable {
    static func == (lhs: SectionItem, rhs: SectionItem) -> Bool {
        return lhs.cellType == rhs.cellType &&
        lhs.content as? String == rhs.content as? String
    }
    
    var cellType: CellType
    var content: Any
}

protocol ShoppingItemViewModelProtocol {
    func fetchHomeDetails(completion: @escaping( _ success: Bool) -> Void)
    var homePageItems: [SectionItem] { get set }
}

class ShoppingItemViewModel: NSObject, ShoppingItemViewModelProtocol {
    var homePageItems: [SectionItem] = []
    
    let shoppingItemUseCase: ShoppingItemUseCaseProtocol
    
    init(shoppingItemUseCase: ShoppingItemUseCaseProtocol) {
        self.shoppingItemUseCase = shoppingItemUseCase
    }
    
    func fetchHomeDetails(completion: @escaping(_ success: Bool) -> Void) {
        shoppingItemUseCase.getHomeScreenItems { (homeResponse, isSuccess) in
            guard let homeItems = homeResponse else {
                completion(false)
                return
            }
            self.homePageItems = self.shoppingItemUseCase.mapHomeEntitiesToSections(entities: homeItems)
            completion(true)
        }
    }
    
}
