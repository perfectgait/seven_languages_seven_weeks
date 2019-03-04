evens := list(0, 2, 4, 6, 8, 10)
odds := list(1, 3, 5, 7, 9)
numbers := list(evens, odds)
total := 0

numbers foreach(value,
	value foreach(subvalue, total = total + subvalue)
)

"The total is #{total}" interpolate println