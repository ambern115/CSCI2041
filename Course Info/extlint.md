# Extlint Lints

This is a list of the lints currently enforced by extlint.

## Equality with `true` or `false`

**Example**: `x = true` / `x = false`

**Suggestion**: `x` / `not x`

**Rationale**:
Comparing against `true` is always useless -- `x` is `true` if `x = true` is `true`, and `x` is `false` if `x = true` is false.
Similarly, `x = false` is the same as `not x`.

## Redundant If

**Example**: `if List.mem x xs then true else false`

**Suggestion**: `List.mem x xs`

**Rationale**:
See "Equality with `true` or `false`" -- this is another case where a long boolean expression is the same as a short one.

## Pointer Equality

**Example**: `foo == bar`

**Suggestion**: `foo = bar`

**Rationale**:
In OCaml, `==` checks if two objects are at the same location in memory, similar to `==` in Java or `is` in Python.
Instead, you almost definitely want `=`, which is similar to `.equals()` in Java or `==` in Python.
Similarly, `<>` should be used instead of `!=`.

## Useless Let

**Example**: `let ids = List.map x500 students in ids`

**Suggestion**: `List.map x500 students`

**Rationale**:
The `ids` variable (or whatever it's called in your code) serves no use here.

## Partial List Function

**Example**: `helper (List.tl l)`

**Suggestion**: Use pattern matching instead.

**Rationale**:
Partial functions (those that throw errors) are frowned upon in functional languages, especially when pattern matching will do the job better.

## If-Then Without an Else

**Example**: `if List.for_all finished_lab students then sum (List.map lab_score students)`

**Suggestion**: Add an `else`

**Rationale**:
In OCaml, an `if` expression without an `else` is valid, but must have type `()`.
This is almost never what you want.
