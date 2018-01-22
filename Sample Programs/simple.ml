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
          = fun exponent base ->
              if exponent < 0
              then power (0-exponent) (1.0 /. base)
              else 
              if exponent = 0
              then 1.0  
              else base *. power (exponent-1) base

let cube = power 3 

let gcd m n =
  let smaller = if m < n then m else n
  in
  let rec f guess =
      if m mod guess = 0 && n mod guess = 0 then guess
      else f (guess - 1)

  in
  f smaller

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
  | x::[] -> false
  | x1::(x2::rest) -> if x1 mod 2 = 0 && x2 mod 2 = 0 
                        && even2ways rest  then true else false

let rec even2ways_better xs =
  let even x = x mod 2 = 0
  in match xs with
     | [] -> true 
     | x::[] -> false
     | x1::(x2::rest) ->
        x1 mod 2 = 0 && x2 mod 2 = 0 && even2ways rest 
