//
//  TaskDetailDueDateSetupViewController.swift
//  Tasks
//
//  Created by Yarr!zzeR on 18/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class TaskDetailDueDateSetupViewController: UIViewController {

    var model: TaskDetailDueDateSetupViewModelType?
    
    var locale: Locale?
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    @IBOutlet weak var activationSwitcher: UISwitch!
    
    @IBAction func activationSwitcherAction(_ sender: UISwitch) {
        guard let _model_ = model else { return }
        
        if activationSwitcher.isOn {
            _model_.setNotification()
            changeHiddenState(forDatePicker: dueDatePicker)
        } else {
            changeHiddenState(forDatePicker: dueDatePicker)
        }
//
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        setupViewProperties()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let _model_ = model else { return }
        let dateToSave = activationSwitcher.isOn ? dueDatePicker.date.zeroSeconds : nil
        _model_.updateTaskRecord(withDueDate: dateToSave)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func setupViewProperties() {
        locale = Locale(identifier: "ru_RU")
        dueDatePicker.locale = locale
        guard let _model_ = model else { return }
        if let _dueDate_ = _model_.dueDate {
            activationSwitcher.isOn = true
            dueDatePicker.isEnabled = true
//            dueDatePicker.isHidden = false
//            dueDatePicker.alpha = 1
            dueDatePicker.date = _dueDate_
        } else {
            activationSwitcher.isOn = false
            dueDatePicker.isEnabled = false
//            dueDatePicker.isHidden = true
//            dueDatePicker.alpha = 0
        }
    }
    
    private func changeHiddenState(forDatePicker _datePicker_: UIDatePicker) {
        UIView.transition(with:_datePicker_, duration: 1, options: [.curveEaseInOut, .allowUserInteraction], animations: {
            _datePicker_.isEnabled = !_datePicker_.isEnabled

        })
    }

}

extension Date {
    var zeroSeconds: Date? {
        get {
            let calender = Calendar.current
            let dateComponents = calender.dateComponents([.year, .month, .day, .hour, .minute], from: self)
            return calender.date(from: dateComponents)
        }
    }
}
