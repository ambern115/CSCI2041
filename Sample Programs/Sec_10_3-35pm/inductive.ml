type color = Red | Green | Blue

type weekday = Mon | Tue | Wed | Thu | Fri | Sat | Sun 

type boolean = True | False

let isRed c =
  match c with
  | Red -> true
  | Green -> false
  | Blue -> false

let isWorkday d =
  match d with
  | Sat | Sun -> false
  | _ -> true

type intorstr = Int of int | Str of string

type coord = float * float
type circ_desc = coord * float
type tri_desc = coord * coord * coord
type sqr_desc = coord * coord * coord * coord

type shape =
  | Circ of circ_desc
  | Tri of tri_desc
  | Sqr of sqr_desc

let isRect = function
  | Sqr _ -> true
  | _ -> false

let area s =
  match s with
  | Circ ( (_,_), r ) -> 3.1415 *. r *. r
  | Tri _ -> 45.0

