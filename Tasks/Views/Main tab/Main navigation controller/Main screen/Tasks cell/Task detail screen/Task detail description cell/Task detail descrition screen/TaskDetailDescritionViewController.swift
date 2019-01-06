//
//  TaskDetailDescritionViewController.swift
//  Tasks
//
//  Created by Yarr!zzeR on 17/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TaskDetailDescritionViewController: UIViewController, UITextViewDelegate {

    var model: TaskDetailDescriptionScreenViewModelType?
    
    @IBOutlet weak var descriptionTextView: UITextView! 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.descriptionTextView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        descriptionTextView.delegate = self

        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        keyboardToolbar.barStyle = .black
        
        guard let _model_ = model else { return }
        descriptionTextView.text = _model_.description
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let _model_ = model else { return }
        _model_.updateTaskRecord(withDescription: descriptionTextView.text)
    }

}
