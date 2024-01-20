//
//  CompareSheet.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2024-01-12.
//

import SwiftUI

struct CompareSheet: View {
    var action: (Motorcycle) -> Void

    var body: some View {
        BrandListView(selectedBrands: ["aprilia", "honda", "yamaha", "ducati", "bmw", "kawasaki", "suzuki", "triumph", "harley-davidson"], isCompareSheet: true, action: action)
    }
}
