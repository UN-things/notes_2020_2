
memory = list( arr[3] )
output = arr[ 3 ]

/*
        C   M   T   C   M
        1 - 2  -1   2  - 1   1
        0 - 2  -2   3  - 1   2
        0 - 1  -1   3  - 2   1

// acep
        1 - 3   -2  2 - 0   2
        2 - 3   -1  1 - 0   1
        2 - 2   0   1 - 1   0
        1 - 0   1   2 - 3   -1
        1 - 1   0   2 - 2   0
        2 - 0   2   1 - 3   -2


        2 - 1   1   1 - 2   -1
        3 - 1   2   0 - 2   -2
        3 - 2   1   0 - 1   -1
        3 - 0   3   0 - 3   -3
*/

f( perception ) {
    if( (perception == ( 1, 3, 3 ) ) && ( !memory.contain(perception) )) {
        memory.push( perception );
    } else {
        if( perception[ 1 ] > perception[ 2 ] ){
            break;
        } else {
            if( perception[ 1 ] == perception[ 2 ] )
                continue;
            else {
                l_cann = 3 - perception[ 1 ]
                l_miss = 3 - perception[ 2 ]

                if( l_miss > 0 ) {
                    if( l_cann <= l_miss )
                        break;
                } else {
                    continue;
                }
            }
        }

    }
}