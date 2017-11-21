//
//  DKDataLoader.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/21/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class DKDataLoader {
    let parser = Parser()
    let token: String
    let session = URLSession(configuration: .default)
    
    init(usingToken token: String) {
        self.token = token
    }
    
    init() {
        self.token = ""
        print("without a token does not make sense")
    }
    
    func getData(completionHandler:@escaping (_ postModels: [PostModel], _ error:Bool) -> ()) {
        let queryString = "https://api.vk.com/method/newsfeed.get?count=1&access_token=\(self.token)"
        let url = URL(string: queryString)
        let request = URLRequest(url: url!)
        
        var parsedPosts = [PostModel]()
        
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.global(qos: .userInitiated).async {
                if ((data) != nil) {
                    parsedPosts = self.parser.parse(data: data!)
                }
                var error = false
                if (parsedPosts.count == 0) {
                    error = true
                }
                completionHandler(parsedPosts, error)
            }
        }
        task.resume()
        
        // return parsedPosts?
    }
}
