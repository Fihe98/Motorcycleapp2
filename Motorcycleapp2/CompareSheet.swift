//
//  CompareSheet.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2024-01-12.
//

import SwiftUI

struct CompareSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var dataManager = MotorcycleDataManager.shared
    var action: (Motorcycle) -> Void

    var body: some View {
        NavigationView {
            BrandListView(isCompareSheet: true, action: action)
            }
        }
    }
