NewList := List clone
NewList dim := method(x, y,
	self lists := List clone
	for(i, 1, y,
		list := List clone
		for(j, 1, x,
			list append("")
		)
		lists append(list)
	)
)
NewList set := method(x, y, value,
	listToSet := lists at(y)
	listToSet atPut(x, value)
)
NewList get := method(x, y,
	listToGet := lists at(y)
	listToGet at(x)
)

myList := NewList clone
myList dim(10, 5)
myList set(0, 0, "first")
myList set(9, 4, "last")
myList set(4, 2, "middle")
firstValue := myList get(0, 0)
lastValue := myList get(9, 4)
middleValue := myList get(4, 2)

"The value at 0, 0 is #{firstValue}" interpolate println
"The value at 9, 4 is #{lastValue}" interpolate println
"The value at 4, 2 is #{middleValue}" interpolate println