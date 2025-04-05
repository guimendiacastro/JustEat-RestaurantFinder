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

    func fetch() {
        Task {
            do {
                let service = RestaurantService()
                let result = try await service.fetchRestaurants(postcode: "DH14DG")
                self.restaurants = result
                self.errorMessage = nil
            } catch let error as URLError {
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
                errorMessage = "Something went wrong. Please try again."
            }
        }
    }
}
