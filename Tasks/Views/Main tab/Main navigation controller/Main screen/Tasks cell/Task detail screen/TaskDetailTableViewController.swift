//
//  TaskDetailTableViewController.swift
//  Tasks
//
//  Created by Yarr!zzeR on 12/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    var model: TaskDetailViewModelType?
    
    private func showACForTaskTitle() {
        guard let _model_ = model else { return }
        let ac = UIAlertController(title: NSLocalizedString("Edit Task title", comment: "Edit Task title"), message: nil, preferredStyle: .alert)
        ac.addTextField { (textField) in
            textField.placeholder = NSLocalizedString("Task title", comment: "Task title")
            if _model_.taskTitle != "<Untitled task>" {
                textField.text = _model_.taskTitle
            }
            textField.clearButtonMode = .whileEditing
            textField.autocapitalizationType = .sentences
            textField.returnKeyType = .done
        }
        let okAction = UIAlertAction(title: NSLocalizedString("Done", comment: "Done"), style: .default) { [unowned self] action in
            guard let _model_ = self.model, let titleForNewTask = ac.textFields![0].text else { return }
            //
            _model_.updateTaskRecord(withTitle: titleForNewTask)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel"), style: .cancel, handler: nil)
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        self.present(ac, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        self.tableView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
//        guard let _model_ = model else { return }
        
//        navigationItem.title = _model_.taskTitle
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let _model_ = model else { return 0 }
        return CGFloat(_model_.sectionHeight)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let _model_ = model else { return "" }
        return _model_.getSectionTitle(forSection: section)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let _model_ = model else { return 0 }
        return _model_.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let _model_ = model else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            guard let titleCell = tableView.dequeueReusableCell(withIdentifier: "taskTitleCell", for: indexPath) as? TaskDetailTitleTableViewCell else { return UITableViewCell() }
            titleCell.model = _model_.getTaskDetailTitleCellViewModel()
            
            return titleCell
        case 1:
            guard let importanceCell = tableView.dequeueReusableCell(withIdentifier: "taskImportanceCell", for: indexPath) as? TaskDetailImportanceTableViewCell else { return UITableViewCell() }
            importanceCell.model = _model_.getTaskDetailImportanceCellViewModel()
            
            return importanceCell
        case 2:
            guard let descriptionCell = tableView.dequeueReusableCell(withIdentifier: "taskDescriptionCell") as? TaskDetailDescriptionTableViewCell else { return UITableViewCell() }
            descriptionCell.model = _model_.getTaskDetailDescriptionCellViewModel()
            
            return descriptionCell
        case 3:
            guard let dueDateCell = tableView.dequeueReusableCell(withIdentifier: "taskDueDateCell") as? TaskDetailDueDateTableViewCell else { return UITableViewCell() }
            dueDateCell.model = _model_.getTaskDetailDueDateCellViewModel()
            
            return dueDateCell
        case 4:
            guard let listCell = tableView.dequeueReusableCell(withIdentifier: "taskListCell") as? TaskDetailListTableViewCell else { return UITableViewCell() }
            listCell.model = _model_.getTaskDetailListCellViewModel()
            
            return listCell
        default: return UITableViewCell()
        }
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0: showACForTaskTitle()
        case 1: print("TaskDetailTableViewController didSelectRowAt indexPath meth: selected section index - 1")
        case 2: performSegue(withIdentifier: "showTaskDescriptionVC", sender: self)
        case 3: performSegue(withIdentifier: "setDueDate", sender: self)
        case 4: performSegue(withIdentifier: "showListsForTask", sender: self)
        default: break
        }
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let _model_ = model, let identifier = segue.identifier else { return }
        
        if identifier == "showTaskDescriptionVC" {
            if let dvc = segue.destination as? TaskDetailDescritionViewController {
                dvc.model = _model_.getTaskDetailDescriptionScreenViewModel()
            }
        } else if identifier == "setDueDate" {
            if let dvc = segue.destination as? TaskDetailDueDateSetupViewController {
                dvc.model = _model_.getTaskDetailDueDateSetupScreenViewModel()
            }
        } else if identifier == "showListsForTask" {
            if let dvc = segue.destination as? TaskDetailListsViewController {
                dvc.model = _model_.getTaskDetailListsViewModel()
            }
        }
    }
    

}
