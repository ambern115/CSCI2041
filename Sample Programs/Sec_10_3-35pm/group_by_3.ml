let even x = x mod 2 = 0
let ns = [1;2;3;4;5;6;7;8;9;10]
let partition_l p lst = 
  let f (successes,failures) x = 
    if p x
    then (x::successes, failures)
    else (successes, x::failures)
  in
  let (successes_backwards, failures_backwards) =
    List.fold_left f ([], []) lst 

  in
  (List.rev successes_backwards, List.rev failures_backwards)

let partition_r p lst = 
  let f x (successes,failures) = 
    if p x
    then (x::successes, failures)
    else (successes, x::failures)
  in
  List.fold_right f lst ([], []) 

let group_by_3 lst =
  let accum = ( [], [], 0 )
  in
  let f (all_groups, current_group, size) x =
    if size = 3
    then ( (List.rev current_group) :: all_groups, 
           [x], 1 )
    else ( all_groups, x::current_group, size+1)
  in
  let (groups, last, _) = List.fold_left f accum lst
  in List.rev ( List.rev last :: groups)


let rec append xs ys = 
  match xs with
  | [] -> ys
  | z::zs -> z :: (append zs ys)
