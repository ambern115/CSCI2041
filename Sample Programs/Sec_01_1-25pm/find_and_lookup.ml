let m = [ ("dog", 1); ("chicken",2); ("dog",3); ("cat",5)]

let rec lookup_all s m =
  match m with
  | [] -> []
  | (name,value)::ms -> 
     let rest = lookup_all s ms
     in if s = name  then value :: rest else rest

(* find all by : (’a -> ’a ->bool) -> ’a ->
                        ’a list -> ’a list
 *)

let rec find_all_by eq elem lst =
  match lst with
  | [] -> []
  | x::xs when eq elem x -> x :: find_all_by eq elem xs
  | _::xs -> find_all_by eq elem xs

let rec find_all_with f l =
  match l with
  | [] -> []
  | x::xs ->
     let rest = find_all_with f xs
     in if f x then x::rest else rest

let find_all_by' eq elem lst = find_all_with (eq elem) lst

let find_all_with' f lst = let g x y = f y in find_all_by g "0" lst
