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
    
    func getData(completionHandler:@escaping (_ models: [Model], _ error:Bool) -> ()) {
        let url = URLBuilder.createURL(token: self.token, countPosts: 20)
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            // данный блок стартанет когда придет ответ от сервера
            DispatchQueue.global(qos: .userInitiated).async {
                print("before parsing")
                var parsedPosts = [PostModel]()
                var parsedGroups = [GroupModel]()
                var models = [Model]()
                if let notNilData = data {
                    parsedPosts = self.parser.parsePostsFrom(data: notNilData)
                    parsedGroups = self.parser.parseGroupsFrom(data: notNilData)

                    for post in parsedPosts {
                        for group in parsedGroups {
                            if post.sourceID == group.id {
                                let model = Model(post: post, group: group)
                                models.append(model)
                            }
                        }
                    }
                }
                
                print("after parsing")
                var error = false
                if (parsedPosts.isEmpty || parsedGroups.isEmpty) {
                    print("result parsing = nothing")
                    error = true
                }
                print("before call completionHandler")
                completionHandler(models, error)
            }
        }
        task.resume()
    }
}
