Treenode
========

An instance of `Treenode` can store a value and add children, setting their parent attributes to itself.
In this way a tree data-structure is created.
The tree is searchable via:
- `#dfs`  Depth First Search, where the target value is recursively looked for in a given node's children before its siblings.
- `#bfs`  Breadth First Search, uses a queue to look for the value in the node's siblings before any children are searched.
- Both searches will return the first node that has the target value, or `nil` if none is found.
- `#path` will get all of the values of a given node's parents up to the root node and return those values in an array.

Knight Path Finder
==================

`KnightPathFinder` uses Breadth First Search to find a path to any square on a chess board given a starting point, using the Knight's "L-shaped" movement rule.

