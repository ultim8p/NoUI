//
//  PView+AssociatedConstraints.swift
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
    
    class AssociatedConstraints {
        var constraints: [ContainerTraitCondition: [NSLayoutConstraint]] = [:]
    }
    
    struct AssociatedKeys {
        static var constraints = "constraints"
        static var currentContainerSize = "currentContainerSize"
    }
    
    var associatedConstraints: AssociatedConstraints {
        if let constraints = objc_getAssociatedObject(
            self,
            &AssociatedKeys.constraints
        ) as? AssociatedConstraints {
            return constraints
        } else {
            let constraints = AssociatedConstraints()
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.constraints,
                constraints,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
            
            return constraints
        }
    }
    
    var currentContainerSize: CGSize? {
        get {
            objc_getAssociatedObject(self, &AssociatedKeys.currentContainerSize) as? CGSize
        }
        set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.currentContainerSize,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}

public extension PView {
    
    func anchorType(for constraint: NSLayoutConstraint) -> NSLayoutConstraint.Attribute? {
        [constraint.firstAttribute, constraint.secondAttribute].first(where: { attr in
            return [
                .leading, .trailing, .top, .bottom, .centerX, .centerY, .width, .height
            ].contains(attr)
        })
    }
    
    func add(constraint: NSLayoutConstraint, trait: ContainerTraitCondition) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let existingConstraints = associatedConstraints.constraints[trait] {
            if let existingConstraintIndex = existingConstraints.firstIndex(where: { existingConstraint in
                return anchorType(for: constraint) == anchorType(for: existingConstraint)
            }) {
                let existingConstraint = existingConstraints[existingConstraintIndex]
                existingConstraint.isActive = false
                existingConstraint.shouldBeArchived = false
                self.removeConstraint(existingConstraint)
                associatedConstraints.constraints[trait]![existingConstraintIndex] = constraint
            } else {
                associatedConstraints.constraints[trait]!.append(constraint)
            }
        } else {
            associatedConstraints.constraints[trait] = [constraint]
        }
        
        if trait == .any { constraint.isActive = true }
        if let currentContainerSize, trait.matches(currentContainerSize) { constraint.isActive = true }
    }
    
    func removeConstraints() {
        for (_, constraints) in associatedConstraints.constraints {
            constraints.forEach {
                $0.isActive = false
                $0.shouldBeArchived = false
                removeConstraint($0)
            }
        }
        
        associatedConstraints.constraints = [:]
        currentContainerSize = nil
    }
    
    func removeConstraint(_ attribute: NSLayoutConstraint.Attribute, for trait: ContainerTraitCondition) {
        guard let existingConstraints = associatedConstraints.constraints[trait] else {
            return
        }
        
        let filteredConstraints = existingConstraints.filter { constraint in
            return anchorType(for: constraint) != attribute
        }
        
        for constraint in existingConstraints where anchorType(for: constraint) == attribute {
            constraint.isActive = false
            constraint.shouldBeArchived = false
            removeConstraint(constraint)
        }
        
        associatedConstraints.constraints[trait] = filteredConstraints
    }
    
    func removeConstraints(_ attributes: [NSLayoutConstraint.Attribute], for trait: ContainerTraitCondition) {
        for attribute in attributes {
            removeConstraint(attribute, for: trait)
        }
    }
    
    func updateConstraints(for size: CGSize) {
        guard currentContainerSize != size else { return }
        
        currentContainerSize = size
        for (trait, constraints) in associatedConstraints.constraints {
            if trait.matches(size) {
                constraints.forEach { $0.isActive = true }
            } else {
                constraints.forEach { $0.isActive = false }
            }
        }
    }
}
