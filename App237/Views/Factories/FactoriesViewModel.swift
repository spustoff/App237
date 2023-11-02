//
//  FactoriesViewModel.swift
//  App237
//
//  Created by IGOR on 30/10/2023.
//

import SwiftUI
import CoreData

final class FactoriesViewModel: ObservableObject {

    @AppStorage("budget") var budget: Int = 50000
    @AppStorage("income") var income: Int = 0
    @AppStorage("nfac") var nfac: Int = 0
    @AppStorage("level") var level: Int = 1

    @Published var current_history: FactoryModel?
    @Published var factories: [FactoryModel] = []
    @Published var isDetail: Bool = false
    @Published var isStart: Bool = true
        
    func fetchFactories() {
        
        CoreDataStack.shared.modelName = "FactoryModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FactoryModel>(entityName: "FactoryModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.factories = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.factories = []
        }
    }
}

