fibonnaci := Object clone

fibonnaci fibRecursive := method(n, current, previous, previousPrevious,
	if (current == nil, current = 1, current = current)
	if (current <= 2,
		number := 1
		previous := 1,
		number := previous + previousPrevious
	)
	if (n == current,
		"The fibonnaci number at position #{n} is #{number}" interpolate println,
		fibRecursive(n, current + 1, number, previous)
	)
)

fibonnaci fibLoops := method(n,
	current := 1
	number := 1
	previous := 1
	previousPrevious := 1
	loop(
		if (current <= 2,
			number = 1,
			number = previous + previousPrevious
			previousPrevious = previous
			previous = number
		)
		if (n == current, break, current = current + 1)
	)

	"The fibonnaci number at position #{n} is #{number}" interpolate println
)

numbersToFind := 20

"Finding numbers 1 - #{numbersToFind} in the Fibonnaci sequence using recusion" interpolate println
for (i, 1, numbersToFind, fibonnaci fibRecursive(i))

"Finding numbers 1 - #{numbersToFind} in the Fibonnaci sequence using loops" interpolate println
for (i, 1, numbersToFind, fibonnaci fibLoops(i))