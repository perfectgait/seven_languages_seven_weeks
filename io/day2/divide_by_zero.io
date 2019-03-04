divide := Number getSlot("/")
Number / := method(denominator,
	if(denominator == 0, 0, divide(denominator))
)

10 / 2 println
10 / 0 println