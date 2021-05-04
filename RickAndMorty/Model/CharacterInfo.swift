//
//  CharacterInfo.swift
//  RickAndMorty
//
//  Created by Denis Khlopin on 04.05.2021.
//

import Foundation

struct CharactersInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
