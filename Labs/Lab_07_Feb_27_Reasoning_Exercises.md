# Lab 7: Practice reasoning about correctness problems

*CSci 2041: Advanced Programming Principles, Spring 2018*

In today's lab you have 2 practice problems to work on.  These are
similar to the problems in Homework 3.  There is also some advice at
the end of this document that may be useful in completing Homework 3.



## Problem 1 Length of lists

Consider the following function over lists:
```
let rec length = function 
  | [] -> 0  
  | x:xs -> 1 + length xs
```

What is the principle of induction for the ``list`` type?

Using induction show that
```
  length (l @ r) = length l + length r
```

In doing so, you may want to use properties of list like the following:
```
 (l1 {@} l2) {@} l3 = l1 {@} (l2 {@} l3) 
 x :: xs = [x] {@} xs
```

Your proof must explicitly and clearly indicate the base case you
prove, the inductive case you prove and what the inductive hypothesis
provides in the proof.

Each step in your proof must be accompanied by a justification
describing why that step could be taken.

## Problem 2 List length and reverse

Recall our function for reversing a list:
```
let rec reverse l = match l with 
  | [ ] -> [ ]
  | x::xs -> reverse xs @ [x]
```

Using induction show that
```
   length (reverse l) = length l
```

Your proof may refer to the definition of ``length``` in the previous
problem.  Your proof must explicitly and clearly indicate the base
case you prove, the inductive case you prove and what the inductive
hypothesis provides in the proof.

Each step in your proof must be accompanied by a justification
describing why that step could be taken.


## Writing and using lemmas

Sometimes in writing inductive proofs we need additional information
to justify a particular step that is not based directly on arithmetic,
properties of lists (like seen in Problem 1 above), or on the
definition of a function.

That is, sometimes you may need to state, and then prove, a lemma that
can be used in the main proof of a problem.

For example, in problem 3 on Homework 3, it may be helpful to state,
and prove, the following:
```
  append lst [] = lst
```

Showing that ``append [] lst`` is very easy since it follows directly
from the definition of ``append``.  The statement above requires a
proper inductive argument.  Once this has been proven, you may find
reason to use it in your proof for Problem 3 in Homework 3.

## Nothing to turn in.

You are expected to work through these problems during lab. Doing so
will help you complete the homework. Failure to do so will make the
homework more difficult.  There is nothing to turn in for this lab.
