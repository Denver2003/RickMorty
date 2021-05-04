//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Denis Khlopin on 04.05.2021.
//

import Moya

class CharacterService {
    typealias CharacterResult = (Result<Character, RMError>) -> Void

    func getCharacter(byId id: Int, completion: @escaping CharacterResult) {

        let provider = MoyaProvider<CharacterProvider>()

        provider.request(.getCharacter(id: id)) { [weak self] result in
            switch result {
            case .success(let response):
                if let character = self?.decodeCharacter(from: response.data) {
                    completion(.success(character))
                    return
                }
                completion(.failure(.parse))
            case .failure:
                completion(.failure(.network))
            }
        }
    }

    private func decodeCharacter(from data: Data) -> Character? {
        let decoder = JSONDecoder()
        if let character = try? decoder.decode(Character.self,
                                                from: data) {
            return character
        }
        return nil
    }
}

