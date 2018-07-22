//
//  CharactersViewController.swift
//  Marvel Library
//
//  Created by Juliano Krieger Nardon on 21/07/18.
//  Copyright © 2018 CWI Software. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    let homePresenter = HomePresenter(interactor: HomeInteractor())
    fileprivate var characters = [Character]()
    
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        homePresenter.attachView(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.homePresenter.refreshItems()
    }

    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.characters.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.cellReuseIdentifier, for: indexPath) as! CharacterTableViewCell
        cell.populateCell(with: self.characters[indexPath.item])
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelect \(indexPath.item)")
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if isSearching { return }
//
//        if indexPath.row == movies.count - 3 {
//            homePresenter.paginateSearchQuery()
//        }
    }
    
    //MARK : Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let cell = sender as? CharacterTableViewCell {
            if segue.identifier == "go-to-detail" {
                if let vc = segue.destination as? CharacterDetailViewController {
                    vc.character = cell.character
                }
            }
        }
    }
}

extension HomeViewController: HomeView {
    
    func startLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func finishLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        refreshControl?.endRefreshing()
    }
    
    func setCharacters(characters: [Character], shouldReset: Bool) {
        if shouldReset {
            self.characters = characters
        } else {
            self.characters.append(contentsOf: characters)
        }
        
        
        // Omg, kidding me!
        self.tableView.reloadData()
    }
    
    func setPositiveQueries(queries: [String]) {
//        self.queries = queries
    }
    
    func showAlert(title: String, description: String) {
        let controller = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .default, handler: nil)
        controller.addAction(action)
        navigationController?.present(controller, animated: true, completion: nil)
    }
    
}

