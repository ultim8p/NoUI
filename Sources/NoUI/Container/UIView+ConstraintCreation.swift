//
//  PView+ConstraintCreation.swift
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
    
    // MARK: - Lead
    
    @discardableResult
    func lead(
        to anchor: NSLayoutXAxisAnchor,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = leadingAnchor.constraint(equalTo: anchor, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    @discardableResult
    func leadLTE(
        to anchor: NSLayoutXAxisAnchor,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    @discardableResult
    func leadGTE(
        to anchor: NSLayoutXAxisAnchor,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    // MARK: - Trail
    
    @discardableResult
    func trail(
        to anchor: NSLayoutXAxisAnchor,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = trailingAnchor.constraint(equalTo: anchor, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    @discardableResult
    func trailLTE(
        to anchor: NSLayoutXAxisAnchor,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    @discardableResult
    func trailGTE(
        to anchor: NSLayoutXAxisAnchor,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    // MARK: - Top
    
    @discardableResult
    func top(
        to anchor: NSLayoutYAxisAnchor,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = topAnchor.constraint(equalTo: anchor, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    @discardableResult
    func topGTE(
        to anchor: NSLayoutYAxisAnchor,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    // MARK: - Bottom
    
    @discardableResult
    func bottom(
        to anchor: NSLayoutYAxisAnchor,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    @discardableResult
    func bottomLTE(
        to anchor: NSLayoutYAxisAnchor,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    // MARK: - Width
    
    @discardableResult
    func width(
        _ const: CGFloat,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = widthAnchor.constraint(equalToConstant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    @discardableResult
    func width(
        to dimension: NSLayoutDimension,
        mult: CGFloat = 1.0,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = widthAnchor.constraint(equalTo: dimension, multiplier: mult, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    @discardableResult
    func width(
        to view: PView,
        mult: CGFloat = 1.0,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        return self.width(to: view.widthAnchor, mult: mult, priority: priority, trait: trait)
    }
    
    @discardableResult
    func widthGTE(
        _ const: CGFloat,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    func widthGTE(
        to dimension: NSLayoutDimension,
        mult: CGFloat = 1.0,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = widthAnchor.constraint(
            greaterThanOrEqualTo: dimension,
            multiplier: mult,
            constant: const
        )
        
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    // MARK: - Height
    
    @discardableResult
    func height(
        _ const: CGFloat,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = heightAnchor.constraint(equalToConstant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    @discardableResult
    func height(
        to dimension: NSLayoutDimension,
        mult: CGFloat = 1.0,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = heightAnchor.constraint(equalTo: dimension, multiplier: mult, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    @discardableResult
    func heightGTE(
        _ const: CGFloat,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    func heightGTE(
        to dimension: NSLayoutDimension,
        mult: CGFloat = 1.0,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = heightAnchor.constraint(
            greaterThanOrEqualTo: dimension,
            multiplier: mult,
            constant: const
        )
        
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    // MARK: - CenterX
    
    @discardableResult
    func centerX(
        to anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = centerXAnchor.constraint(equalTo: anchor, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    // MARK: - CenterY
    
    @discardableResult
    func centerY(
        to anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = centerYAnchor.constraint(equalTo: anchor, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
}

// MARK: - Constraining To Views
 
public extension PView {
    
    // MARK: - Lead
    
    @discardableResult
    func lead(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        lead(to: view.leadingAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func safeLead(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        lead(to: view.safeAreaLayoutGuide.leadingAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func leadCenter(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        lead(to: view.centerXAnchor, const: const, priority: priority, trait: trait)
    }
    
    // MARK: - Trail
    
    @discardableResult
    func trail(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        trail(to: view.trailingAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func safeTrail(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        trail(to: view.safeAreaLayoutGuide.trailingAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func trailCenter(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        trail(to: view.centerXAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func trailLTE(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        trailLTE(to: view.trailingAnchor, const: const, priority: priority, trait: trait)
    }
    
    // MARK: - Top
    
    @discardableResult
    func top(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        top(to: view.topAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func safeTop(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        top(to: view.safeAreaLayoutGuide.topAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func topGTE(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        topGTE(to: view.topAnchor, const: const, priority: priority, trait: trait)
    }
    
    // MARK: - Bottom
    
    @discardableResult
    func bottom(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        bottom(to: view.bottomAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func safeBottom(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        bottom(to: view.safeAreaLayoutGuide.bottomAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func bottomLTE(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        let constraint = bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: const)
        constraint.priority = priority.rawValue
        add(constraint: constraint, trait: trait)
        return self
    }
    
    // MARK: - CenterX
    
    @discardableResult
    func centerX(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        centerX(to: view.centerXAnchor, const: const, priority: priority, trait: trait)
    }
    
    // MARK: - CenterY
    
    @discardableResult
    func centerY(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        centerY(to: view.centerYAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func onTop(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        bottom(to: view.topAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func onTopCenter(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        top(to: view.centerYAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func onBottom(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        top(to: view.bottomAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func onRight(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        lead(to: view.trailingAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func onRightGTE(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        leadGTE(to: view.trailingAnchor, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func onLeft(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        trail(to: view.leadingAnchor, const: const, priority: priority, trait: trait)
    }
}

// MARK: - Grouped Constraints

public extension PView {
    
    @discardableResult
    func onFull(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        lead(to: view, const: const, priority: priority, trait: trait)
            .trail(to: view, const: -const, priority: priority, trait: trait)
            .top(to: view, const: const, priority: priority, trait: trait)
            .bottom(to: view, const: -const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func onFullTop(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        lead(to: view, const: const, priority: priority, trait: trait)
            .top(to: view, const: const, priority: priority, trait: trait)
            .trail(to: view, const: -const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func onFullBottom(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        lead(to: view, const: -const, priority: priority, trait: trait)
            .bottom(to: view, const: const, priority: priority, trait: trait)
            .trail(to: view, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func onFullRight(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        trail(to: view, const: const, priority: priority, trait: trait)
            .top(to: view, const: -const, priority: priority, trait: trait)
            .bottom(to: view, const: const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func onFullLeft(
        to view: PView,
        const: CGFloat = 0.0,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        lead(to: view, const: const, priority: priority, trait: trait)
            .top(to: view, const: const, priority: priority, trait: trait)
            .bottom(to: view, const: -const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func onSize(
        const: CGFloat,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        self.width(const, priority: priority, trait: trait).height(const, priority: priority, trait: trait)
    }
    
    @discardableResult
    func onSize(
        size: CGSize,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        self.width(size.width, priority: priority, trait: trait)
            .height(size.height, priority: priority, trait: trait)
    }
    
    @discardableResult
    func onCenter(
        to view: PView,
        priority: ConstraintPriority = defaultConstraintPriority,
        trait: ContainerTraitCondition = .any
    ) -> PView {
        centerX(to: view, priority: priority, trait: trait)
            .centerY(to: view, priority: priority, trait: trait)
    }
}

// MARK: - Multi Trait Creation

public extension PView {
    
    @discardableResult
    func onAdaptableSizeHeightTrait(
        size: AdaptableSize,
        priority: ConstraintPriority = defaultConstraintPriority
    ) -> PView {
        if let xSmall = size.xSmall {
            onSize(size: xSmall, priority: priority, trait: .matching([
                .size(width: .any, height: .lessThanOrEqualTo(.xSmall))
            ]))
        }
        
        if let small = size.small {
            onSize(size: small, priority: priority, trait: .matching([
                .size(width: .any, height: .lessThanOrEqualTo(.small))
            ]))
        }
        
        if let medium = size.medium {
            onSize(size: medium, priority: priority, trait: .matching([
                .size(width: .any, height: .lessThanOrEqualTo(.medium))
            ]))
        }
        
        if let large = size.large {
            onSize(size: large, priority: priority, trait: .matching([
                .size(width: .any, height: .lessThanOrEqualTo(.large))
            ]))
        }
        
        if let xLarge = size.xLarge {
            onSize(size: xLarge, priority: priority, trait: .matching([
                .size(width: .any, height: .greaterThan(.large))
            ]))
        }
        
        return self
    }
}
