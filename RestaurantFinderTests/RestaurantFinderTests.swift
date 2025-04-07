//
//  RestaurantFinderTests.swift
//  RestaurantFinderTests
//
//  Created by Gui Castro on 05/04/2025.
//
import Testing
@testable import RestaurantFinder

@MainActor
struct RestaurantFinderTests {
    
    // Tests that the ViewModel correctly holds and exposes mock restaurant data
    @Test func testRestaurantViewModelLoadsMockData() async throws {
        let viewModel = RestaurantViewModel()

        // Create a mock restaurant to simulate what would come from the API
        let mockRestaurant = Restaurant(
            id: "123",
            name: "Test Restaurant",
            cuisines: [Cuisine(name: "Italian")],
            rating: Rating(starRating: 4.0),
            address: Address(firstLine: "Test Street", city: "Test City", postalCode: "TEST123"),
            logoUrl: nil
        )

        // Simulate the ViewModel being updated with this data
        viewModel.restaurants = [mockRestaurant]

        // check that the data is correctly stored and accessible
        #expect(viewModel.restaurants.count == 1)
        #expect(viewModel.restaurants.first?.name == "Test Restaurant")
    }

    // Tests that the real API returns at least one restaurant with a name
    @Test func testRestaurantServiceReturnsData() async throws {
        let service = RestaurantService()

        // Perform a real network request to the Just Eat API
        let restaurants = try await service.fetchRestaurants(postcode: "DH14DG")

        // checks that at least one restaurant is returned and has a name
        #expect(restaurants.count > 0)
        #expect(!restaurants.first!.name.isEmpty)
    }
}

