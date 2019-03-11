Builder := Object clone

Builder depth ::= 0;

Builder forward := method(
	prefix := ("\t" repeated(self depth()))
	methodName := call message name

	writeln(prefix, "<", methodName, ">")

	self setDepth(self depth + 1)

	call message arguments foreach(arg,
		content := self doMessage(arg)
		if(content type == "Sequence", writeln(prefix, "\t", content))
	)

	self setDepth(self depth - 1)

  	writeln(prefix, "</", methodName, ">")
)

Builder ul(
	li("Io"),
	li("Lua"),
	li("JavaScript")
	li(
		strong("HEY")
	)
)