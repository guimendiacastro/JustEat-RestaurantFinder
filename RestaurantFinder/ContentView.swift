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
                HStack(alignment: .top, spacing: 16) {
                    if let logo = restaurant.logoUrl, let url = URL(string: logo) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 60, height: 60)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(8)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.gray)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.gray)
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text(restaurant.name)
                            .font(.headline)
                        let cuisineText = restaurant.cuisines.isEmpty
                            ? "Cuisine: N/A"
                            : "Cuisine: \(restaurant.cuisines.map { $0.name }.joined(separator: ", "))"
                        Text(cuisineText)
                            .font(.subheadline)
                        let ratingText = restaurant.rating?.starRating
                            .map { String(format: "%.1f", $0) } ?? "N/A"
                        Text("Rating: \(ratingText)")
                            .font(.subheadline)
                        let addressText = restaurant.address?.formatted ?? "Address: N/A"
                        Text(addressText)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 8)
            }
            .refreshable {
                viewModel.fetch()
            }

            .navigationTitle("Top 10 Restaurants")
            .alert("Error", isPresented: .constant(viewModel.errorMessage != nil)) {
                Button("OK") {
                    viewModel.errorMessage = nil
                }
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}


#Preview {
    ContentView()
}
