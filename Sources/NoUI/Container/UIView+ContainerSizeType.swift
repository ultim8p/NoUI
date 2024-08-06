//
//  PView+ContainerSizeType.swift
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

/*
 Device sizes:
 iPhone width: 320 - 430
 iPhone height: 568 - 932
 
 iPad width: 744 - 1024
 iPad height: 1024 - 1366
 */

public extension PView {
    
    enum ContainerSizeType: CGFloat, Comparable {
        
        case xSmall = 568
        
        case small = 744.0
        
        case medium = 932.0
        
        case large = 1024.0
        
        case xLarge = 1366.0
        
        public static func < (lhs: ContainerSizeType, rhs: ContainerSizeType) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
        public init(_ dimension: CGFloat) {
            if dimension >= ContainerSizeType.xLarge.rawValue {
                self = .xLarge
            } else if dimension >= ContainerSizeType.large.rawValue {
                self = .large
            } else if dimension >= ContainerSizeType.medium.rawValue {
                self = .medium
            } else if dimension >= ContainerSizeType.small.rawValue {
                self = .small
            } else {
                self = .xSmall
            }
        }
    }
    
    struct AdaptableSize {
         
        var xSmall: CGSize?
        
        var small: CGSize?
        
        var medium: CGSize?
        
        var large: CGSize?
        
        var xLarge: CGSize?
        
        func size(containerHeight: CGFloat) -> CGSize? {
            let type = ContainerSizeType(containerHeight)
            switch type {
            case .xSmall: return xSmall
            case .small: return small
            case .medium: return medium
            case .large: return large
            case .xLarge: return xLarge
            }
        }
    }
}
