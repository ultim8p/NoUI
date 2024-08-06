//
//  File.swift
//  
//
//  Created by Guerson Perez on 05/08/24.
//

import Foundation
import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

#if os(macOS)
public typealias PView = NSView
public typealias PConstraintPriority = NSLayoutConstraint.Priority
#elseif os(iOS)
public typealias PView = UIView
public typealias PConstraintPriority = UILayoutPriority
#endif
