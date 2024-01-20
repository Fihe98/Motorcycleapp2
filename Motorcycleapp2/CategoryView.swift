//
//  CategoryView.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2024-01-11.
//

import SwiftUI

struct CategoryView: View {
    let brand: String
    let motorcycles: [Motorcycle]
    var isCompareSheet: Bool
    var action: (Motorcycle) -> Void

    var body: some View {
        
        let categories = Array(Set(motorcycles.filter { $0.brand == brand }.compactMap { $0.category }))
            .sorted()

            List(categories, id: \.self) { category in
                NavigationLink(destination: BrandModelsView(brand: brand, category: category, models: motorcycles, isCompareSheet: isCompareSheet, action: action)) {
                    Text(category)
                }
            }
            .navigationTitle("\(brand)")
    }
}
