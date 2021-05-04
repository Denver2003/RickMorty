//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Denis Khlopin on 04.05.2021.
//

import RxSwift

class CharactersViewModel {
    private let router: CharactersRouter

    var characters = [Character]()
    let loadingObserver = BehaviorSubject<Bool>(value: false)
    let reloadDataObserver = PublishSubject<Bool>()
    let errorObserver = PublishSubject<RMError?>()
    var isLoading: Bool {
        (try? loadingObserver.value()) ?? false
    }
    private var page: Int?
    private var charactersService: CharactersService?

    init(router: CharactersRouter) {
        self.router = router
    }

    func viewIsInit() {
        fetchFirst()
    }

    func fetchFirst() {
        if isLoading {
            return
        }
        page = nil
        fetchCharacters()
    }

    func fetchNext() {
        if isLoading {
            return
        }

        page = (page ?? 1) + 1
        fetchCharacters()
    }

    private func fetchCharacters() {
        loadingObserver.onNext(true)
        charactersService = CharactersService()
        charactersService?.getCharacters(page: page) { [weak self] (result) in
            guard let self = self else {
                return
            }
            self.loadingObserver.onNext(false)
            switch result {
            case .success(let newCharacters):
                self.updateCharacters(newCharacters)
            case .failure(let error):
                self.errorObserver.onNext(error)
            }
        }
    }

    private func updateCharacters(_ characters: Characters) {
        let newCharacters = characters.results
        self.characters.append(contentsOf: newCharacters)
        reloadDataObserver.onNext(true)
    }
}
