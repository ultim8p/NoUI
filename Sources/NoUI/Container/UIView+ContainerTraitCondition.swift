//
//  PView+ContainerTraitCondition.swift
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
    
    enum ContainerTraitCondition: Equatable, Hashable {
        case any
        case matching([ContainerTrait])
        
        func matches(_ size: CGSize) -> Bool {
            switch self {
            case .any:
                return true
            case .matching(let selectors):
                return selectors.allSatisfy { $0.matches(size) }
            }
        }
        
        public func hash(into hasher: inout Hasher) {
            switch self {
            case .any:
                hasher.combine("any")
            case .matching(let selectors):
                let hashes = selectors.map { $0.hashValue }.sorted()
                hasher.combine(hashes)
            }
        }
        
        public static func == (lhs: ContainerTraitCondition, rhs: ContainerTraitCondition) -> Bool {
            switch (lhs, rhs) {
            case (.any, .any):
                return true
            case let (.matching(lhsSelectors), .matching(rhsSelectors)):
                return Set(lhsSelectors) == Set(rhsSelectors)
            default:
                return false
            }
        }
    }
}
