//
//  TrashTableViewController.swift
//  Tasks
//
//  Created by Yarr!zzeR on 23/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TrashTableViewController: UITableViewController {

    var model: TrashScreenViewModelType?
    
    private func updateCurrentIndexInModel(forIndexPath _indexPath_: IndexPath) {
        guard let _model_ = model else { return }
        _model_.updateCurrentIndex(withIndex: _indexPath_.row)
    }
    
    private func setNavigationItem() {
        guard let _model_ = model else { return }
        if _model_.tasksCount == 0 {
            self.navigationItem.title = NSLocalizedString("Trash is empty", comment: "Trash is empty")
        } else {
            self.navigationItem.title = NSLocalizedString("Trash", comment: "Trash")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let trashImageView = UIImageView(image: UIImage(named: "TrashScreenFullImage"))
        trashImageView.contentMode = .scaleAspectFit
        self.tableView.backgroundView = trashImageView
        self.tableView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
//        tableView.tableFooterView = UIView(frame: .zero)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let _model_ = model else { return }
        _model_.updateTasks()
        setNavigationItem()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _model_ = model else { return 0 }
        return _model_.tasksCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _model_ = model,
            let _cell_ = tableView.dequeueReusableCell(withIdentifier: "trashCell", for: indexPath) as? TrashTableViewCell else { return UITableViewCell() }
        
        _cell_.model = _model_.getTrashCellViewModel(forIndex: indexPath.row)
        
        return _cell_
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        updateCurrentIndexInModel(forIndexPath: indexPath)
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: NSLocalizedString("Delete", comment: "Delete")) { [unowned self] (action, indexPath) in
            guard let _model_ = self.model else { return }
            _model_.removeTaskFromDatabase()
            tableView.deleteRows(at: [indexPath], with: .right)
            self.setNavigationItem()
            //            tableView.reloadData()
        }
        
        let removeFromTrashAction = UITableViewRowAction(style: .normal, title: NSLocalizedString("Put back", comment: "Put back")) { [unowned self] (action, indexPath) in
            guard let _model_ = self.model else { return }
            _model_.putTaskBack()
            tableView.deleteRows(at: [indexPath], with: .right)
            self.setNavigationItem()
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        removeFromTrashAction.backgroundColor = #colorLiteral(red: 0, green: 0.9938529134, blue: 1, alpha: 1)
        return [deleteAction, removeFromTrashAction]
    }

}
