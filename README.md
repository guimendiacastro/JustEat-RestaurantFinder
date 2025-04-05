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

- Displays key restaurant info:
  - **Name**
  - **Cuisines**
  - **Star Rating** (as a number, or `"N/A"` if missing)
  - **Address** (or `"Address: N/A"` if missing)
- Optional: **Restaurant logo image** from `logoUrl` if available
- Pull-to-refresh to reload results manually
- Full support for:
  - Missing data (fallback to `"N/A"`)
  - Network errors with user-friendly alerts
- Uses SwiftUI and Swift Concurrency (`async/await`)
- Postcode used: `DH14DG`

## How to Run it

1. Open the `.xcodeproj` file in Xcode
2. Set your deployment target to iOS 15 or later
3. Run the app in the simulator or on a device
4. Will load the first 10 restaurants for the postcode `DH14DG`

## Unit Tests

The project includes unit tests:
- Verifies that the ViewModel holds and exposes restaurant data correctly
- Mocks test data to validate formatting and default value handling
- Includes a test for the real network call returning at least 1 restaurant

### To run tests:

- Press **⌘ + 6** to open the Test Navigator
- Click the ▶️ next to any test, or run all with **⌘ + U**


## Assumptions

- The API’s `id` field is a string (not a UUID) — handled accordingly in the model.
- If any fields are missing in the API (like rating or address), default values are used.
- Assumes iOS 15+ so that Swift's async/await and `@MainActor` features are supported.
- I included restaurant logos as a visual enhancement, even though they weren’t required, to demonstrate SwiftUI image handling.
- ⚠️ The Just Eat API only works from within the UK. While developing outside the UK, I had to use a VPN with a UK-based IP address to receive a valid response.

## Improvements I'd make with more time

- Add a text field to allow users to input postcode dynamically
- Show a loading spinner while fetching

## Requirements
The app:
- Shows the required 4 data points
- Limits to the first 10 restaurants
- Includes this README with build and run instructions
- Handles unclear/missing fields gracefully  
- Uses Swift as required



