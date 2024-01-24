//
//  File.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2024-01-22.
//

import SwiftUI

class BrandListViewModel: ObservableObject {
    @ObservedObject var dataManager = MotorcycleDataManager.shared
    
    func sortedBrands() -> [String] {
        return dataManager.motorcyclesByBrand.keys.sorted()
    }
}
