//
//  RootClass.swift
//  TestPrivate+Extension
//
//  Created by Dzmitry Kopats on 11/28/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class RootClass {
    fileprivate var someFilePrivateProp = 1
    private var somePrivateProp = 1
    public var somePublicProp = 1
}

extension RootClass {
    func someExtensionFunc() {
        // have access to all properties
        self.someFilePrivateProp = 2
        self.somePrivateProp = 2
        self.somePublicProp = 2
    }
}

