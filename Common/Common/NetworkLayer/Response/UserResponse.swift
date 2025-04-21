//
//  UserResponse.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 06/11/2024.
//

public struct UserResponse {
    public let id: String
    public let name: String
    public let email: String
    public let password: String
    public let createdAt: Date
    public let updatedAt: Date
    public let isActive: Bool
    public let isDeleted: Bool
    public let accessToken: String
    public let refreshToken: String
}
