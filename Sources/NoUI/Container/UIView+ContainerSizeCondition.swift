//
//  PView+ContainerSizeCondition.swift
//  ChessKid
//
//  Created by Guerson Perez on 8/12/23.
//  Copyright © 2023 chess. All rights reserved.
//

import Foundation
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#elseif canImport(Cocoa)
import Cocoa
#endif

public extension PView {
    
    enum ContainerSizeCondition: Equatable, Hashable {
        
        case any
        case equal(ContainerSizeType)
        case greaterThan(ContainerSizeType)
        case greaterThanOrEqualTo(ContainerSizeType)
        case lessThan(ContainerSizeType)
        case lessThanOrEqualTo(ContainerSizeType)
        
        func matches(_ dimension: CGFloat?) -> Bool {
            guard let dimension = dimension else { return true }
            switch self {
            case .any: return true
            case .equal(let type):
                let matchType = ContainerSizeType(dimension)
                return matchType == type
            case .greaterThan(let type): return dimension > type.rawValue
            case .greaterThanOrEqualTo(let type): return dimension >= type.rawValue
            case .lessThan(let type): return dimension < type.rawValue
            case .lessThanOrEqualTo(let type): return dimension <= type.rawValue
            }
        }
        
        public func hash(into hasher: inout Hasher) {
            switch self {
            case .any:
                hasher.combine("any")
            case .equal(let type):
                hasher.combine("equal")
                hasher.combine(type)
            case .greaterThan(let type):
                hasher.combine("greaterThan")
                hasher.combine(type)
            case .greaterThanOrEqualTo(let type):
                hasher.combine("greaterThanOrEqualTo")
                hasher.combine(type)
            case .lessThan(let type):
                hasher.combine("lessThan")
                hasher.combine(type)
            case .lessThanOrEqualTo(let type):
                hasher.combine("lessThanOrEqualTo")
                hasher.combine(type)
            }
        }
    }
}
