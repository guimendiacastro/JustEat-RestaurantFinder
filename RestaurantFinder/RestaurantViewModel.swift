//
//  RestaurantViewModel.swift
//  RestaurantFinder
//
//  Created by Gui Castro on 26/03/2025.
//
import Foundation

@MainActor
class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []

    func fetch() {
        Task {
            do {
                let service = RestaurantService()
                let result = try await service.fetchRestaurants(postcode: "DH14DG")
                self.restaurants = result
            } catch {
                print("❌ Error fetching restaurants:", error)
            }
        }
    }
}
