(* ### The stack structure *)

module Stack1 = 
  struct
    type 'a stack = 'a list
    let pop a s = a :: s
  end
(* The signature is derived automatically *)

(* ### The stack signature *)
module type STACK =
  sig
    type 'a stack

    exception Stack_Empty

    val empty     : 'a stack
    val push      : 'a -> 'a stack -> 'a stack
    val top       : 'a stack -> 'a
    val pop       : 'a stack -> 'a stack
    val is_empty  : 'a stack -> bool
  end

(* A sample implementation *)
module ListStack : STACK = 
  struct
    type 'a stack = 'a list
    exception Stack_Empty

    let empty = []

    let push a st = a :: st
      
    let top st = 
      match st with
	| [] -> raise Stack_Empty
	| h :: _ -> h

    let pop st = 
      match st with
	| []       -> raise Stack_Empty
	| _ :: st' -> st'

    let is_empty st = 
	match st with 
	  | [] -> true
	  | _  -> false
  end ;;

let st = ListStack.empty
let st' = ListStack.push 213 st
let a = ListStack.top st' ;;

(* ### Functor example *)

type comparison = LT | EQ | GT

module type ORDERED =
  sig
    type t
    val compare : t -> t -> comparison
  end

module type SET =
  sig
    type 'a set
    type elem
      
    val empty : elem set
    val insert : elem -> elem set -> elem set
    val find : elem -> elem set -> bool
  end

module TreeSet (Elem: ORDERED): SET =
  struct
    type 'a tree = Leaf | Node of ('a tree * 'a * 'a tree)
	
    type 'a set = 'a tree
    type elem = Elem.t
	
    let empty = Leaf
      
    let rec insert e tree = 
      match tree with
	| Leaf -> Node (Leaf, e, Leaf)
	| Node(l, a, r) ->
	  match Elem.compare e a with
	      LT -> Node(insert e l, a, r)
	    | EQ -> tree
	    | GT -> Node(l, a, insert e r)

    let rec find e tree =
      match tree with
	| Leaf -> false
	| Node (l, a, r) -> 
	  match Elem.compare e a with
	      LT -> find e l
	    | EQ -> true
	    | GT -> find e r
  end
