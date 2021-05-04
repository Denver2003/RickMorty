//
//  CharactersAssembler.swift
//  RickAndMorty
//
//  Created by Denis Khlopin on 04.05.2021.
//

import UIKit

fileprivate let storyboardIdentifier = "Characters"
fileprivate let charactersIdentifier = "CharactersViewController"

class CharactersAssembler {

    func assembly() -> CharactersViewController {
        let controller = getControllerFromStoryboard()
        let router = CharactersRouter()
        let viewModel = CharactersViewModel(router: router)
        controller.viewModel = viewModel
        return controller
    }

    private func getControllerFromStoryboard() -> CharactersViewController {
        let storyboard = UIStoryboard(name: storyboardIdentifier, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: charactersIdentifier)

        guard let charactersController = controller as? CharactersViewController else {
            fatalError("Unable to get initial UIViewController!")
        }
        return charactersController
    }
}
