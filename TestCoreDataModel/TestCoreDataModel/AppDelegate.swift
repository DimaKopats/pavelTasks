//
//  AppDelegate.swift
//  TestCoreDataModel
//
//  Created by Dzmitry Kopats on 1/4/18.
//  Copyright © 2018 Dzmitry Kopats. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // создание нового объекта
        let managedObject = Customer()
        // установка значения атрибута
        managedObject.name = "ООО «Василек2»"
        // извлечение значения атрибута
        let name = managedObject.name
        print("name = \(name!)")
        
        CoreDataManager.instance.saveContext()
        
        // Извление записей
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Customer")
        do {
            let results = try CoreDataManager.instance.persistentContainer.viewContext.fetch(fetchRequest)
            for result in results as! [Customer] {
                print("name - \(result.name!))")
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        CoreDataManager.instance.saveContext()
    }

    

}

