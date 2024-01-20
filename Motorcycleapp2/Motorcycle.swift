//
//  Motorcycle.swift
//  IOSMotorcykelApp
//
//  Created by Filip Henriksson on 2023-12-31.
//

import Foundation

struct Motorcycle: Identifiable, Decodable, Hashable {
    var id: UUID = UUID()
    var brand: String?
    var model: String?
    var year: String?
    var category: String?
    var rating: String?
    var displacementCcm: String?
    var powerHp: String?
    var torqueNm: String?
    var engineCylinder: String?
    var engineStroke: String?
    var gearbox: String?
    var boreMm: String?
    var strokeMm: String?
    var fuelCapacityLts: String?
    var fuelSystem: String?
    var fuelControl: String?
    var coolingSystem: String?
    var transmissionType: String?
    var dryWeightKg: String?
    var wheelbaseMm: String?
    var seatHeightMm: String?
    var frontBrakes: String?
    var rearBrakes: String?
    var frontTire: String?
    var rearTire: String?
    var frontSuspension: String?
    var rearSuspension: String?
    var colorOptions: String?
    
    var brandModel: String {
        return "\(brand ?? "") \(model ?? "")"
    }
    
    private enum CodingKeys: String, CodingKey {
        case brand = "Brand"
        case model = "Model"
        case year = "Year"
        case category = "Category"
        case rating = "Rating"
        case displacementCcm = "Displacement (ccm)"
        case powerHp = "Power (hp)"
        case torqueNm = "Torque (Nm)"
        case engineCylinder = "Engine cylinder"
        case engineStroke = "Engine stroke"
        case gearbox = "Gearbox"
        case boreMm = "Bore (mm)"
        case strokeMm = "Stroke (mm)"
        case fuelCapacityLts = "Fuel capacity (lts)"
        case fuelSystem = "Fuel system"
        case fuelControl = "Fuel control"
        case coolingSystem = "Cooling system"
        case transmissionType = "Transmission type"
        case dryWeightKg = "Dry weight (kg)"
        case wheelbaseMm = "Wheelbase (mm)"
        case seatHeightMm = "Seat height (mm)"
        case frontBrakes = "Front brakes"
        case rearBrakes = "Rear brakes"
        case frontTire = "Front tire"
        case rearTire = "Rear tire"
        case frontSuspension = "Front suspension"
        case rearSuspension = "Rear suspension"
       
    }

    
}
