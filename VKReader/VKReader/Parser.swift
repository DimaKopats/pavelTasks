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
    
    func parsePostsFrom(data: Data) -> [PostModel] {
        var parsedPosts = [PostModel]()
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        
        if let incomingDictionary = json as? [String: Any],
            let responseDictionary = incomingDictionary["response"] as? [String: Any],
            let itemsArray = responseDictionary["items"] as? [Dictionary<String, Any>] {
            for item in itemsArray {
                // each item = dictionary with parameters
                if let post = createPostModelFrom(dictionary: item) {
                    // if model correct ->  append to array
                    parsedPosts.append(post)
                }
            }
        }
        print("parsedPosts.count = \(parsedPosts.count)/20")
        return parsedPosts
    }
    
    func parseGroupsFrom(data: Data) -> [GroupModel] {
        //        print("Parser parseGroups")
        var parsedGroups = [GroupModel]()
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        
        if let incomingDictionary = json as? [String: Any] ,
            let responseDictionary = incomingDictionary["response"] as? [String: Any],
            let groupsArray = responseDictionary["groups"] as? [Dictionary<String, Any>] {
            for group in groupsArray {
                if let groupInfo = createGroupModel(fromDictionary: group) {
                    parsedGroups.append(groupInfo)
                }
            }
        }
        
        return parsedGroups
    }
    
    func createGroupModel(fromDictionary groupDictionary: [String: Any]) -> GroupModel? {
        if let name = groupDictionary["name"] as? String,
            let photo = groupDictionary["photo"] as? String,
            let id = groupDictionary["gid"] as? Int {
            let groupModel = GroupModel(logoUrl: photo, title: name, id: id)
            return groupModel
        }
        return nil
    }
    
    func createPostModelFrom(dictionary dataDictionary: Dictionary<String, Any>) -> PostModel? {
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
    
    func createPostFrom(dictionary: [String: Any]) -> PostModel? {
        var photoArray = [PostPhotoModel]()
        
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
            let model = PostModel(sourceID: -sourceID, date: date, title: correctText, images: photoArray, id: postID)
            return model
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
    
    func createCorrect(text: String) -> String {
        let almostCorretText = text.replacingOccurrences(of: "<br> <br>", with: "<br>")
        let correctText = almostCorretText.replacingOccurrences(of: "<br>", with: "\n")
        return correctText
    }
    
    func createVideoFrom(dictionary: [String: Any]) -> PostModel? {
        // implement creating video
        return nil
    }
    
    func createPhotoModelfrom(dictionary: Dictionary<String,Any>) -> PostPhotoModel? {
        
        if let bigPhotoURL = dictionary["src_big"] as? String {
            //                            print("big photo = \(bigPhotoURL)")
            return PostPhotoModel(url: bigPhotoURL)
        } else if let mediumPhotoURL = dictionary["src"] as? String  {
            print("medium photo = \(mediumPhotoURL)")
            return PostPhotoModel(url: mediumPhotoURL)
        } else if let smallPhoroURL = dictionary["src_small"] as? String {
            print("small photo = \(smallPhoroURL)")
            return PostPhotoModel(url: smallPhoroURL)
        }
        return nil
    }
    
}









