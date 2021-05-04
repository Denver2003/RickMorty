//
//  CharactersRouter.swift
//  RickAndMorty
//
//  Created by Denis Khlopin on 04.05.2021.
//

import UIKit



class CharactersRouter {
    static func createModule(window: UIWindow) {
        let assembler = CharactersAssembler()
        let charactersController = assembler.assembly()
        let navController = UINavigationController(rootViewController: charactersController)
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
}
