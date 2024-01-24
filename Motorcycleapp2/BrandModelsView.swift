//
//  BrandModelsView.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2023-12-31.
//


import SwiftUI

struct BrandModelsView: View {
    @ObservedObject private var dataManager = MotorcycleDataManager.shared
    let brand: String
    let category: String?
    let models: [Motorcycle]
    var isCompareSheet: Bool
    var action: (Motorcycle) -> Void

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
            ForEach(searchResults) { motorcycle in
                NavigationLink(destination: ModelYearsView(brand: motorcycle.brand ?? "", model: motorcycle.model ?? "", motorcycles: models, isCompareSheet: isCompareSheet, action: action)) {
                    VStack(alignment: .leading) {
                        Text("\(motorcycle.brandModel)")
                    }
                }
                .listRowBackground(Color.clear)
                .listRowSeparatorTint(.white)
                .foregroundColor(.white)
            }
        }
        .padding(.bottom, 20)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
        .background(LinearGradient(
            gradient: Gradient(colors: [Color(red: 11/255, green: 24/255, blue: 56/255), Color(red: 1/255, green: 1/255, blue: 26/255)]),
            startPoint: .top,
            endPoint: .bottom
        ))
        .foregroundColor(.white)
        .listStyle(DefaultListStyle())
        .scrollContentBackground(.hidden)
    }

    var searchResults: [Motorcycle] {
        if searchText.isEmpty {
            return uniqueModels
        } else {
            return uniqueModels.filter { $0.brandModel.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
