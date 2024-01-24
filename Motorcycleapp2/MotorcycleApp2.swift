//
//  Motorcycleapp2App.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2023-12-31.
//

import SwiftUI

@main
struct MotorcycleApp2: App {
    @StateObject private var dataManager = MotorcycleDataManager.shared
    @State private var dataLoaded = false

    var body: some Scene {
        WindowGroup {
                BrandListView(isCompareSheet: false) { motorcycle in }
                .environmentObject(dataManager)
        }
    }

    func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dataLoaded = true
        }
    }
}
