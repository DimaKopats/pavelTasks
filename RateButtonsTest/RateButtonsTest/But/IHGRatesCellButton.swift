//
//  IHGRatesCellButton.swift
//  IHGBranded-PCR-Universal
//
//  Created by Dzmitry Kopats on 1/25/18.
//  Copyright © 2018 Intercontinental Hotels Group. All rights reserved.
//

import UIKit

class IHGRatesCellButton: UIView, LoadableFromNib {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        setupFromNib()
    }
    
    func configureWith(item: IHGRatesCellButtonItem) {
        print("Need to implement when inherit")
    }
}

protocol LoadableFromNib {
    func loadViewFromNib() -> UIView?
    func setupFromNib()
}

extension LoadableFromNib where Self: UIView {
    func loadViewFromNib() -> UIView? {
        return Bundle.main.loadNibNamed(String(describing: type(of: self)) , owner: self, options: nil)?.first as? UIView
    }
    
    func setupFromNib() {
        guard let view = loadViewFromNib() else { return }
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    func receiverViewFromNib() -> Self? {
        if subviews.count != 0 {
            return self
        }
        
        let nibName = String(describing: Self.self)
        let nibs = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)
        let view = nibs?.first as? Self
        
        view?.frame = frame
        return view
    }
}
