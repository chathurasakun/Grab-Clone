//
//  Untitled.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 25/12/2024.
//

import Common

protocol ShoppingItemRepositoryProtocol {
    func fetchHomeItems(completion: @escaping (HomeEntity?, Bool) ->  Void)
}

class ShoppingItemRepository: ShoppingItemRepositoryProtocol {
    let shoppingItemDataSource: ShoppingItemDataSourceProtocol
    
    init(shoppingItemDataSource: ShoppingItemDataSourceProtocol) {
        self.shoppingItemDataSource = shoppingItemDataSource
    }
    
    func fetchHomeItems(completion: @escaping (HomeEntity?, Bool) ->  Void) {
        shoppingItemDataSource.fetchHomeItems { (items, success) in
            completion(items, success)
        }
    }
}
