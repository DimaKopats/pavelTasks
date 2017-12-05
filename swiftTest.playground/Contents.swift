//: Playground - noun: a place where people can play

import UIKit

//"1️⃣2️⃣3️⃣4️⃣5️⃣"



//class Rectangle {
//
//    var width: Float
//    var height: Float
//    init(width: Float, height: Float) {
//        print("Rectangle - init(width: , height: )")
//        self.width = width
//        self.height = height
//    }
//
//    convenience init() {
//        self.init(width: 5, height: 10)
//        print("Rectangle - init")
//    }
//}
//
//class Square : Rectangle {
//    init(dimention: Float) {
//        super.init(width: dimention, height: dimention)
//        print("Square - init(dimention: )")
//    }
//
//    override init(width: Float, height: Float) {
//        super.init(width: width, height: height)
//        print("Square - init(width: , height: )")
//    }
//}

//let square = Square.init(dimention: 15)

//let square1 = Square(width: 5, height: 10)



var inputString = "https://sun1-3.userapi.com/c7008/v7008665/43eaf/Z3eohjReb58.jpg"
var array = inputString.split(separator: "/")
print(array.last)












let space = "%20"
var message = "test ios app"
message = message.replacingOccurrences(of: " ", with: space)
print(message)








//class Food {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//    convenience init() {
//        self.init(name: "[Unnamed]")
//    }
//}
//
//class RecipeIngredient: Food {
//    var quantity: Int
//    init(name: String, quantity: Int) {
//        self.quantity = quantity
//        super.init(name: name)
//    }
//    override convenience init(name: String) {
//        self.init(name: name, quantity: 1)
//    }
//}
//
//class ShoppingListItem: RecipeIngredient {
//    var purchased = false
//    var description: String {
//        var output = "\(quantity) x \(name) "
//        output += purchased ? "✔" : "✘"
//        return output
//    }
//}
//
//var breakfastList = [
//    ShoppingListItem(),
//    ShoppingListItem(name: "Bacon"),
//    ShoppingListItem(name: "Eggs", quantity: 6),
//]
//breakfastList[0].name = "Orange juice"
//breakfastList[0].purchased = true
//for item in breakfastList {
//    print(item.description)
//}
//// 1 x Orange juice
//// 1 x Bacon
//// 6 x Eggs
//
//
//
//
public protocol URLSessionDelegate : NSObjectProtocol {
    
    
    @available(iOS 7.0, *)
    optional public func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?)
    
    
    @available(iOS 7.0, *)
    optional public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void)
    
    
    @available(iOS 7.0, *)
    optional public func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession)
}






public protocol URLSessionTaskDelegate : URLSessionDelegate {
    
    
    @available(iOS 11.0, *)
    optional public func urlSession(_ session: URLSession, task: URLSessionTask, willBeginDelayedRequest request: URLRequest, completionHandler: @escaping (URLSession.DelayedRequestDisposition, URLRequest?) -> Swift.Void)
    
    
    @available(iOS 11.0, *)
    optional public func urlSession(_ session: URLSession, taskIsWaitingForConnectivity task: URLSessionTask)
    
    
    @available(iOS 7.0, *)
    optional public func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Swift.Void)
    
    
    @available(iOS 7.0, *)
    optional public func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void)
    
    
    @available(iOS 7.0, *)
    optional public func urlSession(_ session: URLSession, task: URLSessionTask, needNewBodyStream completionHandler: @escaping (InputStream?) -> Swift.Void)
    
    
    @available(iOS 7.0, *)
    optional public func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64)
    
    
    @available(iOS 10.0, *)
    optional public func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics)
    
    
    @available(iOS 7.0, *)
    optional public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?)
}






public protocol URLSessionDataDelegate : URLSessionTaskDelegate {
    
    
    @available(iOS 7.0, *)
    optional public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Swift.Void)
    
    
    @available(iOS 7.0, *)
    optional public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didBecome downloadTask: URLSessionDownloadTask)
    
    
    @available(iOS 9.0, *)
    optional public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didBecome streamTask: URLSessionStreamTask)
    
    
    @available(iOS 7.0, *)
    optional public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data)
    
    
    @available(iOS 7.0, *)
    optional public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, willCacheResponse proposedResponse: CachedURLResponse, completionHandler: @escaping (CachedURLResponse?) -> Swift.Void)
}
