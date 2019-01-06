//
//  ColorPaletteTableViewController.swift
//  Tasks
//
//  Created by Yarr!zzeR on 26/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class ColorPaletteTableViewController: UITableViewController {

    var model: ListDetailColorPletteModelType?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let _model_ = model else { return 0 }
        return _model_.numberOfColors
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _model_ = model, let colorPaletteCell = tableView.dequeueReusableCell(withIdentifier: "colorPaletteCell", for: indexPath) as? ListColorPaletteTableViewCell else { return UITableViewCell()}
        
            colorPaletteCell.model = _model_.getColorPaletteCellModel(forIndex: indexPath.row)
            return colorPaletteCell
  
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _model_ = model else { return }
        _model_.setNewColorIndex(withValue: indexPath.row)
        self.dismiss(animated: true, completion: nil)
    }

}
