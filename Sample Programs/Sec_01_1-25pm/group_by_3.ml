let even x = x mod 2 = 0
let ns = [1;2;3;4;5;6;7;8;9;10]
let partition p lst =
  let accum = ( [], [] )
  in
  let f (trues, falses) x = if p x then (x::trues, falses) 
                            else (trues, x::falses)
  in 
  let (ts, fs) = List.fold_left f accum lst
  in (List.rev ts, List.rev fs)

let rec append xs ys =
  match xs with
  | [] -> ys
  | z::zs -> z :: (append zs ys)


let group_by_3 lst =
  let accum = ( [], [], 0)
  in
  let f (sublists, current, size) x =
    if size = 3 
    then ( List.rev current :: sublists , [x], 1 )
    else ( sublists, x :: current, size + 1 )
  in
  let (lsts, curr, size) = List.fold_left f accum lst 
  in
  List.rev (List.rev curr :: lsts)
