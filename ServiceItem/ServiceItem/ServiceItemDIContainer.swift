//
//  ServiceItemDIContainer.swift
//  ServiceItem
//
//  Created by CHATHURA ELLAWALA on 20/11/2024.
//


import Common
import Swinject

extension Container {
    static let sharedServiceItemDIContainer: Container = {
        let container = Container()
        
        container.register(ApiClientProtocol.self) { _ in ApiClient()}
        container.register(ShoppingItemDataSourceProtocol.self) { resolver in
            let apiClient = resolver.resolve(ApiClientProtocol.self)!
            return ShoppingItemDataSource(apiClient: apiClient)
        }
        container.register(ShoppingItemRepositoryProtocol.self) { resolver in
            let shoppingItemDataSource = resolver.resolve(ShoppingItemDataSourceProtocol.self)!
            return ShoppingItemRepository(shoppingItemDataSource: shoppingItemDataSource)
        }
        container.register(ShoppingItemUseCaseProtocol.self) { resolver in
            let shoppingItemRepository = resolver.resolve(ShoppingItemRepositoryProtocol.self)!
            return ShoppingItemUseCase(shoppingItemRepository: shoppingItemRepository)
        }
        container.register(ShoppingItemViewModelProtocol.self) { resolver in
            let shoppingItemUseCase = resolver.resolve(ShoppingItemUseCaseProtocol.self)!
            return ShoppingItemViewModel(shoppingItemUseCase: shoppingItemUseCase)
        }
        return container
    }()
}
