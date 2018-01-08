//
//  Parser.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/21/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

// contains 7 Dictionary<String, Any>
typealias MyDictionary = Dictionary<String, Any>

class Parser: NSObject {
    
    func parseFeedFrom(data: Data) -> [Model] {
        var parsedPosts = [ContentModel]()
        var parsedGroups = [GroupModel]()
        var models = [Model]()
        
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        if let incomingDictionary = json as? [String: Any],
            let responseDictionary = incomingDictionary["response"] as? [String: Any] {
            parsedPosts = parsePostsFrom(dictionary: responseDictionary)
            parsedGroups = parseGroupsFrom(dictionary: responseDictionary)
        }
        
        for post in parsedPosts {
            for group in parsedGroups {
                if post.sourceID == group.id {
                    let model = Model(post: post, group: group)
                    models.append(model)
                }
            }
        }
        return models
        
//        let models1 = parsedPosts.map { (post: PostModel) -> Model? in
//            return parsedGroups.map({ (group: GroupModel) -> Model? in
//                (post.sourceID == group.id) ? Model(post: post, group: group) : nil
//            }).flatMap{$0}[0]
//        }
//
//        return models1
    }
    
    private func parsePostsFrom(dictionary: Dictionary<String, Any>) -> [ContentModel] {
        var parsedPosts = [ContentModel]()
        
        if let itemsArray = dictionary["items"] as? [Dictionary<String, Any>] {
            for item in itemsArray {
                // each item = dictionary with parameters
                if let post = createPostModelFrom(dictionary: item) {
                    parsedPosts.append(post)
                }
            }
        }
        print("parsedPosts.count = \(parsedPosts.count)/20")
        return parsedPosts
    }
    
    private func parseGroupsFrom(dictionary: Dictionary<String, Any>) -> [GroupModel] {
        //        print("Parser parseGroups")
        var parsedGroups = [GroupModel]()
        
        if let groupsArray = dictionary["groups"] as? [Dictionary<String, Any>] {
            for group in groupsArray {
                if let groupInfo = createGroupModel(fromDictionary: group) {
                    parsedGroups.append(groupInfo)
                }
            }
        }
        
        return parsedGroups
    }
    
    func parseNextFrom(data: Data) -> String {
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        if let incomingDictionary = json as? [String: Any],
            let responseDictionary = incomingDictionary["response"] as? [String: Any],
            let next_from = responseDictionary["next_from"] as? String {
            return next_from
        }
        return ""
    }
    
    func createGroupModel(fromDictionary groupDictionary: [String: Any]) -> GroupModel? {
        if let name = groupDictionary["name"] as? String,
            let logoStringUrl = groupDictionary["photo_50"] as? String,
            let logoUrl = URL.init(string: logoStringUrl),
            let id = groupDictionary["id"] as? Int {
            let logo = PhotoModel.init(url: logoUrl)
            let groupModel = GroupModel(logo: logo, title: name, id: id)
            return groupModel
        }
        return nil
    }
    
    func createPostModelFrom(dictionary dataDictionary: Dictionary<String, Any>) -> ContentModel? {
        if let postType = dataDictionary["type"] as? String {
            switch postType {
            case "post":
                //                print("postType = post")
                return createPostFrom(dictionary: dataDictionary)
            case "wall_photo":
                print("postType = wall_photo")
            //                return createWallPhotoFrom(dictionary: dataDictionary)
            case "video":
                print("postType = video")
            // logic for video
            case "copy":
                print("postType = copy")
                // logic for repost
                
                // if repost -> add parameters
                //        "copy_post_date": 1511350260,
                //        "copy_post_type": "post",
                //        "copy_owner_id": -50106785,
            //        "copy_post_id": 46966,
            default:
                print("unknown type")
                // some more variants?
            }
        }
        return nil
    }
    
    func createPostFrom(dictionary: [String: Any]) -> ContentModel? {
        var photoArray = [PhotoModel]()
        
        if let attachments = dictionary["attachments"] as? Array<Any> {
            for attachment in attachments {
                if let photoDictionary = attachment as? Dictionary<String, Any>,
                    let innerPhotoDictionary = photoDictionary["photo"] as? Dictionary<String, Any>,
                    let photoModel = createPhotoModelfrom(dictionary: innerPhotoDictionary) {
                    photoArray.append(photoModel)
                }
            }
        }
        
        if let date = dictionary["date"] as? Int,
            let postID = dictionary["post_id"] as? Int,
            let text = dictionary["text"] as? String,
            let sourceID = dictionary["source_id"] as? Int {
            //            print("date = \(date)")
            //            print("post_id = \(postID)")
            //            print("text = \(text)")
            //            print(-sourceID)
            let correctText = createCorrect(text: text)
            let model = ContentModel(sourceID: -sourceID, date: date, title: correctText, images: photoArray, id: postID)
            return model
        }
        return nil
    }
    
    func createCorrect(text: String) -> String {
        let htmlText = text.replacingOccurrences(of: "<br> <br>", with: "<br>")
        let correctText = htmlText.replacingOccurrences(of: "<br>", with: "\n")
        return correctText
    }
    
    func createPhotoModelfrom(dictionary: Dictionary<String,Any>) -> PhotoModel? {
        let imageUrl: URL?
        if let photo_807 = dictionary["photo_807"] as? String {
            imageUrl = URL(string: photo_807)
        } else if let photo_604 = dictionary["photo_604"] as? String  {
            imageUrl = URL(string: photo_604)
        } else if let photo_130 = dictionary["photo_130"] as? String {
            imageUrl = URL(string: photo_130)
        } else {
            imageUrl = URL.init(string: "")
            return nil
        }
        if let url = imageUrl {
            return PhotoModel(url: url)
        }
        return nil
    }
    
    
    //    func createWallPhotoFrom(dictionary: [String: Any]) -> PostModel? {
    //        var photoArray = [PostModel]()
    //        if let photos = dictionary["photos"] as? Array<Any> {
    //            for photo in photos {
    //                if let photoDictionary = photo as? Dictionary<String, Any>,
    //                    let photoUrl = createPhotoModelfrom(dictionary: photoDictionary) {
    //                    photoArray.append(photoUrl)
    //                }
    //            }
    //        }
    //
    //
    //        if let date = dictionary["date"] as? Int,
    //            let sourceID = dictionary["source_id"] as? Int {
    //            let model = PostModel(sourceID: -sourceID, date: date, title: "", images: photoArray, id: 0)
    //            return model
    //        }
    //        return nil
    //    }
    
}









