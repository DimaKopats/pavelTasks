//
//  DKDataSource.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/21/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class DKDataSource: NSObject {
    var delegate: UpdateDataSourceProtocol?
    var models = [Model]()
    let loader: DKDataLoader
    let accessToken: String?
    
    override init() {
        self.accessToken = UserDefaults.standard.string(forKey: "token")
        if let token = self.accessToken {
            print("token =            \(token)")
            self.loader = DKDataLoader.init(usingToken: token)
        } else {
            self.loader = DKDataLoader()
        }
    }
    
    func startDownloading(completionHandler: @escaping () -> ()) {
        print("startDownloading")
        loader.getData{[unowned self] (models: [Model], error: Bool) in
            //вызовется после обработки результата и унас есть массив моделей на этот момент
            print("when call completionHandler")
            print("count1 = \(self.models.count)")
            self.models.append(contentsOf: models)
            print("count2 = \(self.models.count)")
            DispatchQueue.main.async {
                completionHandler()
                // update dataSource
                self.delegate?.updateDataSource(error: false)
            }
        }
    }
}
