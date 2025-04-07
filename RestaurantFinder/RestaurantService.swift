//
//  RestaurantService.swift
//  RestaurantFinder
//
//  Created by Gui Castro on 26/03/2025.
//
import Foundation

struct RestaurantResponse: Codable {
    let restaurants: [Restaurant]
}

// Main restaurant model

struct Restaurant: Codable, Identifiable {
    let id: String
    let name: String
    let cuisines: [Cuisine]
    let rating: Rating?
    let address: Address?
    let logoUrl: String?

    // Explicitly define coding keys
    enum CodingKeys: String, CodingKey {
        case id, name, cuisines, rating, address, logoUrl
    }
}


// Model for each cuisine type
struct Cuisine: Codable {
    let name: String
}

// Model for star rating info
struct Rating: Codable {
    let starRating: Double?
}

// Address model with optional fields and a formatted computed property
struct Address: Codable {
    let firstLine: String?
    let city: String?
    let postalCode: String?

    var formatted: String {
        [firstLine, city, postalCode]
            .compactMap { $0 }
            .joined(separator: ", ")
    }
}

// class responsible for fetching restaurant data from the Just Eat API
class RestaurantService {
    func fetchRestaurants(postcode: String) async throws -> [Restaurant] {
        let urlString = "https://uk.api.just-eat.io/discovery/uk/restaurants/enriched/bypostcode/\(postcode)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let (data, _) = try await URLSession.shared.data(for: request)

        let decoded = try JSONDecoder().decode(RestaurantResponse.self, from: data)
        // Return only the first 10 restaurants

        return Array(decoded.restaurants.prefix(10))
    }
}
