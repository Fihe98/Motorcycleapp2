//
//  MotorcycleDetailView.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2023-12-31.
//

import SwiftUI

struct MotorcycleDetailView: View {
    var motorcycle: Motorcycle

    var body: some View {
        
        Text("Brand: \(motorcycle.brand ?? "No Brand")")
        
        Text("Model: \(motorcycle.model ?? "No Model")")
        
        Text("Year: \(motorcycle.year ?? "No model year specified")")
        
        Text("Category: \(motorcycle.category ?? "No Category")")
        
        Text("Displacement(cc): \(motorcycle.displacementCcm ?? "Unknown Displacement")")
        
        Text("Power: \(motorcycle.powerHp ?? "Unknown Power")")
        
        Text("Torque: \(motorcycle.torqueNm ?? "Unknown Torque")")
        
        Text("Engine cylinder count: \(motorcycle.engineCylinder ?? "Unknown engine cylinder count")")
        
        Text("Transmission type: \(motorcycle.transmissionType ?? "Unknown transmission type")")
        
        Text("Dry Weight(kg): \(motorcycle.dryWeightKg ?? "Unknown dry weight")")
    }
}

