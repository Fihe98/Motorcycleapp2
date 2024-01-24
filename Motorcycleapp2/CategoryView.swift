//
//  CategoryView.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2024-01-11.
//

import SwiftUI

struct CategoryView: View {
    @ObservedObject private var dataManager = MotorcycleDataManager.shared
    let brand: String
    let motorcycles: [Motorcycle]
    var isCompareSheet: Bool
    var action: (Motorcycle) -> Void

    var body: some View {

        let categories = Array(Set(motorcycles.filter { $0.brand == brand }.compactMap { $0.category }))
            .sorted()
        VStack{
            Text(brand.capitalized)
                .font(.largeTitle)
                .background(.clear)
                .foregroundColor(Color.white)
            List(categories, id: \.self) { category in
                NavigationLink(destination: BrandModelsView(brand: brand, category: category, models: motorcycles, isCompareSheet: isCompareSheet, action: action)) {
                    Text(category)
                }
                .listRowBackground(Color.clear)
                .listRowSeparatorTint(.white)
                .foregroundColor(.white)
            }
            .foregroundColor(.white)
            .listStyle(DefaultListStyle())
            .scrollContentBackground(.hidden)
            .padding(.top, 20)
            .padding(.bottom, 20)
        }
        .background(LinearGradient(
            gradient: Gradient(colors: [Color(red: 11/255, green: 24/255, blue: 56/255), Color(red: 1/255, green: 1/255, blue: 26/255)]),
            startPoint: .top,
            endPoint: .bottom
        ))
    }
}
