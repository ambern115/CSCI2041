type expr 
  = Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr
  
  | Lt of expr * expr
  | Eq of expr * expr
  | And of expr * expr
  | Not of expr

  | If of expr * expr * expr

  | Let of string * expr * expr
  | Id of string

  | Value of value

and value 
  = Int of int
  | Bool of bool


type environment = (string * value) list

let rec eval (env:environment) (e:expr) : value =
  match e with 
  | Value v -> v

let e1 = Add (Value (Int 1), Sub (Value (Int 10), Value (Int 3)))



(* freevars (Add(Id "x", Value (Int 3)))  ---->>  ["x"]
   freevars (Let ("x", Id "y", (Add(Id "x", Value (Int 3)))))  ---->>  ["y"] *)

let rec freevars (e:expr)  : string list =  
  match e with
  | Value v -> []

