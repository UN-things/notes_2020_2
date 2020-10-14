                1
              /    \
            2       3
          /    \      \
        4       5       6

class Node {
    Node R -> null
    Node L -> null
}

Node nodeF = new Node()

Node node1 = new Node()
nodeF.R = node1;



class node {
    value = int[3]
    children = Node list()
    isVisited = false
}

walk = int[3] list()

DFS ( tree, n ) {
    walk.push( n )
    n.isVisited = true;
    children = n.children

    for( node in children ) {
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

        if( node.value[1] > node. ) {

        }
        if ( !node.isVisited ) {
            DFS( tree, node )
        }
    }
}

