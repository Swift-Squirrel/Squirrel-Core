//
//  SquirrelPresentable.swift
//  SquirrelCore
//
//  Created by Filip Klembara on 10/16/17.
//

import Foundation

/// Presentable
public protocol SquirrelPresentable {

    /// Returns data presentation of object
    ///
    /// - Returns: Data presentation of object
    /// - Throws: Custom errors
    func present() throws -> Data

    var representAs: Representation { get }
}

/// Representation types
///
/// - text: text
/// - html: html
/// - json: json
public enum Representation {
    case text
    case html
    case json
}
