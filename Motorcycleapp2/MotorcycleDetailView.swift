//
//  MotorcycleDetailView.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2023-12-31.
//

import SwiftUI

struct MotorcycleDetailView: View {
    @State private var isBottomSheetPresented = false
    @State var motorcycles: [Motorcycle]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 300))], spacing: 16) {
                ForEach(motorcycles) { motorcycle in
                    MotorcycleCardView(motorcycle: motorcycle)
                }
            }
            .padding()
        }
        .background(Color.gray.opacity(0.1))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Compare") {
                    isBottomSheetPresented.toggle()
                }
                .sheet(isPresented: $isBottomSheetPresented) {
                    CompareSheet { motorcycle in
                        self.motorcycles.append(motorcycle)
                        print("yay!")
                        isBottomSheetPresented = false
                    }
                }
            }
        }
    }
}

struct MotorcycleCardView: View {
    var motorcycle: Motorcycle
    
    @State private var isGeneralInfoExpanded = false
    @State private var isEngineDetailsExpanded = false
    @State private var isWeightDimensionsExpanded = false
    @State private var isOtherDetailsExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(motorcycle.brandModel)")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.bottom, 8)
            
            DisclosureGroup(isExpanded: $isGeneralInfoExpanded) {
                Text("Year: \(motorcycle.year ?? "No model year specified")")
                    .styledText()
                Text("Category: \(motorcycle.category ?? "No Category")")
                    .styledText()
            } label: {
                GroupTitle(title: "General Information")
            }
            
            DisclosureGroup(isExpanded: $isEngineDetailsExpanded) {
                Text("Displacement: \(motorcycle.displacementCcm ?? "Unknown Displacement")")
                    .styledText()
                Text("Power: \(motorcycle.powerHp ?? "Unknown Power")")
                    .styledText()
                Text("Torque: \(motorcycle.torqueNm ?? "Unknown Torque")")
                    .styledText()
                Text("Engine Cylinder: \(motorcycle.engineCylinder ?? "Unknown engine cylinder count")")
                    .styledText()
                Text("Engine Stroke: \(motorcycle.engineStroke ?? "Unknown engine stroke")")
                    .styledText()
                Text("Gearbox: \(motorcycle.gearbox ?? "Unknown Gearbox")")
                    .styledText()
                Text("Bore (mm): \(motorcycle.boreMm ?? "Unknown Bore")")
                    .styledText()
                Text("Stroke (mm): \(motorcycle.strokeMm ?? "Unknown Stroke")")
                    .styledText()
            } label: {
                GroupTitle(title: "Engine Details")
            }
            
            DisclosureGroup(isExpanded: $isWeightDimensionsExpanded) {
                Text("Dry Weight (kg): \(motorcycle.dryWeightKg ?? "Unknown dry weight")")
                    .styledText()
                Text("Wheelbase (mm): \(motorcycle.wheelbaseMm ?? "Unknown Wheelbase")")
                    .styledText()
                Text("Seat Height (mm): \(motorcycle.seatHeightMm ?? "Unknown Seat Height")")
                    .styledText()
            } label: {
                GroupTitle(title: "Weight and Dimensions")
            }
            
            DisclosureGroup(isExpanded: $isOtherDetailsExpanded) {
                Text("Fuel Capacity (lts): \(motorcycle.fuelCapacityLts ?? "Unknown Fuel Capacity")")
                    .styledText()
                Text("Fuel System: \(motorcycle.fuelSystem ?? "Unknown Fuel System")")
                    .styledText()
                Text("Fuel Control: \(motorcycle.fuelControl ?? "Unknown Fuel Control")")
                    .styledText()
                Text("Cooling System: \(motorcycle.coolingSystem ?? "Unknown Cooling System")")
                    .styledText()
                Text("Transmission Type: \(motorcycle.transmissionType ?? "Unknown transmission type")")
                    .styledText()
                Text("Front Brakes: \(motorcycle.frontBrakes ?? "Unknown Front Brakes")")
                    .styledText()
                Text("Rear Brakes: \(motorcycle.rearBrakes ?? "Unknown Rear Brakes")")
                    .styledText()
                Text("Front Tire: \(motorcycle.frontTire ?? "Unknown Front Tire")")
                    .styledText()
                Text("Rear Tire: \(motorcycle.rearTire ?? "Unknown Rear Tire")")
                    .styledText()
                Text("Front Suspension: \(motorcycle.frontSuspension ?? "Unknown Front Suspension")")
                    .styledText()
                Text("Rear Suspension: \(motorcycle.rearSuspension ?? "Unknown Rear Suspension")")
                    .styledText()
            } label: {
                GroupTitle(title: "Other Details")
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

struct GroupTitle: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

extension Text {
    func styledText() -> some View {
        self
            .font(.body)
            .foregroundColor(.black)
            .padding(.vertical, 2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
