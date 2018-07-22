//
//  CharactersPresenter.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import Foundation

class HomePresenter {
    
    let interactor: HomeInteractor
    weak private var homeView: HomeView?
    
    var page = Page()
    var isPaginating = false

    
    // MARK: - Initialization & Configuration
    
    init(interactor: HomeInteractor) {
        self.interactor = interactor
    }
    
    func attachView(view: HomeView?) {
        guard let view = view else { return }
        homeView = view
    }
    
    // MARK: - Search Methods
    
    func paginateSearchQuery() {
        isPaginating = true
        page.bumpUp()
        search(page: page, shouldReset: false)
    }
    
    /// TableView's refresh event.
    func refreshItems() {
        isPaginating = false
        page.reset()
        search(page: page, shouldReset: true)
    }

    // MARK: - Interactor Access
    
    func search(page: Page, shouldReset: Bool) {
        self.homeView?.startLoading()
        
        interactor.search(page: page, result: { [weak self] characters in

            guard let `self` = self else { return }
            self.homeView?.finishLoading()

            guard characters.count != 0 else {
                self.homeView?.showAlert(title: "No result found", description: "")
                return
            }
            
            self.homeView?.setCharacters(characters: characters, shouldReset: shouldReset)

        }) { [weak self] (error) in

            guard let `self` = self else { return }

            if self.isPaginating && (error.code == 100) { return }

            self.homeView?.finishLoading()
            self.homeView?.showAlert(title: error.title, description: error.description)
        }
    }
    
}
