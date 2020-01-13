
//  DemoProject
//
//  Created by vLinkD on 30/11/19.
//  Copyright © 2019 vLinkD. All rights reserved.
//

import Alamofire
import CoreData
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    static weak var shared: AppDelegate!
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppDelegate.shared = self
        reachabilityManager!.listener = { _ in
            if self.reachabilityManager?.isReachable ?? true {
                print("Net ON")

            } else {
                print("Net 0FF")
                MyAlert.showError(message: "No Internet")
            }
        }
        UINavigationBar.appearance().barTintColor = UIColor(red: 234.0/255.0, green: 46.0/255.0, blue: 73.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
      //  UIApplication.shared.statusBarStyle = .lightContent
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
        saveContext()
    }

    // MARK: - Core Data stack

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer? = {
        let container = NSPersistentContainer(name: "DemoProject")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                // fatalError("Unresolved error \(error), \(error.userInfo)")
                // FabricLog.print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext() {
        guard let context = persistentContainer?.viewContext else { return }
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // let nserror = error as NSError
                // fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                // FabricLog.print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
