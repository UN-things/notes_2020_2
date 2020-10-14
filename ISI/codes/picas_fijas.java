correct_number = int[ 4 ]   // * F
aux_number = int[ 4 ]
undefined = stack()         // * undefined digits
history = int[ 10 ][ 6 ]    // * steps X  ( number, P, F )
IN = int[10]                // ? IN + position?
number = int[ 4 ]           // * returned to user

total_prev = 0              // * P + F -> last step
total_curr = 0              // * P + F -> current step
replace = 0                 // * Digit to be changed
found = 0                   // * Correct digits found
step = 0


f( perception ) {
    // initial num
    if( perception == start() ) {
        for( i = 0; i < 4; i++ )
            number[i] = i + 1
        replace = 3
        undefined.push( number[ replace ] )
    } else {
        // F = 4
        if( perception[ 1 ] = 4 ) {
            end()
        // F = 0, P = 0
        } else if( ( perception[ 0 ] == 0 ) && ( perception[ 1 ] = 0 ) ) {
            // ! Discard digits
            for( i = 0; i < 4; i++ )
                IN[ number[ i ] ] = -1
        // P = 4
        } else if ( perception[ 0 ] == 4 ) {
            // Rotate digits
            aux_number = number
            for( i = 0; i < 4; i++ )
                number[ i ] = aux_number[ ( i + 1 ) % 4 ]
        } else {
            total_prev = history[ step - 1 ][ 4 ] + history[ step - 1 ][ 5 ]
            total_curr = perception[ 0 ] + perception[ 1 ]

            // * total_curr = total_prev
            if( total_curr - total_prev = 0 ) {
                // F ++
                if( perception[ 1 ] > history[ step - 1 ][ 5 ] ) {
                    // ! Actual = F, Previous = P
                    found += 2
                    // put F
                    correct_number[ replace ] = number[ replace ]
                    // indicate that the previous digit is P
                    IN[ history[ step - 1 ][ replace ] ] = 1
                    undefined.pop()
                // the same number P
                // F ==
                } else if( perception[ 1 ] = history[ step - 1 ][ 5 ] ) {
                    4, 5 = l() = 2 + t = 3
                    //undefined.push( number[ replace ] )
                    if( undefined.length() + total_curr > 4 ){
                        for( i = 0; i < undefined.length(); i++ ) {
                            IN[ undefined.pop() ] = -1
                        }
                    }
                // F --
                } else {
                    // ! Previous = F, Actual = P
                    found += 2
                    // put F = previous
                    correct_number[ replace ] = history[ step - 1 ][ replace ]
                    // indicate that the actual digit is P
                    IN[ number[ replace ] ] = 1
                    undefined.pop()
                }
            // total_curr != total_prev
            } else {                // F++
                if( perception[ 1 ] > history[ step - 1 ][5] ) {
                    // ! Actual = F, Previous -> delete
                    correct_number[ replace ] = number[ replace ]
                    IN[ history[ step -1 ][ replace ] ] = -1
                    undefined.pop()
                } else {
                    // ! Previous = F, Actual -> delete
                    correct_number[ replace ] = history[ step - 1 ][ replace ]
                    IN[ number[ replace ] ] = -1
                    undefined.pop()
                }
                // P++
                if( perception[ 0 ] > history[ step - 1 ][4] ) {
                    // !Actual = P, Previous -> delete
                    IN[ number[ replace ] ] = 1
                    IN[ history[ step -1 ][ replace ] ] = -1
                    undefined.pop()
                }else {
                    // ! Previous = P, Actual -> delete
                    IN[ number[ replace ] ] = -1
                    IN[ history[ step -1 ][ replace ] ] = 1
                    undefined.pop()
                }
            }
        }
        step ++
    }
    return number
}