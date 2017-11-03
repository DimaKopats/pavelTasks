//
//  DKCustomRootCell.swift
//  constraints_task1
//
//  Created by Dmitry on 18.10.17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class DKCustomRootCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: fill labels
    
    func customize(titleLabel: UILabel, descriptionLabel: UILabel) {
        let randomNumber = arc4random() % 2
        titleLabel.text = randomNumber == 0 ? "Title 1" : "Title 1 very long long long long long long long long long"
        let randomNumber2 = arc4random() % 2
        descriptionLabel.text = randomNumber2 == 0 ? "Greetings!!!" : "Greetings. I am writing because I discovered a way to improve the taste of decaffeinate"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.tintColor = UIColor.black
        titleLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 15)
        descriptionLabel.textColor = UIColor.darkGray
        descriptionLabel.numberOfLines = 0
    }
    
    func customize(circle: UIView) {
        circle.layer.borderWidth = 2
        circle.layer.cornerRadius = 25
        circle.layer.backgroundColor = UIColor.yellow.cgColor
        circle.layer.borderColor = UIColor.gray.cgColor
    }
}
