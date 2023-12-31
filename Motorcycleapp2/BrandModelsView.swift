//
//  BrandModelsView.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2023-12-31.
//

import SwiftUI

struct BrandModelsView: View {
    let brand: String
    let models: [Motorcycle]

    var body: some View {
        List(models) { motorcycle in
            NavigationLink(destination: MotorcycleDetailView(motorcycle: motorcycle)) {
                VStack(alignment: .leading) {
                    Text("\(motorcycle.model ?? "No Model")")
                        .font(.headline)
                    Text("Year: \(motorcycle.year ?? "Unknown Year")")
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle(brand)
    }
}
