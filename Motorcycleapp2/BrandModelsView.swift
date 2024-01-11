//
//  BrandModelsView.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2023-12-31.
//


import SwiftUI

struct BrandModelsView: View {
    let brand: String
    let category: String?
    let models: [Motorcycle]

    @State private var searchText = ""

    var uniqueModels: [Motorcycle] {
        var uniqueModelsSet: Set<String> = Set()
        return models
            .filter { model in
                let brandModelKey = "\(model.brand ?? "")\(model.model ?? "")"
                let isCategoryMatch = category == nil || model.category == category
                let containsSearchText = searchText.isEmpty || brandModelKey.localizedCaseInsensitiveContains(searchText)

                if isCategoryMatch && containsSearchText {
                    if !uniqueModelsSet.contains(brandModelKey) {
                        uniqueModelsSet.insert(brandModelKey)
                        return true
                    }
                }
                return false
            }
            .sorted(by: { $0.brandModel < $1.brandModel })
    }

    var body: some View {
            List {
                ForEach(uniqueModels) { motorcycle in
                    NavigationLink(destination: ModelYearsView(brand: motorcycle.brand ?? "", model: motorcycle.model ?? "", motorcycles: models)) {
                        VStack(alignment: .leading) {
                            Text("\(motorcycle.brandModel)")
                                .font(.headline)
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("\(brand) \(category ?? "")")
    }
}
