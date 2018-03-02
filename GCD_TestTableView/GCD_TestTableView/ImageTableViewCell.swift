//
//  ImageTableViewCell.swift
//  GCD_TestTableView
//
//  Created by Dzmitry Kopats on 2/21/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var tImage: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var imageURL: URL? {
        didSet {
            tImage.image = nil
            updateUI()
        }
    }
    
    private func updateUI() {
        if let url = imageURL {
            spinner.startAnimating()
            self.spinner.isHidden = false
            DispatchQueue.global(qos: .userInitiated).async {
                let contenctsOfURL = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if url == self.imageURL {
                        if let imageData = contenctsOfURL {
                            self.tImage.image = UIImage(data: imageData)
                        }
                        self.spinner.stopAnimating()
                        self.spinner.isHidden = true
                    }
                }
            }
        }
    }
    
}
