//
//  MainNavigationViewController.swift
//  Tasks
//
//  Created by Yarr!zzeR on 24/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import UIKit

class MainNavigationViewController: UINavigationController {
    weak var model: MainNavigationViewModelType?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let _model_ = model else { return }
        for vc in self.children {
            if let mainScreenTableVC = vc as? MainScreenTableViewController {
                mainScreenTableVC.model = _model_.getMainScreenViewModel()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("MainNavigationViewController prepare(for segue meth: Mark#1")
        guard let _model_ = model else { return }
        if let mainScreenTableVC = segue.destination as? MainScreenTableViewController {
            print("MainNavigationViewController prepare(for segue meth: Mark#2")
            mainScreenTableVC.model = _model_.getMainScreenViewModel()
        }
        
    }
    */

}
