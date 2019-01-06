//
//  TrashNavigationViewController.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TrashNavigationViewController: UINavigationController {

    weak var model: TrashNavigationViewModelType?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let _model_ = model else { return }
        for vc in self.children {
            if let trashTableVC = vc as? TrashTableViewController {
                trashTableVC.model = _model_.getTrashScreenViewModel()
            }
        }
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
