//
//  FirstScreenTableViewController.swift
//  Tasks
//
//  Created by Yarr!zzeR on 02/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class ListsTableViewController: UITableViewController {
    
    var model: ListsScreenViewModelType?

    private func updateCurrentIndexInModel(forIndexPath _indexPath_: IndexPath) {
        guard let _model_ = model else { return }
        _model_.updateListsCurrentIndex(withIndex: _indexPath_.row)
    }
    

    @IBAction func addNewListAction(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: NSLocalizedString("Add new list", comment: "Add new list"), message: NSLocalizedString("Use lists to group tasks", comment: "Use lists to group tasks"), preferredStyle: .alert)
        ac.addTextField { (textField) in
            textField.placeholder = NSLocalizedString("List title", comment: "List title")
            textField.clearButtonMode = .whileEditing
            textField.autocapitalizationType = .sentences
            textField.returnKeyType = .done
        }
        let okAction = UIAlertAction(title: NSLocalizedString("Done", comment: "Done"), style: .default) { [unowned self] action in
            guard let _model_ = self.model, let titleForNewList = ac.textFields![0].text else { return }
            //
            _model_.addNewListInDatabase(withTitle: titleForNewList)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel"), style: .cancel, handler: nil)
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        self.present(ac, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let listsImageView = UIImageView(image: UIImage(named: "ListsScreenFullImage"))
        listsImageView.contentMode = .scaleAspectFit
        self.tableView.backgroundView = listsImageView
        self.tableView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let _model_ = model else { return }
        _model_.updateListsArray()
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let _model_ = model else { return 0 }
        return CGFloat(_model_.headerHeight)
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _model_ = model else { return 0 }
        return _model_.numberOfLists()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _model_ = model else { return UITableViewCell() }
        guard let listsCell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListsTableViewCell else { return UITableViewCell()}
            
        listsCell.model = _model_.getListCellViewModel(forIndex: indexPath.row)
        return listsCell

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateCurrentIndexInModel(forIndexPath: indexPath)
    
        performSegue(withIdentifier: "showListDetail", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        updateCurrentIndexInModel(forIndexPath: indexPath)
        
        let deleteAction = UITableViewRowAction(style: .normal, title: NSLocalizedString("Move to trash", comment: "Move to trash")) { [unowned self] (action, IndexPath) in
            guard let _model_ = self.model else { return }
            if _model_.preferredList(withIndex: indexPath.row) {
                let ac = UIAlertController(title: NSLocalizedString("List is preferred", comment: "List is preferred"), message: NSLocalizedString("To delete this list choose another one as 'preferred' first.", comment: "To delete this list choose another one as 'preferred' first."), preferredStyle: .actionSheet)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                ac.addAction(okAction)
                
                self.present(ac, animated: true, completion: nil)
            } else {
                _model_.moveListRecordToTrash()
                if _model_.numberOfLists() != 1 {
                    tableView.deleteRows(at: [indexPath], with: .right)
                } else {
//                    tableView.deleteRows(at: [indexPath], with: .right)
                    tableView.reloadData()
                }
            }
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        return [deleteAction]
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let _model_ = model, let identifier = segue.identifier else { return }
        
        if identifier == "showListDetail" {
            if let dvc = segue.destination as? ListDetailTableViewController {
                dvc.model = _model_.getListDetailViewModel()
            }
        }
    }
    

}
