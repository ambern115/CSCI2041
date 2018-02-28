# Lab 7: Practice reasoning about correctness problems
[comment]: ---------------------------------------------------------------79->|

*CSci 2041: Advanced Programming Principles, Spring 2018*

In today's lab you have 2 practice problems to work on.  These are
similar to the problems in Homework 3.  There is also some advice at
the end of this document that may be useful in completing Homework 3.

**Changelog:**
+ Wednesday, February 28: (Sean) **Problem 2** has two new sub-headings with
sample quiz questions and a high-scoring reference solution (as if it were a
quiz problem).


## Problem 1: Length of lists

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

## Problem 2: List length and reverse

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

Your proof may refer to the definition of ``length`` in the previous
problem.  Your proof must explicitly and clearly indicate the base
case you prove, the inductive case you prove and what the inductive
hypothesis provides in the proof.

Each step in your proof must be accompanied by a justification
describing why that step could be taken.

### Problem 2 sample quiz questions
If problem 2 appeared on a quiz, the above definition would appear on the quiz
and several questions would lead you through an inductive proof. Here are the
questions:

1. What is the principle of induction on lists that you will need to complete
the proof?

2. What is the _base_ case you must prove?

3. Prove the base case. In your proof, each step much have a justification.

4. What is the _inductive_ case you must prove?

5. In the inductive case, what is the inductive hypothesis?

6. Prove the inductive case. Each step in your proof must include a
justification.

Try answering the above questions in your head before moving on.

### Problem 2 high-scoring reference solution
[comment]: ---------------------------------------------------------------79->|
Here is a reference solution for the above question set. If problem 2 (or
similar) appeared on a quiz and a student gave an answer with this structure,
the student would receive a substantial portion of the points.

_Following this structure means you've learned it and are able to follow it.
This is what we want you to demonstrate._

Here are the questions again, with high-scoring reference answers:

1. What is the principle of induction on lists that you will need to complete
the proof?

> **Solution:**
```
∀x, P(x) holds if P([]) holds and P(t) ⇒ P(h :: t)
```

2. What is the _base_ case you must prove?

> **Solution:**
```
length (reverse []) = length []
```

3. Prove the base case. In your proof, each step much have a justification.

> **Solution:**
```
  length (reverse [])
= length [], by def of reverse
```

4. What is the _inductive_ case you must prove?

> **Solution:**
```
length (reverse (x::xs)) = length (x::xs)
```

5. In the inductive case, what is the inductive hypothesis?

> **Solution:**
```
length (reverse xs) = length xs
```

6. Prove the inductive case. Each step in your proof must include a
justification.

> **Solution:**
```
  length (reverse (x::xs))
= length (reverse xs @ [x]),        by def of reverse
= length (reverse xs) + length [x], by properties of length proven in problem 1
= length xs + length [x],           by induction hyp
= length [x] + length xs,           by commutativity (addition)
= length ([x] @ xs),                by properties of length
= length (x::xs),                   by properties of @
```

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
