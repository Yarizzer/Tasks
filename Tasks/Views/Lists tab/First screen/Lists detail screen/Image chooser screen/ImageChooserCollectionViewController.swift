//
//  ImageChooserCollectionViewController.swift
//  Tasks
//
//  Created by Yarr!zzeR on 22/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "imageChooserCell"

class ImageChooserCollectionViewController: UICollectionViewController {

    var model: ImageChooserViewModelType?

    
    @IBOutlet weak var colorPaletteBarButton: UIBarButtonItem!
    
    @IBAction func colorPaletteBarButtonAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showColorsPalette", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let _model_ = model, let _identifier_ = segue.identifier  else { return }
        
        if _identifier_ == "showColorsPalette" {
            
            if let dvc = segue.destination as? ColorPaletteTableViewController {
                dvc.model = _model_.getColorPaletteModel()
                dvc.modalPresentationStyle = .popover
                let popOverVC = dvc.popoverPresentationController
                popOverVC?.delegate = self
                popOverVC?.sourceRect = self.colorPaletteBarButton.accessibilityFrame
//                popOverVC?.sourceRect = CGRect(x: 50, y: 50, width: 150, height: 150)
                dvc.preferredContentSize = CGSize(width: 150, height: 200)
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.collectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems(inSection: section)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let _model_ = model, let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ImageChooserCollectionViewCell else { return UICollectionViewCell() }
        
        collectionCell.model = _model_.getImageChooserCellViewModel(forIndex: (indexPath.section * Constants.numberOfItemsInSection) + indexPath.row)

        // Configure the cell
    
        return collectionCell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    */
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let _model_ = model else { return }
        let indexOfImage = selectedItemIndex(indexPath: indexPath)
        _model_.changeImageForList(atIndex: indexOfImage)
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

extension ImageChooserCollectionViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

extension ImageChooserCollectionViewController {
    //Constants
    private struct Constants {
        static let extraSectionCount = 1
        static let numberOfItemsInSection = Int((UIScreen.main.bounds.width - 10) / 80)
    }
    
    private var numberOfSections: Int {
        guard let _model_ = model else { return 0 }
        if _model_.itemsCount % Constants.numberOfItemsInSection > 0 {
            return _model_.itemsCount / Constants.numberOfItemsInSection + Constants.extraSectionCount
        } else {
            return _model_.itemsCount / Constants.numberOfItemsInSection
        }
    }
    
    private func numberOfItems(inSection _section_: Int) -> Int {
        guard let _model_ = model else { return 0 }
        if _section_ == (_model_.itemsCount / Constants.numberOfItemsInSection + 1) - 1 {
            return _model_.itemsCount % Constants.numberOfItemsInSection
        } else {
            return Constants.numberOfItemsInSection
        }
    }
    
    private func selectedItemIndex(indexPath _indexPath_: IndexPath) -> Int {
        return ((_indexPath_.section + 1) * Constants.numberOfItemsInSection) - (Constants.numberOfItemsInSection - _indexPath_.row )
    }
}
