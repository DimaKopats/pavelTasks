//
//  PVinAppBannerHtml1.swift
//  Privalia
//
//  Created by Ivan Ruiz Monjo on 11/7/17.
//  Copyright © 2017 Privalia. All rights reserved.
//

import Foundation
import UIKit
import WebKit

final class PVinAppBannerHtml1: UIView {
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var webView: WKWebView!
    
    static var height: CGFloat { return isIpad ? 130 : 108 }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        closeButton.alignLabelRespectToImage(.left, spacing: 10)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if webView.frame.contains(point) || closeButton.frame.contains(point) {
            let hitView = super.hitTest(point, with: event)
            return hitView
        }
        return closeButton
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if frame.size.height != PVinAppBannerHtml1.height {
            frame = CGRect(x: 0,
                           y: frame.origin.y,
                           width: UIScreen.main.bounds.width,
                           height: PVinAppBannerHtml1.height)
        }
    }
    
}

