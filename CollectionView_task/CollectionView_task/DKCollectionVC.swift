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
    var roundedMode = false
    
    @IBOutlet var modeButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.collectionView?.register(UINib.init(nibName: "DKCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        print("supportedInterfaceOrientations")
        return UIInterfaceOrientationMask.all
    }

    override var shouldAutorotate: Bool {
//        print("shouldAutorotate")
        return true
    }
    
    
    
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        print("traitCollectionDidChange")
//        let horizontalSizeClass = traitCollection.horizontalSizeClass
//        let verticalSizeClass = traitCollection.verticalSizeClass
//
//        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
//            setConstraintsForiPad()
//        } else if verticalSizeClass == .compact {
//            setConstraintsForLandscape()
//        } else if horizontalSizeClass == .compact && verticalSizeClass == .regular {
//            setConstraintsForPortrait()
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        if roundedMode {
            imageForButton = #imageLiteral(resourceName: "round")
    
            print("go to square mode")
        } else {
            imageForButton = #imageLiteral(resourceName: "square")
            print("go to rounded mode")
        }
        modeButton = UIBarButtonItem(image:imageForButton,
                                          style: .plain,
                                          target: self,
                                          action: #selector(modeButtonTapped(_:)))
        
//        var button = UIButton(type: .roundedRect)
//        button.frame.size = CGSize.init(width: 10, height: 10)
//        button.setBackgroundImage(imageForButton, for: UIControlState.normal)
//        modeButton.customView = button
        
        self.navigationItem.rightBarButtonItem = modeButton
        roundedMode = !roundedMode
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
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
    
    // MARK: Customize cell
    
//    func createRandomColor() -> (UIColor) {
//        let rand1:CGFloat = ((CGFloat)(arc4random() % 256))/255
//        let rand2:CGFloat = ((CGFloat)(arc4random() % 256))/255
//        let rand3:CGFloat = ((CGFloat)(arc4random() % 256))/255
//        
//        let color = UIColor.init(red: rand1,
//                                 green: rand2,
//                                 blue: rand3,
//                                 alpha: 1)
//        return color
//    }


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
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
