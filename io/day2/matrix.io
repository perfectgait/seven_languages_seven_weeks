Matrix := List clone
Matrix dim := method(x, y,
	self lists := List clone
	for(i, 1, y,
		list := List clone
		for(j, 1, x,
			list append("")
		)
		lists append(list)
	)
)
Matrix set := method(x, y, value,
	listToSet := lists at(y)
	listToSet atPut(x, value)
)
Matrix get := method(x, y,
	listToGet := lists at(y)
	listToGet at(x)
)
Matrix writeToFile := method(fileName,
	file := File with(fileName)
	file remove
	file openForUpdating

	for(i, 0, lists size - 1,
		currentList := lists at(i)

		for(j, 0, currentList size - 1,
			# currentList at(j) println
			currentValue := if(currentList at(j) == nil, "", currentList at(j))
			file write("#{currentValue}" interpolate)
			
			if(j != currentList size - 1,
				file write(",")
			)
		)

		if (i != lists size - 1,
			file write("\n")
		)
	)

	file close
)

Matrix readFromFile := method(fileName,
	file := File with(fileName)
	file openForReading
	contents := file readToEnd
	rows := contents split("\n")
	numberOfColumns := rows at(0) split(",") size
	dim(numberOfColumns, rows size)

	for(i, 0, rows size - 1,
		row := rows at(i) split(",")

		for(j, 0, row size - 1,
			set(j, i, row at(j))
		)
	)

	file close
)

matrix := Matrix clone
matrix dim(10, 5)
matrix set(0, 0, "first")
matrix set(9, 4, "last")
matrix set(4, 2, "middle")
firstValue := matrix get(0, 0)
lastValue := matrix get(9, 4)
middleValue := matrix get(4, 2)

"The value at 0, 0 is #{firstValue}" interpolate println
"The value at 9, 4 is #{lastValue}" interpolate println
"The value at 4, 2 is #{middleValue}" interpolate println

matrix writeToFile("new_matrix.txt")

matrixFromFile := Matrix clone
matrixFromFile readFromFile("matrix.txt")

for(i, 0, 4,
	for(j, 0, 9,
		matrixFromFile get(j, i) print

		if(j != 9,
			"," print
		)
	)

	"\n" print
)