//
//  AppDelegate.swift
//  JWTClient
//
//  Created by Antonchikov Alexander on 24/04/2018.
//
//

import UIKit
import CoreData
import Log4swift
import Foundation



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        //let value = Bundle.init(for: AppDelegate.self).infoDictionary?["your plist key name"] as? Any

        var myDictionaryPath = Bundle.main.path(forResource: "my", ofType: "plist")
        
        var myDictionary = NSMutableDictionary(contentsOfFile: myDictionaryPath!)
        let myStringDict = myDictionary as? [String:AnyObject]
        let log4SwiftPath = myStringDict?["Log4SwiftPath"]
        
        
        
        // Create formatters
        // PatternFormater init can throw an error if the pattern is not valid. Those errors are not handled in that example (but it should be in your code ;-) )
        let rootFormatter = try! PatternFormatter(identifier:"rootFormatter", pattern: "[Root formatter][%l] - %m")
        let consoleFormatter = try! PatternFormatter(identifier:"consoleFormatter", pattern: "[%n][%l] - %m")
        let fileFormatter = try! PatternFormatter(identifier:"fileFormatter", pattern: "[%d][%n] - %m")
        
        // Create appenders
        let stdOutAppender = StdOutAppender("stdOutAppender")
        stdOutAppender.formatter = consoleFormatter
        
        /*
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        var dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        let date = dateFormatter.string(from: Date())
        let saveURL = documentDirectory.appendingPathComponent("log4swift-\(date).log")
        let writePath = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("log4swift.log")
        */
        //print(#file)
        
        let fileAppender = FileAppender(identifier: "fileAppender", filePath: "\(log4SwiftPath)log4swift.log")
        //errorFileAppender.thresholdLevel = .Debug
        fileAppender.formatter = fileFormatter
        
        // Create loggers
        let rootLogger = LoggerFactory.sharedInstance.rootLogger
        //rootLogger.thresholdLevel = .Warning
        rootLogger.appenders[0].formatter = rootFormatter
        rootLogger.appenders.removeAll()
        rootLogger.appenders = [stdOutAppender, fileAppender]

        
        //try! LoggerFactory.sharedInstance.registerLogger(errorFileAppender)
        
        Logger.debug("Delay Launch screen for 3 seconds")
        Thread.sleep(forTimeInterval: 3.0)
        // Override point for customization after application launch.
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
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "JWTClient")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

