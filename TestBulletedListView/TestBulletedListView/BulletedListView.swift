//
//  BulletedListView.swift
//  TestBulletedListView
//
//  Created by Dzmitry Kopats on 1/26/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import UIKit

class BulletedListView: UIView {
    
    var stringList = [String]()
    
    func configureWith(list: [String]) {
        self.stringList = list
        self.createStackViewWith(list: list)
    }
    
    func createStackViewWith(list: [String]) {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.backgroundColor = UIColor.magenta
        
        //        stack.spacing = 5
        
        for stringOfList in stringList {
            let label = UILabel.init()
            label.text = stringOfList
            label.numberOfLines = 0
            // font
            
            if stringOfList == stringList.first {
                label.font = UIFont.boldSystemFont(ofSize: 12)
            } else {
                label.font = UIFont.systemFont(ofSize: 12)
            }
            stack.addArrangedSubview(label)
        }
        self.addSubview(stack)
        stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
    }
}
