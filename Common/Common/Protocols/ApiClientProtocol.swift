//
//  UserRepositoryProtocol.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 11/11/2024.
//

public protocol ApiClientProtocol {
    func loginUser(username: String, password: String, completion: @escaping (Result<UserResponse, any Error>) -> Void)
    func fetchHomeData(completion: @escaping (Result<HomeResponse, any Error>) -> Void)
}
