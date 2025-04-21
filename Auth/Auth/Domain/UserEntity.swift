//
//  UserEntity.swift
//  Auth
//
//  Created by CHATHURA ELLAWALA on 06/11/2024.
//

struct UserEntity {
    let id: String
    let name: String
    let email: String
    let password: String
    let createdAt: Date
    let updatedAt: Date
    let isActive: Bool
    let isDeleted: Bool
    let accessToken: String
    let refreshToken: String
}
