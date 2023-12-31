//
//  BrandListView.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2023-12-31.
//

import SwiftUI

struct BrandListView: View {
    let allMotorcycles: [Motorcycle]
    let selectedBrands: [String]

    var groupedMotorcycles: [String: [Motorcycle]] {
        groupMotorcyclesByBrand(motorcycles: allMotorcycles, selectedBrands: selectedBrands)
    }

    var body: some View {
        NavigationView {
            List(groupedMotorcycles.keys.sorted(), id: \.self) { brand in
                NavigationLink(destination: BrandModelsView(brand: brand, models: groupedMotorcycles[brand] ?? [])) {
                    Text(brand)
                }
            }
            .navigationTitle("Brands")
        }
    }
}


