//
//  CharactersGetService.swift
//  RickAndMorty
//
//  Created by Denis Khlopin on 04.05.2021.
//

import Moya

class CharactersService {
    typealias CharactersResult = (Result<Characters, RMError>) -> Void

    func getCharacters(page: Int?, completion: @escaping CharactersResult) {

        let provider = MoyaProvider<CharacterProvider>()

        provider.request(.getCharacters(page: page)) { [weak self] result in
            switch result {
            case .success(let response):
                if let characters = self?.decodeCharacters(from: response.data) {
                    completion(.success(characters))
                    return
                }
                completion(.failure(.parse))
            case .failure:
                completion(.failure(.network))
            }
        }
    }

    private func decodeCharacters(from data: Data) -> Characters? {
        let decoder = JSONDecoder()
        if let characters = try? decoder.decode(Characters.self,
                                                from: data) {
            return characters
        }
        return nil
    }
}
