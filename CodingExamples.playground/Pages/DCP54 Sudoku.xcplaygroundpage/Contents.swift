import Foundation

/* This problem was asked by Dropbox.

Sudoku is a puzzle where you're given a partially-filled 9 by 9 grid with digits. The objective is to fill the grid with the constraint that every row, column, and box (3 by 3 subgrid) must contain all of the digits from 1 to 9.

Implement an efficient sudoku solver.

var input = [
	[3, 0, 6, 5, 0, 8, 4, 0, 0],
	[5, 2, 0, 0, 0, 0, 0, 0, 0],
	[0, 8, 7, 0, 0, 0, 0, 3, 1],
	[0, 0, 3, 0, 1, 0, 0, 8, 0],
	[9, 0, 0, 8, 6, 3, 0, 0, 5],
	[0, 5, 0, 0, 9, 0, 6, 0, 0],
	[1, 3, 0, 0, 0, 0, 2, 5, 0],
	[0, 0, 0, 0, 0, 0, 0, 7, 4],
	[0, 0, 5, 2, 0, 6, 3, 0, 0]
],

var expected = [
	[3, 1, 6, 5, 7, 8, 4, 9, 2],
	[5, 2, 9, 1, 3, 4, 7, 6, 8],
	[4, 8, 7, 6, 2, 9, 5, 3, 1],
	[2, 6, 3, 4, 1, 5, 9, 8, 7],
	[9, 7, 4, 8, 6, 3, 1, 2, 5],
	[8, 5, 1, 7, 9, 2, 6, 4, 3],
	[1, 3, 8, 9, 4, 7, 2, 5, 6],
	[6, 9, 2, 3, 5, 1, 8, 7, 4],
	[7, 4, 5, 2, 8, 6, 3, 1, 9]
]
*/

extension Array where Iterator.Element == [Int] {

	func solveSudoku() -> [Element] {
		var solution = self

		let emptyIndexs = reduce([], +).enumerated().filter { $0.element == 0 }.map { $0.offset }

		for index in emptyIndexs {
			let rowIndex = index / 9
			let colIndex = index % 9
			let gridRowStart = rowIndex / 3
			let gridColStart = colIndex / 3

			var taken = solution[rowIndex].filter { $0 != 0 }

			for (i, row) in solution.enumerated() {
				for (j, item) in row.enumerated() {
					guard j == colIndex || (i >= gridRowStart && i < gridRowStart + 2 && j >= gridColStart && j < gridColStart + 2) else { continue }
					guard item != 0 else { continue }
					taken.append(item)
				}
			}

			let options = [1, 2, 3, 4, 5, 6, 7, 8, 9].filter { !taken.contains($0) }
			//print("options for rowIndex \(rowIndex) and colIndex \(colIndex) \(options)")
		}

		return solution
	}
}

// MARK: Tests

let testDate = Date()
print("Tests Started\n\n---\n")

for test in TestData.tests {
	// Arrange
	let input = test.input

	// Act
	let actual = input.solveSudoku()

	// Assert
	test.assert(with: actual)
}

print("---\n\nTests Ended:\n\telapsed: \(Date().timeIntervalSince(testDate))")

