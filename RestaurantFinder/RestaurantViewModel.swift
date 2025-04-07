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
    @Published var errorMessage: String?

    // Fetch restaurants from the API for a given postcode
    
    func fetch() {
        Task {
            do {
                let service = RestaurantService()
                let result = try await service.fetchRestaurants(postcode: "DH14DG")
                self.restaurants = result
                self.errorMessage = nil // Clear any previous errors
            } catch let error as URLError {
                // Handle specific network-related errors
                switch error.code {
                case .notConnectedToInternet:
                    errorMessage = "No internet connection. Check your network."
                case .timedOut:
                    errorMessage = "The request timed out. Try again later."
                case .cannotFindHost, .cannotConnectToHost:
                    errorMessage = "Unable to reach the server"
                default:
                    errorMessage = "Network error: \(error.localizedDescription)"
                }
            } catch {
                // Fallback for any other errors
                errorMessage = "Something went wrong. Please try again."
            }
        }
    }
}
