# merge-sort

This assignment is part of the Odin Project Curriculum.

This program contains the merge-sort algorithm. The user passes in any array, and the program will return the array completely sorted from least to greatest.

The basis of the merge-sort algorithm is to "divide and conquer". Essentially, the algorithm divides the array in half recursively into smaller and smaller sub-arrays till it has 2 sub-arrays of length 1. It then sends those two sub-arrays of length 1 to the sorting method which compares the sub-arrays and then appends them to an empty array in their correct order. Finally, the sorting method is called again to then compare the sorted numbers thus far with this newly sorted array, and then updates the sorted array to include these new elements.