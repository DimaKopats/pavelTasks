//
//  Models.swift
//  MVVM_Test
//
//  Created by Dzmitry Kopats on 3/12/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import Foundation
import UIKit

protocol AppearanceModelType {
    var backgroundColor: UIColor { get }
    var titleColor: UIColor { get }
}

extension AppearanceModelType {
    var backgroundColor: UIColor {
        return .white
    }
    var titleColor: UIColor {
        return .black
    }
}

struct NightModel: AppearanceModelType {
    var backgroundColor: UIColor {
        return .black
    }
    var titleColor: UIColor {
        return .white
    }
}

struct GrassModel: AppearanceModelType {
    var backgroundColor: UIColor {
        return .green
    }
}

struct ViewControllerCoordinatorModel {
    private(set) var coordinatorDidUpdateAppearanceModelBlock: (_ model: AppearanceModelType) -> ()
    init(coordinatorDidUpdateAppearanceModelBlock: @escaping (_ model: AppearanceModelType) -> ()) {
        self.coordinatorDidUpdateAppearanceModelBlock = coordinatorDidUpdateAppearanceModelBlock
    }
    
    func selectSegment(index: Int) {
        switch index {
        case 0:
            coordinatorDidUpdateAppearanceModelBlock(GrassModel())
        case 1:
            coordinatorDidUpdateAppearanceModelBlock(NightModel())
        default:
            print("wrong case")
        }
    }
}

