//
//  ModelYearsView.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2024-01-11.
//

import SwiftUI

struct ModelYearsView: View {
    @ObservedObject private var dataManager = MotorcycleDataManager.shared
    let brand: String
    let model: String
    let motorcycles: [Motorcycle]
    var isCompareSheet: Bool
    var action: (Motorcycle) -> Void
    
    @State private var selectedMotorcycle: Motorcycle?
    
    var body: some View {
        let filteredMotorcycles = motorcycles.filter { $0.brand == brand && $0.model == model }
        
        List(filteredMotorcycles, id: \.self) { motorcycle in
            NavigationLink(destination: MotorcycleDetailView(motorcycles: [motorcycle]), tag: motorcycle, selection: $selectedMotorcycle) {
                Text("\(brand) \(model) \(motorcycle.year ?? "")")
                    .onTapGesture {
                        if isCompareSheet {
                            action(motorcycle)
                        } else {
                            // Manually trigger navigation
                            selectedMotorcycle = motorcycle
                        }
                    }
            }
            .listRowBackground(Color.clear)
            .listRowSeparatorTint(.white)
            .foregroundColor(.white)
        }
        .padding(.bottom, 20)
        .background(LinearGradient(
            gradient: Gradient(colors: [Color(red: 11/255, green: 24/255, blue: 56/255), Color(red: 1/255, green: 1/255, blue: 26/255)]),
            startPoint: .top,
            endPoint: .bottom
        ))
        .foregroundColor(.white)
        .listStyle(DefaultListStyle())
        .scrollContentBackground(.hidden)
    }
}
