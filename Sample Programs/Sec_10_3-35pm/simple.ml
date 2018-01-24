(* A collection of simple functions for used in introductory
   lectures on OCaml. 
   by Eric Van Wyk
 *)

let inc_v1 = fun x -> x + 1

let inc_v2 x = x + 1 

let square x = x * x

let cube x = x * x * x

let add x y = x + y

let inc_v3 = add 1

let add3 x y z = x + y + z

let greater x y = if x > y then x else y

let circle_area radius =
  let pi = 3.1415 in
     pi *. pi *. radius

let rec power : int -> (float -> float)
  = fun x ->
      ( fun y ->
          if x = 0 then 1.0 else y *. power (x-1) y )

let rec power_v2 exp base = if exp = 0 then 1.0
                            else base *. power_v2 (exp-1) base

let cube = power 3

let foo = cube 2.4
let bar = (power 3) 2.4

let gcd m n = 
  let smaller = if m < n then m else n
  in 
  let rec help guess = 
    if m mod guess = 0 && n mod guess = 0
    then guess
    else help (guess - 1)
  in
  help smaller


let rec sum xs =
  match xs with
  | [] -> 0 
  | x::rest -> x + sum rest

let rec all xs =
  match xs with
  | [] -> true
  | x::rest -> if x then all rest else false


let rec even2ways xs =
  match xs with
  | [] -> true
  | p::[] -> false
  | x1::x2::rest -> x1 mod 2 = 0 &&
                    x2 mod 2 = 0 && 
                    even2ways rest

(* an example of pattern matching on int values *)
let rec even x =
  match x with
  | 0 -> true
  | 1 -> false
  | _ -> even (x-2)



let rec string_concat ss = [] (* fill this in *)

(* Jan 24.  Note that:
   sum - process 1 at a time, look at 1 at a time
   evens2ways - process 2 at a time, look at 2 at a time
   string_concat - process 1 at a time, look at 2 at a time
 *)
