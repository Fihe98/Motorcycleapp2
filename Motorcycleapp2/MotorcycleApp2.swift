//
//  Motorcycleapp2App.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2023-12-31.
//

import SwiftUI

func groupMotorcyclesByBrand(motorcycles: [Motorcycle], selectedBrands: [String]) -> [String: [Motorcycle]] {
    let filteredMotorcycles = motorcycles.filter { selectedBrands.contains($0.brand ?? "") }
    return Dictionary(grouping: filteredMotorcycles, by: { $0.brand ?? "" })
}


@main
struct MotorcycleApp2: App {
    var body: some Scene {
        WindowGroup {
            BrandListView(selectedBrands: ["aprilia", "honda", "yamaha", "ducati", "bmw", "kawasaki", "suzuki", "triumph", "harley-davidson", "indian"], isCompareSheet: false) { motorcycle in
                // Do nothing
            }

        }
    }
}
