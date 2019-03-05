randomNumber := Random value(100) ceil
guessCount := 1
maximumGuesses := 10
standardInput := File standardInput
guessedIt := false
previousDifference := nil

randomNumber println

while(guessCount <= maximumGuesses,
	"Enter your guess between (1-100): " print
	guess := standardInput readLine

	if(guess asNumber == randomNumber asNumber,
		"You got it!" println
		guessedIt = true
		break,
		difference := (guess asNumber - randomNumber asNumber) abs

		if(guessCount > 1 and difference < previousDifference,
			"Warmer" println
		)

		if(guessCount > 1 and difference > previousDifference,
			"Colder" println
		)

		if(guessCount == 1,
			"Not quite, try again" println
		)

		previousDifference := (guess asNumber - randomNumber asNumber) abs
	)

	guessCount = guessCount + 1
)

if(guessedIt == false,
	"The number was #{randomNumber}" interpolate println
)

standardInput close