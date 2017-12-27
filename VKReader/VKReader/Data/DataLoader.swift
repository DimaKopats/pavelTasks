//
//  DataLoader.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/21/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import Foundation

class DataLoader {
    let parser = Parser()
    let token: String
    let session = URLSession(configuration: .default)
    var next_from: String?
    
    init(usingToken token: String) {
        self.token = token
    }
    
    func getData(completionHandler: @escaping  (_ models: [Model], _ error:Bool) -> ()) {
        let url = URLBuilder.createURLFeed(token: self.token, countPosts: 20, after: next_from)
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            // данный блок стартyет когда придет ответ от сервера
            DispatchQueue.global(qos: .userInitiated).async {
                print("start parsing")
                var models = [Model]()
                if let notNilData = data {
                    models = self.parser.parseFeedFrom(data: notNilData)
                    self.next_from = self.parser.parseNextFrom(data: notNilData)
                }
                
                print("complete parsing")
                let error = models.isEmpty
                
                print("before call completionHandler")
                completionHandler(models, error)
            }
        }
        task.resume()
    }
}
