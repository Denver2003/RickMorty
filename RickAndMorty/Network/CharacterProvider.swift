//
//  CharacterProvider.swift
//  RickAndMorty
//
//  Created by Denis Khlopin on 04.05.2021.
//

import Moya

enum CharacterProvider: TargetType {
    case getCharacters(page: Int?)
    case getCharacter(id: Int)

    var baseURL: URL {
        URL(string: "https://rickandmortyapi.com/api/")!
    }

    var path: String {
        switch self {
        case .getCharacter(let id):
            return "character/\(id)"
        case .getCharacters:
            return "character"
        }
    }

    var method: Method {
        switch self {
        case .getCharacters, .getCharacter:
            return .get
        }
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        var params = [String: Any]()
        switch self {
        case .getCharacter:
            return .requestPlain
        case .getCharacters(let page):
            if let page = page {
                params["page"] = page
            }
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        [String : String]()
    }
}
