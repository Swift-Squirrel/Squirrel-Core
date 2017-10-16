//
//  SquirrelError.swift
//  SquirrelCore
//
//  Created by Filip Klembara on 10/16/17.
//

/// Squirrel error
public protocol SquirrelError: Error, CustomStringConvertible {
    /// Error kind enum
    associatedtype errorKind

    /// Error kind
    var kind: errorKind { get }
}
