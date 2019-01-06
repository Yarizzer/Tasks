//
//  TaskDetailListsTableViewController.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TaskDetailListsViewController: UITableViewController {

    var model: TaskDetailListsViewModelType?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _model_ = model else { return 0 }
        return _model_.numberOfLists
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _model_ = model,
            let _cell_ = tableView.dequeueReusableCell(withIdentifier: "taskDetailListsCell", for: indexPath) as? TaskDetailListChooserTableViewCell else { return UITableViewCell() }

        _cell_.model = _model_.getTaskDetailListChooserCellModel(forIndex: indexPath.row)

        
        return _cell_
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _model_ = model else { return }
        _model_.updateCurrentIndex(withIndex: indexPath.row)
        _model_.changeTaskList()
        
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
