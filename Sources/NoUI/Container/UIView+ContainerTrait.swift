//
//  PView+ContainerTrait.swift
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
    
    enum ContainerTrait: Equatable, Hashable {
        
        case any
        case size(width: ContainerSizeCondition, height: ContainerSizeCondition)
        case orientation(ContainerOrientationType)
        
        public func matches(_ size: CGSize) -> Bool {
            switch self {
            case .any: return true
            case .orientation(let orientation):
                switch orientation {
                case .portrait: return size.isContainerPortrait
                case .landscape: return size.isContainerLandscape
                }
            case .size(let widthOperator, let heightOperator):
                return widthOperator.matches(size.width) && heightOperator.matches(size.height)
            }
        }
    }
    
//    var isRightToLeftLanguage: Bool {
//        return PView.userInterfaceLayoutDirection(
//            for: self.semanticContentAttribute
//        ) == .rightToLeft
//    }
}
