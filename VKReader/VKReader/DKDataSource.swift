//
//  DKDataSource.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/21/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class DKDataSource: NSObject {
    var postModels = [PostModel]()
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
    
    func startDownloading() {
        print("startDownloading")
        loader.getData { (postModels: [PostModel], error: Bool) in
            self.postModels.append(contentsOf: postModels)
            DispatchQueue.main.async {
                // update dataSource
//                self.delegate.updateDataSource(error: error)
            }
        }
    }
}
