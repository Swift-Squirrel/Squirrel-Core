//
//  DataError.swift
//  SquirrelCore
//
//  Created by Filip Klembara on 10/16/17.
//

/// Data errors
public struct DataError: SquirrelError {
    /// Error kinds
    ///
    /// - dataEncodingError: Encoding failed
    /// - dataDecodingError: Decoding failed
    public enum ErrorKind {
        case dataEncodingError
        case dataDecodingError(string: String)
    }

    /// Constructs Data encoding/decoding error description
    ///
    /// - Parameters:
    ///   - kind: Error kind
    ///   - description: Error description
    public init(kind: ErrorKind, description: String? = nil) {
        self.kind = kind
        _description = description
    }

    /// Error kind
    public let kind: ErrorKind
    private let _description: String?

    /// Error description
    public var description: String {
        var msg = ""
        if let _description = self._description {
            msg = _description
        } else {
            switch kind {
            case .dataEncodingError:
                msg = "Error while encoding data."
            case .dataDecodingError:
                msg = "Error while decoding data."
            }
        }
        switch kind {
        case .dataDecodingError(let string):
            msg += "\nString: '\(string)'"
        default:
            break
        }
        return msg
    }
}
