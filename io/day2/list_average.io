List myAverage := method(
	if(isEmpty, 
		0,
		total := 0
		foreach(value,
			if (value type != "Number", Exception raise("Not all of the values are numbers"))
			total = total + value
		)
		total / size
	)
)

myList := list(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
myList myAverage println