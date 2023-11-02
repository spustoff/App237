//
//  NewFactoryViewModel.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI
import Alamofire
import CoreData

final class NewFactoryViewModel: ObservableObject {
    
    @AppStorage("nfac") var nfac: Int = 0
    
    @Published var resultText: String = ""
    
    @Published var factoryName: String = ""
    @Published var factoryDescription: String = ""
    @Published var factoryCost: String = ""
    @Published var factoryEarn: String = ""
    
    func addFactory(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "FactoryModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "FactoryModel", into: context) as! FactoryModel
        
        trans.factoryCost = Int16(factoryCost) ?? 0
        trans.factoryEarn = Int16(factoryEarn) ?? 0
        trans.factoryName = factoryName
        trans.factoryDescription = factoryDescription
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
}
