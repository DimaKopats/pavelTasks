//
//  ChildClass.swift
//  TestPrivate+Extension
//
//  Created by Dzmitry Kopats on 11/28/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class ChildClass: RootClass {

}

extension RootClass {
    func someExtensionAnotherFileFunc() {
        // have access to only public property
        self.somePublicProp = 2
    }
}
