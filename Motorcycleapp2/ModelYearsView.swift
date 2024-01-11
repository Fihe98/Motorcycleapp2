//
//  ModelYearsView.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2024-01-11.
//

import SwiftUI

struct ModelYearsView: View {
    let brand: String
    let model: String
    let motorcycles: [Motorcycle]

    var body: some View {
        let filteredMotorcycles = motorcycles.filter { $0.brand == brand && $0.model == model }

        return List(filteredMotorcycles) { motorcycle in
            NavigationLink(destination: MotorcycleDetailView(motorcycle: motorcycle)) {
                Text("\(brand) \(model) \(motorcycle.year ?? "")")
            }
        }
        .navigationTitle("\(brand) \(model)")
    }
}
