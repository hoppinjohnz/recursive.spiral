
Recursive Matrix Spiral Output
======

#### Example:

For an input matrix

```
1   2  3  4  5
6   7  8  9 10
11 12 13 14 15
16 17 18 19 20
21 22 23 24 25
```

this program outputs the following clockwise spiral order

```
1, 2, 3, 4, 5, 10, 15, 20, 25, 24, 23, 22, 21, 16, 11, 6, 7, 8, 9, 14, 19, 18, 17, 12, 13
```

#### Notes

This is a divide and conquer algorithm.  The outer round cricle plus the center leftover consists of itself.  The center leftover is one less in size of the original problem.  See code for details.

Run command to see the result
```
  ruby spiral.rb
```

