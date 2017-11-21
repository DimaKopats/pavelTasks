//
//  Parser.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 11/21/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import UIKit

class Parser: NSObject {
    func parse(data: Data) -> [PostModel] {
        print("Parser parse(data")
        var parsedData = [PostModel]()
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        if let dict = json as? [String: Any] {
            if let itemsArray = dict["items"] as? [Any] {
                for item in itemsArray {
                    if let post = createPostModel(dataDictionary: item) {
                        parsedData.append(post)
                    }
                }
            }
        }
        return parsedData
    }
    
    func createPostModel(dataDictionary: Any) -> PostModel? {
        if let data = dataDictionary as? [String: Any] {
            print("createPostModel")
            
            //            if let imagesData = gifData["images"] as? [String: Any] {
            //                let thumbnail = self.getImageData(data: imagesData, key: "fixed_width_downsampled")
            //                let original = self.getImageData(data: imagesData, key: "original")
            //                //    if (thumbnail != nil && original != nil) {
            //                let gifCard = GIFCard()
            //                gifCard.originalGIF = original
            //                gifCard.thumbnail = thumbnail
            //                gifCard.id = gifData["id"] as! String
            //                gifCard.rating = Rating(rawValue: gifData["rating"] as! String)
            //                gifCard.title = getTitleFromSlug(slug: gifData["slug"] as! String, id: gifCard.id)
            //                gifCard.uploadDate = getDateFromString(string: gifData["import_datetime"] as! String)
            //                gifCard.trendDate = getDateFromString(string: gifData["trending_datetime"] as! String)
            //                return gifCard
            //                //     }
            //
            //            }
        }
        return nil
    }
}



//class GIFDataParser: NSObject {
//
//
//    func getDateFromString(string: String) -> Date? {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"  //incorrect time
//        return formatter.date(from: string)
//
//    }
//
//
//    func getImageData(data: [String: Any], key: String) -> GIFModel {
//        return GIFModel(dataDictionary:(self.getModel(data: data[key] as! [String : Any]) as! [String : Any]))
//    }
//
//    func getModel(data: [String: Any]) -> Any {
//        var modelData = [String: Any]()
//        modelData["ratio"] = self.getRatio(width: (data["width"] as! NSString).floatValue, height: (data["height"] as! NSString).floatValue)
//        modelData["url"] = data["url"] as! String
//        return modelData
//    }
//
//    func getRatio(width:Float, height:Float) -> Float {
//        return height/width
//    }
//
//}






















//
//  GIFDataParser.swift
//  GIFTIME
//
//  Created by Ekaterina Diomina on 26.09.17.
//  Copyright © 2017 Kopat+Baranouski+Dyomina. All rights reserved.
//

//import UIKit
//
//class GIFDataParser: NSObject {
//
//
//    func parse(data: Data) -> [GIFCard] {
//        var parsedData = [GIFCard]()
//        let json = try? JSONSerialization.jsonObject(with: data, options: [])
//        if let dictionary = json as? [String: Any] {
//            if let gifDataArray = dictionary["data"] as? [Any] {
//                for gifData in gifDataArray {
//                    if let gifCard = createGIFCard(data: gifData) {
//                        parsedData.append(gifCard)
//                    }
//                }
//
//                //update ui after download and parse all model info
//
//            }
//
//        }
//        return parsedData
//    }
//
//    func createGIFCard (data: Any) -> GIFCard? {
//        if let gifData = data as? [String: Any]{
//            if let imagesData = gifData["images"] as? [String: Any] {
//                let thumbnail = self.getImageData(data: imagesData, key: "fixed_width_downsampled")
//                let original = self.getImageData(data: imagesData, key: "original")
//                //    if (thumbnail != nil && original != nil) {
//                let gifCard = GIFCard()
//                gifCard.originalGIF = original
//                gifCard.thumbnail = thumbnail
//                gifCard.id = gifData["id"] as! String
//                gifCard.rating = Rating(rawValue: gifData["rating"] as! String)
//                gifCard.title = getTitleFromSlug(slug: gifData["slug"] as! String, id: gifCard.id)
//                gifCard.uploadDate = getDateFromString(string: gifData["import_datetime"] as! String)
//                gifCard.trendDate = getDateFromString(string: gifData["trending_datetime"] as! String)
//                return gifCard
//                //     }
//
//            }
//
//        }
//
//        return nil
//
//    }
//
//    func getDateFromString(string: String) -> Date? {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"  //incorrect time
//        return formatter.date(from: string)
//
//    }
//
//    func getTitleFromSlug(slug: String, id: String) -> String {
//        let title = slug.replacingOccurrences(of: ("-" + id), with: "", options: .backwards, range: nil)
//        return title.replacingOccurrences(of: "-", with: " ")
//    }
//
//    func getImageData(data: [String: Any], key: String) -> GIFModel {
//        return GIFModel(dataDictionary:(self.getModel(data: data[key] as! [String : Any]) as! [String : Any]))
//    }
//
//    func getModel(data: [String: Any]) -> Any {
//        var modelData = [String: Any]()
//        modelData["ratio"] = self.getRatio(width: (data["width"] as! NSString).floatValue, height: (data["height"] as! NSString).floatValue)
//        modelData["url"] = data["url"] as! String
//        return modelData
//    }
//
//    func getRatio(width:Float, height:Float) -> Float {
//        return height/width
//    }
//
//}








