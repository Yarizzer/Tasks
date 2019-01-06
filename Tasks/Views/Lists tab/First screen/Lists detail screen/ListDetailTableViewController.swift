//
//  ListDetailTableViewController.swift
//  Tasks
//
//  Created by Yarr!zzeR on 10/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class ListDetailTableViewController: UITableViewController {
    
    var model: ListDetailViewModelType?
    
    private func showACForListTitle() {
        guard let _model_ = model else { return }
        let ac = UIAlertController(title: NSLocalizedString("Edit list title", comment: "Edit list title"), message: nil, preferredStyle: .alert)
        ac.addTextField { (textField) in
            textField.placeholder = NSLocalizedString("List title", comment: "List title")
            if _model_.listTitle != "<Untitled list>" {
                textField.text = _model_.listTitle
            }
            
            textField.clearButtonMode = .whileEditing
            textField.autocapitalizationType = .sentences
            textField.returnKeyType = .done
        }
        let okAction = UIAlertAction(title: NSLocalizedString("Done", comment: "Done"), style: .default) { [unowned self] action in
            guard let _model_ = self.model, let titleForNewList = ac.textFields![0].text else { return }
            //
            _model_.updateListRecord(withTitle: titleForNewList)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel"), style: .cancel, handler: nil)
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        self.present(ac, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
//        guard let _model_ = model else { return }
//        navigationItem.title = _model_.listTitle
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
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let _model_ = model else { return nil }
        tableView.sectionHeaderHeight = CGFloat(_model_.headerHeight)
        let sectionTitle = _model_.getHeaderTitle(forSection: section)
        return NSLocalizedString(sectionTitle, comment: sectionTitle)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 200
        } else {
            return 40
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let _model_ = model else { return 0 }
        return _model_.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _model_ = model else { return 0 }
        return _model_.numberOfRowsInSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _model_ = model else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            guard let listsTitleCell = tableView.dequeueReusableCell(withIdentifier: "listTitleCell", for: indexPath) as? ListDetailTitleTableViewCell else { return UITableViewCell() }
            listsTitleCell.model = _model_.getListDetailTitleViewModel()
            return listsTitleCell
        case 1:
            guard let listMonitorCell = tableView.dequeueReusableCell(withIdentifier: "listMonitorCell", for: indexPath) as? ListMonitorTableViewCell else { return UITableViewCell() }
            listMonitorCell.model = _model_.getListMonitorCellViewModel()
            return listMonitorCell
        default: return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0: showACForListTitle()
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
        if identifier == "showImageChooser" {
            if let dvc = segue.destination as? ImageChooserCollectionViewController {
                dvc.model = _model_.getImageChooserViewModel()
            }
        }
    }
    
}
