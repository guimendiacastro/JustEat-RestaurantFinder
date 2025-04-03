//
//  README.md
//  RestaurantFinder
//
//  Created by Gui Castro on 03/04/2025.
//


# Just Eat Restaurant Finder

This is my solution to the Early Careers Mobile Engineering Program (iOS) assignment from Just Eat.

The app fetches restaurant data using Just Eat’s API and displays the first 10 restaurants for a postal code in the UK

## Features

- Displays:
  - Name
  - Cuisines
  - Star Rating (as a number)
  - Address
- Uses SwiftUI and Swift Concurrency (`async/await`)
- Postcode used: `DH14DG`

## How to Run it

1. Open the `.xcodeproj` file in Xcode
2. Set your deployment target to iOS 15 or later
3. Run the app in the simulator or on a device
4. Will load the first 10 restaurants for the postcode `DH14DG`

## Assumptions

- The API’s `id` field is a string (not a UUID) — handled accordingly in the model.
- If any fields are missing in the API (like rating or address), default values are used.
- Assumes iOS 15+ so that Swift's async/await and `@MainActor` features are supported.

## Improvements I'd make with more time

- Add a text field to allow users to input postcode dynamically
- Show a loading spinner while fetching
- Handle errors in the UI (e.g. no results or network failure)

## Requirements
The app:
- Shows the required 4 data points
- Limits to the first 10 restaurants
- Includes this README with build and run instructions
- Uses Swift as required



