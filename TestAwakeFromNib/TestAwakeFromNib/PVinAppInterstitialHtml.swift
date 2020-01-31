//
//  PVinAppInterstitialHtml.swift
//  Privalia
//
//  Created by Ivan Ruiz Monjo on 10/7/17.
//  Copyright © 2017 Privalia. All rights reserved.
//

import UIKit
import Foundation
import WebKit

final class PVinAppInterstitialHtml: UIView {
    
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var webView: WKWebView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(PVinAppInterstitialHtml.didTapOutside))
        bgView.addGestureRecognizer(tapGR)
//        closeButton.alignLabelRespectToImage(.left, spacing: 10)
        bgView.alpha = 0
    }
    
    @objc func didTapOutside(_ tap: UITapGestureRecognizer) {
        closeButton.sendActions(for: UIControl.Event.touchUpInside)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if webView.frame.contains(point) {
            let hitView = super.hitTest(point, with: event)
            return hitView
        }
        return closeButton
    }

}
