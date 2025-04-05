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

    @Test func testRestaurantViewModelLoadsMockData() async throws {
        let viewModel = RestaurantViewModel()

        let mockRestaurant = Restaurant(
            id: "123",
            name: "Test Restaurant",
            cuisines: [Cuisine(name: "Italian")],
            rating: Rating(starRating: 4.0),
            address: Address(firstLine: "Test Street", city: "Test City", postalCode: "TEST123"),
            logoUrl: nil
        )

        viewModel.restaurants = [mockRestaurant]

        #expect(viewModel.restaurants.count == 1)
        #expect(viewModel.restaurants.first?.name == "Test Restaurant")
    }

    @Test func testRestaurantServiceReturnsData() async throws {
        let service = RestaurantService()


        let restaurants = try await service.fetchRestaurants(postcode: "DH14DG")

        #expect(restaurants.count > 0)
        #expect(!restaurants.first!.name.isEmpty)
    }
}

