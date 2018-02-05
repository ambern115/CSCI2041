(* Various demonstrations of higher order functions.

   Eric Van Wyk, January 2018.

 *)

let implode (cs: char list) : string =
  String.concat "" (List.map  (String.make 1) cs)

let explode (s: string) : char list =
  let l = String.length s
  in
  let rec f i = 
    if i = l then [] else s.[i] :: f (i+1)
  in f 0

let rec map f l =
  match l with
  | [] -> []
  | x::xs -> f x :: map f xs


let rec filter f l =
  match l with
  | [] -> [] 
  | x::xs -> 
     let rest = filter f xs 
     in
     if f x 
     then x :: rest
     else rest

let rec filter' f l =
  match l with
  | [] -> []
  | x::xs when f x -> x :: filter f xs
  | x::xs -> filter f xs

let filter_out f l = filter (fun v -> not (f v)) l

let rec foldl (f: 'b -> 'a -> 'b) (accum: 'b) (lst: 'a list) : 'b =
  match lst with
  | [] -> accum
  | x::xs -> foldl f (f accum x) xs

let rec foldr (f: 'a -> 'b -> 'b) (lst: 'a list) (base: 'b) : 'b = 
  match lst with
  | [] -> base
  | x::xs -> f x (foldr f xs base)

let rev xs = foldl (fun es e -> e :: es ) [] xs


let inc_all_by n xs = 
  (* Note that f refers to n, a values that is not an
     argument to f. *)
  let f x = x + n
  in
  List.map f xs

let removeABCD cs =
  let notABCD = function
    | 'A' | 'B' | 'C' | 'D' -> false
    | _ -> true
  in
  filter notABCD cs
