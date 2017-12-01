//
//  URLBuilder.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/24/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class URLBuilder: NSObject {
    class func createURLFeed(token: String, countPosts: Int) -> URL {
        let queryString = "https://api.vk.com/method/newsfeed.get?count=\(countPosts)&filters=post&access_token=\(token)"
        let url = URL(string: queryString)!
        return url
    }
    
    class func createURLRepost(token: String, sourceID: Int, postId: Int) -> URL {
        let space = "%20"
        var message = "test ios app"
        message = message.replacingOccurrences(of: " ", with: space)
        let queryString = "https://api.vk.com/method/wall.repost?object=wall\(-sourceID)_\(postId)&message=\(message)&access_token=\(token)"
        let url = URL(string: queryString)!
        print(url)
        return url
    }
}
