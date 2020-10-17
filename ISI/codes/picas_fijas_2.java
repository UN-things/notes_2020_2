history = int[ 16 ][ 2 ]    // * steps X  ( P, F )
position = int[ 5 ][ 4 ]    // ? | Digit | 0 | 1 | 2 | 3 | -> -1 or 1
undefined = stack()         // It is not known if the number is correct or not
number = int[ 4 ]           // Returned
temp = int[ 4 ]
IN = int[ 10 ]               // * Digit is correct = 1 || Digit is wrong = -1
F = int[ 4 ]                // Initialize -1
P = queue()                 // * Check

major_digit = 0             // History of digits used
total_prev = 0              // P + F -> last step
total_curr = 0              // P + F -> current step
replace = 3                 // Position in which a digit is to be replaced
found = 0                   // number of correct digits
step = 0

Agent( perception ) {
    // Initial num
    if( perception == start() ) {
        for( i = 0; i < 4; i++ ) {
            number[i] = i + 1
            major_digit ++
        }
        undefined.push( number[ replace ] )
    } else {
        // F = 4
        if( perception[ 1 ] == 4 ) {
            end()
        // F = 0, P = 0
        } else if( ( perception[ 0 ] == 0 ) && ( perception[ 1 ] = 0 ) ) {
            // ! Discard digits
            for( i = 0; i < 4; i++ )
                IN[ number[ i ] ] = -1
            undefined.pop()

|           // ! Generate new number
            for( i = 0; i < 4; i++ )
                for( j = 0; j < IN.length(); j++ )
                    if( IN[ j ] == 0 ) // ? check
                        number[ i ] = j
            undefined.push( number[ replace ] )
        // P = 4
        } else if ( perception[ 0 ] == 4 ) {
            // Rotate digits
            temp = number
            for( i = 0; i < 4; i++ )
                number[ i ] = temp[ ( i + 3 ) % 4 ]
            // ? Save positions
            // Complete
        } else {
            total_prev = history[ step - 1 ][ 0 ] + history[ step - 1 ][ 1 ]
            total_curr = perception[ 0 ] + perception[ 1 ]

            // * total_curr == total_prev
            if( total_curr - total_prev == 0 ) {

                /*
                S   P   F
                0   1   0
                1   0   1
                */
                // F ++
                if( perception[ 1 ] > history[ step - 1 ][ 5 ] ) {
                    // ! Actual = F, Previous = P
                    found += 2
                    // Put F
                    F[ replace ] = undefined.pop()
                    // indicate that the previous digit is P
                    IN[ undefined.pop() ] = 1
                    replace --

                // F == && P ==
                } else if( perception[ 1 ] == history[ step - 1 ][ 1 ] ) {
                    // Improve
                    if( ( undefined.length() + total_curr + found ) > 4 ){
                        for( i = 0; i < undefined.length(); i++ ) {
                            IN[ undefined.pop() ] = -1
                        }
                    }

                // F --
                } else {
                    // ! Previous = F, Actual = P
                    found += 2
                    // indicate that the actual digit is P
                    IN[ undefined.pop() ] = 1
                    // put F = previous
                    F[ replace ] = undefined.pop()
                    number[ replace ] = F[ replace ]
                    replace --
                }

            // * total_curr != total_prev
            } else {
                // F++
                if( perception[ 1 ] > history[ step - 1 ][ 1 ] ) {
                    // ! Actual = F, Previous -> delete
                    F[ replace ] = undefined.pop()
                    IN[ undefined.pop() ] = -1
                    replace --
                // F --
                } else {
                    // ! Previous = F, Actual -> delete
                    IN[ undefined.pop() ] = -1
                    F[ replace ] = undefined.pop()
                    number[ replace ] = F[ replace ]
                    replace --
                }

                // P++
                if( perception[ 0 ] > history[ step - 1 ][ 0 ] ) {
                    // !Actual = P, Previous -> delete
                    IN[ undefined.pop() ] = 1
                    IN[ undefined.pop() ] = -1
                // P --
                }else {
                    // ! Previous = P, Actual -> delete
                    IN[ undefined.pop() ] = -1
                    IN[ undefined.pop() ] = 1
                }
                found ++

                // Generate new number
                number[ replace ] = (++major_digit % 10)
            }
        }
        step ++
    }
    return number
}


