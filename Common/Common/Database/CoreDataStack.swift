//
//  CoreDataStack.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 11/11/2024.
//

import Foundation
import CoreData

public class CoreDataStack {
    public static let shared = CoreDataStack()
    
    private init() {}
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer? = {
        guard let modelURL = Bundle(for: CoreDataStack.self).url(forResource: "CoreDataDB", withExtension: "momd") else {
            print("Error loading model from bundle")
            return nil
        }
        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
            print("Error loading model from \(modelURL)")
            return nil
        }
        let container = NSPersistentContainer(name: "CoreDataDB", managedObjectModel: model)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public var context: NSManagedObjectContext? {
        return persistentContainer?.viewContext ?? nil
    }
    
    // MARK: - Core Data Saving support
    public func saveContext () {
        guard let context = persistentContainer?.viewContext else {
            return
        }
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
