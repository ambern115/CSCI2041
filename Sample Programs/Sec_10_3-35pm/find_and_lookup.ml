let m = [ ("dog", 1); ("chicken",2); ("dog",3); 
          ("cat",5)]

let rec lookup_all s m =
  match m with
  | [] -> []
  | (name,value)::ms -> 
     let rest = lookup_all s ms
     in if s = name  then value :: rest else rest

(* find all by : (’a -> ’a ->bool) -> ’a ->
                        ’a list -> ’a list
 *)

let find_all_with' f lst = 
    let g x y = f y in find_all_by g "ignore" lst

let rec find_all_by cmp elem lst =
  match lst with
  | [] -> []
  | x::xs -> if cmp elem x 
             then x :: find_all_by cmp elem xs
             else find_all_by cmp elem xs

let rec find_all_with f l =
  match l with
  | [] -> []
  | x::xs ->
     let rest = find_all_with f xs
     in if f x then x::rest else rest
(* cmp :: 'a -> ('b -> bool)  *)
let find_all_by' cmp elem lst = 
  find_all_with (cmp elem) lst

