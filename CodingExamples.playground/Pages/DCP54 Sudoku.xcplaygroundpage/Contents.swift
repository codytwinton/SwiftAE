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
			let gridRowIndexStart = rowIndex / 3
			let gridColIndexStart = colIndex / 3

			let row = solution[rowIndex]
			let col = solution.reduce([], +).enumerated().filter { $0.offset % 9 == colIndex }.map { $0.element }

			var grid: [Int] = []

			for (rI, row) in solution.enumerated() {
				guard rI >= gridRowIndexStart, rI < gridRowIndexStart + 3 else { continue }
				for (cI, item) in row.enumerated() {
					guard cI >= gridColIndexStart, cI < gridColIndexStart + 3 else { continue }
					grid.append(item)
				}
			}

			let options = [1, 2, 3, 4, 5, 6, 7, 8, 9].filter { !row.contains($0) && !col.contains($0) && !grid.contains($0) }
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

