//
//  NewsTableViewCell.swift
//  NewsCoreData
//
//  Created by Kopats, Dzmitry(AWF) on 11/3/18.
//  Copyright © 2018 Kopats, Dzmitry(AWF). All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var viewCount: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var previewText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(post: ShortPost) {
        viewCount.text = String(post.viewCount)
        title.text = post.title
        date.text = post.date?.toString()
        previewText.text = post.previewText
    }
}
