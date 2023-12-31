//
//  DataLoader.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2023-12-31.
//

import Foundation

func decodeJSON() -> [Motorcycle] {
    guard let path = Bundle.main.path(forResource: "motorcycles", ofType: "json") else {
        return []
    }

    do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let decoder = JSONDecoder()
        return try decoder.decode([Motorcycle].self, from: data)
    } catch {
        print("Error decoding JSON: \(error)")
        return []
    }
}

