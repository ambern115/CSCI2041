type color = Red | Green | Blue 

let isRed c = 
  match c with
  | Red -> true
  | Green -> false
  | Blue -> false

type weekday = Mon | Tue | Wed | Thr | Fri | Sat | Sun

let isWorkDay d =
  match d with
  | Sat | Sun -> false
  | _ -> true

type intorstr = Int of int | Str of string

type coord = float * float
type circ_desc = coord * float
type tri_desc = coord * coord * coord
type sqr_desc = coord * coord * coord * coord

type shape = 
   Circle of circ_desc 
 | Triangle of tri_desc 
 | Square of sqr_desc

let area (s: shape) : float =
  match s with
  | Circle ( _, r ) -> 3.1415 *. r *. r
  | _ -> 45.0

