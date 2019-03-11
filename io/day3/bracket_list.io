squareBrackets := method(
	list := List clone
	call message arguments foreach(arg,
		list push(arg)
	)
)

things := [
	"Lamp",
	"vacuum",
	"car"
]

things println
things at(1) println