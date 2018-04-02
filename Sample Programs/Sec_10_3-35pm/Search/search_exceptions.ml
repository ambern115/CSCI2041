
(* Some preliminaries, as seen before. *)
let s = [ 1; 3; -2; 5; -6 ]   (* sample set from the S6 slides *)

let sum lst = List.fold_left (+) 0 lst

let show_list show l =
  let rec sl l =
    match l with 
    | [] -> ""
    | [x] -> show x
    | x::xs -> show x ^ "; " ^ sl xs
  in "[ " ^ sl l ^ " ]"


 (* --- 
   Exceptions 
   ---
 *)


(* We can also use exceptions in searching.  This goes against the
   general principle of only throwing an exception for truly
   unexpected results, but it does make writing the code a bit more
   convenient, so we will use them in this non-traditional way.

   In our first usage, an exception is thrown when we've found the
   value that we want and this quickly returns us to the top level
   where we can then report success.

   We now execute the two recursive calls to 'try_subset' in sequence,
   not needing to inspect the output of the first one.  If the first
   call finds a solution then it will raise an exception.  So we
   don't care about the value returned by that first call.  If it
   returns it only does so if it didn't find a solution, in which case
   we want to just keep searching.
 *)

exception FoundSubSet of int list 

(* The subsetsum function that raises an exception on finding a
   solution. 
 *)
let subsetsum_exn_on_found (lst: int list) : int list option =
  let rec try_subset partial_subset rest_of_the_set : unit =
    if sum partial_subset = 0 && 
       partial_subset <> [] && 
       rest_of_the_set = []
    then raise (FoundSubSet partial_subset)
    else match rest_of_the_set with
         | [] -> ()
         | x::xs -> try_subset (x::partial_subset) xs ;
                    try_subset partial_subset xs 

  in try try_subset [] lst ; None with
     | FoundSubSet result -> Some (List.rev result)











(* Another way to use exceptions in searching is to raise an exception
   when we the search process has reached a deadend or the found
   solution is not acceptable.

   In both cases we want to keep looking.  Thus we create a
   "KeepLooking" exception.
 *)
exception KeepLooking

(* In this example, we raise an exception when we reach a deadend in
   the search process.  This exception is caught in one of two places.

   The first is at the point where there are more possibilities to
   explore, and thus another call to try_subset is made.

   The second is at the point where there are no more possibilities
   and thus we catch the exeption and return None.
 *)

let subsetsum_exn_not_found (lst: int list) : int list option =
  let rec try_subset partial_subset rest_of_the_set : int list =
    if sum partial_subset = 0 && 
       partial_subset <> [] && 
       rest_of_the_set = []
    then List.rev partial_subset
    else match rest_of_the_set with
         | [] -> raise KeepLooking
         | x::xs -> try try_subset (x::partial_subset) xs with
                    | KeepLooking -> try_subset partial_subset xs

   in try Some (try_subset [] lst) with
      | KeepLooking -> None 
 
