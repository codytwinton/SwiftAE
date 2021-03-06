/* Daily Coding Problem: Problem #41

This problem was asked by Facebook.

Given an unordered list of flights taken by someone, each represented as (origin, destination) pairs, and a starting airport, compute the person's itinerary. If no such itinerary exists, return null. If there are multiple possible itineraries, return the lexicographically smallest one. All flights must be used in the itinerary.

For example, given the list of flights [('SFO', 'HKO'), ('YYZ', 'SFO'), ('YUL', 'YYZ'), ('HKO', 'ORD')] and starting airport 'YUL', you should return the list ['YUL', 'YYZ', 'SFO', 'HKO', 'ORD'].

Given the list of flights [('SFO', 'COM'), ('COM', 'YYZ')] and starting airport 'COM', you should return null.

Given the list of flights [('A', 'B'), ('A', 'C'), ('B', 'C'), ('C', 'A')] and starting airport 'A', you should return the list ['A', 'B', 'C', 'A', 'C'] even though ['A', 'C', 'A', 'B', 'C'] is also a valid itinerary. However, the first one is lexicographically smaller.
*/

import Foundation

// MARK: Solution

func buildItinerary(start: String, flights: [(origin: String, destination: String)]) -> [String]? {

	guard !flights.isEmpty else { return nil }

	var itineraries: [[String]] = [[start]]
	var unplanned = flights

	while !unplanned.isEmpty {
		var index = 0

		// TODO: Save multiple itineraries
		for (i, flight) in unplanned.enumerated() {
			guard itineraries[0].last == flight.origin else { continue }
			index = i
			itineraries[0].append(flight.destination)
			break
		}

		unplanned.remove(at: index)
	}

	let sorted = itineraries.filter { $0.count == flights.count + 1 }.sorted { $0.lexicographicallyPrecedes($1) }
	guard let itinerary = sorted.first else { return nil }
	return itinerary
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = buildItinerary(start: input.start, flights: input.flights)

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")


