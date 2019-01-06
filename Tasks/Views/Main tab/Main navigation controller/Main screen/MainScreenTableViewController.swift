//
//  MainScreenTableViewController.swift
//  Tasks
//
//  Created by Yarr!zzeR on 08/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class MainScreenTableViewController: UITableViewController {

    var model: MainScreenViewModelType?
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }
    
    @IBAction func addTaskAction(_ sender: UIBarButtonItem) {
        guard let _model_ = model else { return }
        _model_.updateCurrentIndex(withIndex: nil)
        _model_.updateCurrentIndexForFilteredItems(withIndex: nil)
        performSegue(withIdentifier: "showTaskDetail", sender: nil)
    }
    
    private func updateCurrentIndexInModel(forIndexPath _indexPath_: IndexPath) {
        guard let _model_ = model else { return }
        if isFiltering() {
            _model_.updateCurrentIndexForFilteredItems(withIndex: _indexPath_.row)
        } else {
            _model_.updateCurrentIndex(withIndex: _indexPath_.row)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let _model_ = model else { return }
        let mainImageView = UIImageView(image: UIImage(named: "MainScreenFullImage"))
        mainImageView.contentMode = .scaleAspectFit
        self.tableView.backgroundView = mainImageView
        self.tableView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search tasks"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        searchController.searchBar.scopeButtonTitles = _model_.getScopeNames()
        
        searchController.searchBar.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let _model_ = model else { return }
        _model_.updateTasks()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _model_ = model else { return 0 }
        if isFiltering() {
            return _model_.filteredTasksCount
        } else {
            return _model_.tasksCount
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _model_ = model,
            let _cell_ = tableView.dequeueReusableCell(withIdentifier: "tasksCell", for: indexPath) as? TasksTableViewCell else { return UITableViewCell() }
        if isFiltering() {
            _cell_.model = _model_.getFilteredTasksCellModel(forIndex: indexPath.row)
        } else {
            _cell_.model = _model_.getTasksCellModel(forIndex: indexPath.row)
        }
        
        return _cell_
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateCurrentIndexInModel(forIndexPath: indexPath)
        
        performSegue(withIdentifier: "showTaskDetail", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        updateCurrentIndexInModel(forIndexPath: indexPath)
        
        let deleteAction = UITableViewRowAction(style: .normal, title: NSLocalizedString("Move to trash", comment: "Move to trash")) { [unowned self] (action, IndexPath) in
            guard let _model_ = self.model else { return }
            _model_.moveTaskRecordToTrash()
            tableView.deleteRows(at: [indexPath], with: .right)
//            tableView.reloadData()
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        return [deleteAction]
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let _model_ = model, let identifier = segue.identifier else { return }
        
        if identifier == "showTaskDetail" {
            if isFiltering() {
                if let dvc = segue.destination as? TaskDetailTableViewController {
                    dvc.model = _model_.getTaskDetailViewModelForFilteredItems()
                }
            } else {
                if let dvc = segue.destination as? TaskDetailTableViewController {
                    dvc.model = _model_.getTaskDetailViewModel()
                }
            }
            
        }
    }
}

extension MainScreenTableViewController: UISearchBarDelegate, UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: SearchControllerViewController) {
        guard let model = model else { return }
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = "\(searchController.searchBar.text!)"
        model.updateFilteredTasks(withText: searchText, scope: scope)
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let _model_ = model else { return }
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = "#\(searchController.searchBar.text!)"
        _model_.updateFilteredTasks(withText: searchText, scope: scope)
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        guard let _model_ = model else { return }
        let searchText = "#\(searchController.searchBar.text!)"
        _model_.updateFilteredTasks(withText: searchText, scope: searchBar.scopeButtonTitles![selectedScope])
        tableView.reloadData()
        
    }
}
