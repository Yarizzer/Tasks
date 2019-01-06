//
//  ListsNavigationViewController.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class ListsNavigationViewController: UINavigationController {
    weak var model: ListsNavigationViewModelType?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let _model_ = model else { return }
        for vc in self.children {
            if let listsScreenTableVC = vc as? ListsTableViewController {
                listsScreenTableVC.model = _model_.getListsScreenViewModel()
            }
        }
        // Do any additional setup after loading the view.
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
