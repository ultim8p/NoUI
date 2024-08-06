//
//  PView+ConstraintPriority.swift
//  ChessKid
//
//  Created by Guerson Perez on 8/30/23.
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
    
    static let defaultConstraintPriority: ConstraintPriority = .priority10
    
    enum ConstraintPriority: RawRepresentable {
        
        case priority10
        case priority9
        case priority8
        case priority7
        case priority6
        case priority5
        case priority4
        case priority3
        case priority2
        case priority1
        
        // swiftlint:disable nesting
        public typealias RawValue = PConstraintPriority
        // swiftlint:enable nesting
        
        public init?(rawValue: PConstraintPriority) {
            let value = Int(rawValue.rawValue)
            if value >= 900 {
                self = .priority10
            } else if value >= 800 {
                self = .priority9
            } else if value >= 700 {
                self = .priority8
            } else if value >= 600 {
                self = .priority7
            } else if value >= 500 {
                self = .priority6
            } else if value >= 400 {
                self = .priority5
            } else if value >= 300 {
                self = .priority4
            } else if value >= 200 {
                self = .priority3
            } else if value >= 100 {
                self = .priority2
            } else {
                self = .priority1
            }
            
        }
        
        public var rawValue: PConstraintPriority {
            switch self {
            case .priority10:
                return PConstraintPriority(rawValue: 1000)
            case .priority9:
                return PConstraintPriority(rawValue: 900)
            case .priority8:
                return PConstraintPriority(rawValue: 800)
            case .priority7:
                return PConstraintPriority(rawValue: 700)
            case .priority6:
                return PConstraintPriority(rawValue: 600)
            case .priority5:
                return PConstraintPriority(rawValue: 500)
            case .priority4:
                return PConstraintPriority(rawValue: 400)
            case .priority3:
                return PConstraintPriority(rawValue: 300)
            case .priority2:
                return PConstraintPriority(rawValue: 200)
            case .priority1:
                return PConstraintPriority(rawValue: 100)
            }
        }
    }
}
