//
//  BrandListView.swift
//  Motorcycleapp2
//
//  Created by Filip Henriksson on 2023-12-31.
//

import SwiftUI

struct BrandListView: View {
    @ObservedObject private var viewModel = BrandListViewModel()
    @ObservedObject private var dataManager = MotorcycleDataManager.shared
    @State private var allMotorcycles: [Motorcycle] = []
    var isCompareSheet: Bool
    var action: (Motorcycle) -> Void
    
    var body: some View {
        NavigationView {
            List(viewModel.sortedBrands(), id: \.self) { brand in
                NavigationLink(destination: CategoryView(brand: brand, motorcycles: viewModel.dataManager.motorcyclesByBrand[brand] ?? [], isCompareSheet: isCompareSheet, action: action)) {
                    HStack {
                        Spacer()
                        BrandImageButton(brand: brand)
                            .padding(5)
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
                .listRowSeparatorTint(.clear)
            }
            .listStyle(DefaultListStyle())
            .padding(.top, 20)
            .padding(.bottom, 20)
            .background(LinearGradient(
                gradient: Gradient(colors: [Color(red: 11/255, green: 24/255, blue: 56/255), Color(red: 1/255, green: 1/255, blue: 26/255)]),
                startPoint: .top,
                endPoint: .bottom
            ))
            .scrollContentBackground(.hidden)
        }
        .accentColor(.white)
    }
}

struct BrandImageButton: View {
    let brand: String

    var body: some View {
        Button(action: {
        }) {
            Image(brand.lowercased())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
        }
    }
}

struct BrandListView_Previews: PreviewProvider {
    static var previews: some View {
        return BrandListView(isCompareSheet: false) { motorcycles in }
    }
}
