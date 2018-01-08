//
//  DataSource.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/21/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit
import CoreData

class DataSource: NSObject {
    var delegate: UpdateDataSourceProtocol?
    var models = [Model]()
    let loader: DataLoader
    
    override init() {
        let tokenManager = TokenManager()
        if let accessToken = tokenManager.getToken() {
            self.loader = DataLoader.init(usingToken: accessToken)
        } else {
            print("without a token does not make sense")
            self.loader = DataLoader.init(usingToken: "")
        }
    }
    
    func startDownloading(completionHandler: @escaping () -> ()) {
        print("startDownloading")
        print("in core data now \(CoreDataManager.instance.entityArray.count) posts")
        
        if Reachability.isConnectedToNetwork() {
            print("Internet connection OK")
            loader.getData{[unowned self] (models: [Model], error: Bool) in
                //вызовется после обработки результата и у нас есть массив моделей на этот момент
                print("when call completionHandler")
                self.models.append(contentsOf: models)
                DispatchQueue.main.async {
                    completionHandler()
                    // update dataSource
                    self.delegate?.updateDataSource(error: false)
                }
                
                // save input models to core data
                CoreDataManager.instance.save(models: models)
            }
        } else {
            print("Internet connection FAILED")
            self.models.append(contentsOf: CoreDataManager.instance.getModelsFromCoreData())
        }
    }
    

}
