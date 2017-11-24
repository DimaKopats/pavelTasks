//
//  URLBuilder.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/24/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class URLBuilder: NSObject {
    class func createURL(token: String, countPosts: Int) -> URL {
        let queryString = "https://api.vk.com/method/newsfeed.get?count=\(countPosts)&access_token=\(token)"
        let url = URL(string: queryString)!
        return url
    }
}
