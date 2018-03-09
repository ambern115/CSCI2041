(* Constructing lazy values in OCaml *)

type 'a lazee = 'a hidden ref

 and 'a hidden = Value of 'a 
               | Thunk of (unit -> 'a)

let delay (unit_to_x: unit -> 'a) : 'a lazee = ref (Thunk unit_to_x)

let force (l: 'a lazee) : unit = match !l with
  | Value _ -> ()
  | Thunk f -> l := Value (f ())

let rec demand (l: 'a lazee) : 'a = 
  force l; 
  match !l with
  | Value v -> v
  | Thunk f -> raise (Failure "this should not happen")



(* Streams, using lazy values *)
type 'a stream = Cons of 'a * 'a stream lazee

let rec from n = 
  print_endline ("step " ^ string_of_int n) ; 
  Cons ( n, 
         delay (fun () -> from (n+1) )
       )

let nats = from 1

