//
//  ViewController.swift
//  dynamic_stack_view
//
//  Created by Dmitry on 01.11.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup scrollview
        let insets = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Action Methods
    
    @IBAction func addEntry(_ sender: Any) {
        
        let stack = stackView
        let index = stack!.arrangedSubviews.count - 1
        let addView = stack!.arrangedSubviews[index]
        
        let scroll = scrollView
        let offset = CGPoint(x: scroll!.contentOffset.x,
                             y: scroll!.contentOffset.y + addView.frame.size.height)
        
        let newView = createEntry()
        newView.isHidden = true
        stack!.insertArrangedSubview(newView, at: index)
        
        UIView.animate(withDuration: 0.25) {
            newView.isHidden = false
            scroll!.contentOffset = offset
        }
    }
    
    func deleteStackView(sender: UIButton) {
        if let view = sender.superview {
            UIView.animate(withDuration: 0.25, animations: {
                view.isHidden = true
            }, completion: { (success) -> Void in
                view.removeFromSuperview()
            })
        }
    }
    
    // MARK: - Private Methods
    private func createEntry() -> UIView {
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
        let number = "\(randomHexQuad())-\(randomHexQuad())-\(randomHexQuad())-\(randomHexQuad())"
        
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .firstBaseline
        stack.distribution = .fill
        stack.spacing = 8
        
        let dateLabel = UILabel()
        dateLabel.text = date
        dateLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        
        let deleteButton = UIButton(type: .roundedRect)
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.addTarget(self, action: #selector(ViewController.deleteStackView), for: .touchUpInside)
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(numberLabel)
        stack.addArrangedSubview(deleteButton)
        
        return stack
    }
    
    private func randomHexQuad() -> String {
        return NSString(format: "%X%X%X",
                        arc4random() % 16,
                        arc4random() % 16,
                        arc4random() % 16
            ) as String
    }
    
}

