//
//  ContentView.swift
//  RestaurantFinder
//
//  Created by Gui Castro on 26/03/2025.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RestaurantViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.restaurants) { restaurant in
                VStack(alignment: .leading, spacing: 8) {
                    Text(restaurant.name)
                        .font(.headline)
                    Text("Cuisine: \(restaurant.cuisines.map { $0.name }.joined(separator: ", "))")
                        .font(.subheadline)
                    Text("Rating: \(restaurant.rating?.starRating ?? 0.0, specifier: "%.1f")")
                        .font(.subheadline)
                    Text(restaurant.address.formatted)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Top 10 Restaurants")
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
