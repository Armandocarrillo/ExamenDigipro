//
//  CoreDataManager.swift
//  Formulario
//
//  Created by Armando Carrillo on 29/01/21.
//

import Foundation
import CoreData

class CoreDataManager {
   
    private let container : NSPersistentContainer!
    
    init() {
        container = NSPersistentContainer(name: "Formulario")
        
        setupDatabase()
    }
    
    private func setupDatabase() {
        
        container.loadPersistentStores { (desc, error) in
        if let error = error {
            print("Error loading store \(desc) — \(error)")
            return
        }
        print("Database ready!")
    }
}
    
}

extension CoreDataManager {
    
    func createUser(name : String, lastNamePaterno : String, lastNameMaterno : String,  email : String , phoneNumber : String, completion: @escaping() -> Void) {
        // 2
        let context = container.viewContext
      
        // 3
        let user = Person(context: context)
        user.name = name
        user.lastnamePaterno = lastNamePaterno
        user.lastnameMaterno = lastNameMaterno
        user.email = email
        user.phoneNumber = phoneNumber
        // 4
        
        // 5
        do {
            try context.save()
            print("Usuario \(name) \(lastNamePaterno) \(lastNameMaterno) guardado")
            completion()
        } catch {
         
          print("Error guardando usuario — \(error)")
        }
    }
}
