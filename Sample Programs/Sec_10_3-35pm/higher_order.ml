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

let rec map f lst =
  match lst with
  | [] -> [] 
  | x::xs -> f x :: map f xs

let inc_all_by n xs = 
  (* Note that f refers to n, a values that is not an
     argument to f. *)
  let f x = x + n
  in
  List.map f xs

let rec filter f lst =
  match lst with
  | [] -> []
  | x::xs -> if f x 
             then x :: filter f xs
             else filter f xs

let removeABCD =
  let check = function
    | 'A' | 'B' | 'C' | 'D' -> false
    | _ -> true
  in List.filter check

let rec foldr f  lst base =
  match lst with
  | [] -> base 
  | x::xs -> f x (foldr f xs base)

let rec foldl f accum lst =
  match lst with
  | [] -> accum 
  | x::xs -> foldl f (f accum x) xs

let rec foldl' f lst accum =
  match lst with
  | [] -> accum 
  | x::xs -> foldl' f xs (f x accum) 

let length lst =
  foldl (fun accum _ -> 1 + accum) 0 lst

(* [ 1;2;3]
 
   1 :: (2 :: (3 :: []))

   1 +  (2 +  (3 +  0 ))

 sum lst = foldr (+) lst 0
 *)
