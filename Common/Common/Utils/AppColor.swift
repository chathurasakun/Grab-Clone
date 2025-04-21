//
//  AppColor.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 20/11/2024.
//

import Foundation
import UIKit

public enum AppColor {
    case MainBG
    case Title
    case ButtonActive
    case ButtonDisabled
    case GrayLine
    case LightGray
    case ActiveLine
    case ImageTint
    case Error
    case BgColorSpecial
    case BgSpecial
    
    public var color: UIColor {
        switch self {
        case .MainBG: return UIColor(named: "MainBG") ?? .white
        case .Title: return UIColor(named: "Title") ?? .black
        case .ButtonActive: return UIColor(named: "ButtonActive") ?? .systemBlue
        case .ButtonDisabled: return UIColor(named: "ButtonDisabled") ?? .systemGray
        case .GrayLine: return UIColor(named: "GrayLine") ?? .systemGray
        case .LightGray: return UIColor(named: "LightGray") ?? .lightGray
        case .ActiveLine: return UIColor(named: "ActiveLine") ?? .green
        case .ImageTint: return UIColor(named: "ImageTint") ?? .systemGray
        case .Error: return UIColor(named: "Error") ?? .red
        case .BgColorSpecial: return UIColor(named: "BgColorSpecial") ?? .lightGray
        case .BgSpecial: return UIColor(named: "BgSpecial") ?? .orange
        }
    }
}
