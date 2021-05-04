//
//  Character.swift
//  RickAndMorty
//
//  Created by Denis Khlopin on 04.05.2021.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
