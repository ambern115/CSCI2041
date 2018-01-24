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

let rec string_concat ss = [] (* fill this in *)

(* Jan 24.  Note that:
   sum - process 1 at a time, look at 1 at a time
   evens2ways - process 2 at a time, look at 2 at a time
   string_concat - process 1 at a time, look at 2 at a time
 *)

