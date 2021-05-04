//
//  RMError.swift
//  RickAndMorty
//
//  Created by Denis Khlopin on 04.05.2021.
//

import Foundation

enum RMError: Error {
    case unknown
    case network
    case parse
}

extension RMError: LocalizedError {
    private var errorDescription: String {
        switch self {
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "unknown")
        case .network:
            return NSLocalizedString("Network error", comment: "network")
        case .parse:
            return NSLocalizedString("JSON Parse error", comment: "parse")
        }
    }
}
