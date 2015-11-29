# Code exercises in Common Lisp for
# The Little Schemer, 4th Ed. (Friedman/Felleisen)

While working through "The Little Schemer", I wanted to do the code exercises in Common Lisp. Feel free to let me know about any bugs or non-idiomatic code.

### The Ten Commandments

1. The First Commandment

    When recurring on a list of atoms, *lat*, ask two questions about it: (*null lat*) and **t**.
    When recurring on a number, *n*, ask two questions about it: (*zerop n*) and **t**.
    When recurring on a list of S-expressions, *l*, ask three questions about it: (*null l*), (*atom* (*car l*)), and **t**.


2. The Second Commandment

    Use *cons* to build lists.


3. The Third Commandment

    When building a list, describe the first typical element, and then *cons* it onto the natural recursion.

