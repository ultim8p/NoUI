//
//  PView+ContainerOrientationType.swift
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
    
    enum ContainerOrientationType: Hashable {
        
        case portrait
        
        case landscape
    }
    
    var orientation: ContainerOrientationType {
        bounds.size.containerOrientation
    }
    
    var isContainerPortrait: Bool { bounds.size.isContainerPortrait }
    
    var isContainerLandscape: Bool { bounds.size.isContainerLandscape }
}

public extension CGSize {
    
    var containerOrientation: PView.ContainerOrientationType {
        width >= height ? .landscape : .portrait
    }
    
    var isContainerPortrait: Bool { containerOrientation == .portrait }
    
    var isContainerLandscape: Bool { containerOrientation == .landscape }
}
