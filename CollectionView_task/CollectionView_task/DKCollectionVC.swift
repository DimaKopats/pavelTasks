//
//  DKCollectionVC.swift
//  CollectionView_task
//
//  Created by Dmitry on 02.11.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit


class DKCollectionVC: UICollectionViewController {
    
    private let reuseIdentifier = "DKCell"
    fileprivate let itemsPerRow: CGFloat = 3
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    var circularMode = false
    let squareLayout = UICollectionViewFlowLayout()
    let circularLayout = CircularWithoutRotateCollectionViewLayout()
    let buttonForNaviBar = UIButton(type: .roundedRect)
    
    @IBOutlet var modeButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeButtonWith(image: #imageLiteral(resourceName: "round"))
        self.navigationItem.rightBarButtonItem?.customView = buttonForNaviBar

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.collectionView?.register(UINib.init(nibName: "DKCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }

    override var shouldAutorotate: Bool {
        self.collectionView?.setCollectionViewLayout(self.collectionViewLayout, animated: true)

        print("shouldAutorotate")
        
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: modeButton

    @IBAction func modeButtonTapped(_ sender: Any) {
        var imageForButton: UIImage
        if circularMode {
            imageForButton = #imageLiteral(resourceName: "round")
            print("go to square mode")
            self.collectionView?.setCollectionViewLayout(self.squareLayout, animated: true)
        } else {
            imageForButton = #imageLiteral(resourceName: "square")
            print("go to rounded mode")
            self.collectionView?.setCollectionViewLayout(self.circularLayout, animated: true)
        }
        
        imageForButton = imageForButton.withRenderingMode(.alwaysTemplate)
        buttonForNaviBar.setBackgroundImage(imageForButton, for: UIControlState.normal)
        self.navigationItem.rightBarButtonItem?.customView = buttonForNaviBar
        circularMode = !circularMode
    }
    
    func customizeButtonWith(image: UIImage) {
        buttonForNaviBar.frame.size = CGSize.init(width: 10, height: 10)
        buttonForNaviBar.setBackgroundImage(image.withRenderingMode(.alwaysTemplate), for: UIControlState.normal)
        buttonForNaviBar.addTarget(self, action: #selector(modeButtonTapped(_:)), for: .touchUpInside)
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
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

// MARK: for rotate to all modes

extension UINavigationController {
    
    override open var shouldAutorotate: Bool {
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.shouldAutorotate
            }
            return super.shouldAutorotate
        }
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.preferredInterfaceOrientationForPresentation
            }
            return super.preferredInterfaceOrientationForPresentation
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            if let visibleVC = visibleViewController {
                return visibleVC.supportedInterfaceOrientations
            }
            return super.supportedInterfaceOrientations
        }
    }}

// MARK: UICollectionViewDelegateFlowLayout

extension DKCollectionVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = UIScreen.main.bounds.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
//        print("For cell (\(indexPath.section),\(indexPath.row) w = \(UIScreen.main.bounds.width), h = \(UIScreen.main.bounds.height)")
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
