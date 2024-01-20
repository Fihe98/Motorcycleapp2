//
//  BrandListView.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2023-12-31.
//

import SwiftUI

struct BrandListView: View {
    
    @State private var allMotorcycles: [Motorcycle] = []
    let selectedBrands: [String]
    var isCompareSheet: Bool
    var action: (Motorcycle) -> Void

    var groupedMotorcycles: [String: [Motorcycle]] {
        groupMotorcyclesByBrand(motorcycles: dataManager.allMotorcycles, selectedBrands: selectedBrands)
    }
    
    var body: some View {
        NavigationView {
            List(groupedMotorcycles.keys.sorted(), id: \.self) { brand in
                NavigationLink(destination: CategoryView(brand: brand, motorcycles: groupedMotorcycles[brand] ?? [], isCompareSheet: isCompareSheet, action: action)) {
                    BrandImageButton(brand: brand)
                }
            }
            .navigationTitle("Brands")
        }
        .onAppear {
            // Load data on app startup
            allMotorcycles = decodeJSON()
        }
    }
}

struct BrandImageButton: View {
    let brand: String

    var body: some View {
        Button(action: {
            // Handle button action if needed
        }) {
            Image(brand.lowercased())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding(10)
                .background(Color.white)
                .cornerRadius(8)
        }
    }
}

struct BrandListView_Previews: PreviewProvider {
    static var previews: some View {
        return BrandListView(selectedBrands: ["honda", "yamaha", "ducati", "bmw"], isCompareSheet: false) { motorcycles in }
    }
}
