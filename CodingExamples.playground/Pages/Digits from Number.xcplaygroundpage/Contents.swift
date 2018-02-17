func digitsRecursive(_ number: Int) -> [Int] {
	guard number >= 10 else { return [number] }
	return digitsRecursive(number / 10) + [number % 10]
}

var test = digitsRecursive(1234567890)

func digitsIteritive(_ number: Int) -> [Int] {
	guard number >= 10 else { return [number] }

	var num = number
	var digits: [Int] = []

	while num >= 1 {
		digits.insert(num % 10, at: 0)
		num /= 10
	}

	return digits
}

var newTest = digitsIteritive(1234567890)

func powerRecursive(_ x: Int, _ y: Int) -> Int {
	guard y > 0 else { return 1 }
	return x * powerRecursive(x, y - 1)
}

func powerIterative(_ x: Int, _ y: Int) -> Int {
	guard y > 0 else { return 1 }
	return Array(repeating: x, count: y).reduce(1, *)
}

powerRecursive(100, 0)
powerRecursive(100, 1)
powerIterative(2, 2)
powerIterative(2, 10)

func gcdRecursive(_ a: Int, _ b: Int) -> Int {
	guard b != 0 else { return a }
	switch a > b {
	case true: return gcdRecursive(a - b, b)
	case false: return gcdRecursive(b, b - a)
	}
}

func gcdIterative(_ a: Int, _ b: Int) -> Int {
	var a = a
	var b = b

	while b > 0 {
		switch a > b {
		case true: a -= b
		case false: b -= a
		}
	}

	return a
}

gcdIterative(2, 10)
gcdIterative(30, 75)
