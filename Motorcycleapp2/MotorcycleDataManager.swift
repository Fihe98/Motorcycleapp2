//
//  MotorcycleDataManager.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2024-01-20.
//

import Foundation
import Combine

class MotorcycleDataManager: ObservableObject {
    static let shared = MotorcycleDataManager()
    static let supportedBrands = ["aprilia", "honda", "yamaha", "ducati", "bmw", "kawasaki", "suzuki", "triumph", "harley-davidson", "ktm", "indian"]

    @Published var motorcyclesByBrand: [String: [Motorcycle]] = [:]

    private init() {
        loadMotorcycles()
    }
    
    private func groupMotorcyclesByBrand(motorcycles: [Motorcycle], selectedBrands: [String]) -> [String: [Motorcycle]] {
        let filteredMotorcycles = motorcycles.filter { selectedBrands.contains($0.brand ?? "") }
        return Dictionary(grouping: filteredMotorcycles, by: { $0.brand ?? "" })
    }

    private func loadMotorcycles() {
        guard let path = Bundle.main.path(forResource: "motorcycles", ofType: "json") else {
            return
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            motorcyclesByBrand = groupMotorcyclesByBrand(motorcycles: try decoder.decode([Motorcycle].self, from: data), selectedBrands: MotorcycleDataManager.supportedBrands)
            
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
