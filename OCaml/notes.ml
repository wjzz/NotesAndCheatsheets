(* Some simple notes on OCaml *)

let succ x = x + 1

(* ### Some basic operations on integers *)

let x = 123 ;;
x + 1 ;;
x - 123 ;;
x mod 2 ;;

(* ### Some basic operations of floats *)
(* Beware: float literals need to have a period (.) and the basic arith. operations have a . at the back *)

let f = 1.123 ;;
let t = f +. 1. ;;

(* expoenentation *)
let t2 = t ** 2.0 ;;

(* Some basic float functions: 

functions on floats
ceil	 
floor	 
sqrt	square root
exp	exponential
log	natural log
log10	log base 10
		
cos	cosine
sin	sine
tan	tangent
acos	arccosine
asin	arcsine
atan	arctangent
*)


(* ### Coersions between ints and floats *)
let xf = float_of_int x ;;
let fn = int_of_float f ;;

(* Chars *)
let c = 'a' ;;
let d = int_of_char c ;;

(* Strings *)

let sn = string_of_int fn ;;
let concatenated = "sn = " ^ sn ;;

(* Tuples *)

let pair = (13, "Hello") ;;
let msg = snd pair ;;

(* Lists *)

(* be cautious: OCaml uses ; instead of , 
   in list literals *)
let l = [1 ; 2 ; 3] @ 4 :: [] ;;
let h = List.hd l ;;
let doubled = List.map (fun x -> 2*x) l

(* Simulatiouns declaration *)

let tt = 
  let a = 123
  and b = 12
  in 
    a + b ;;

(* Function declaration *)

let f = function x -> x*x+1 ;;

(* Infix operator *)

(* The pipe operator from F# *)
let (|>) x f = f x ;;

t |> fun x -> x +. 1. ;;

(* A couple of nice operators from Haskell *)
let (&&&)   f g = function x     -> (f x, g x) ;;
let (<***>) f g = function (x,y) -> (f x, g y) ;;


let rec fib_classic n =
  if n < 2 then n else fib_classic (n-1) + fib_classic (n-2) ;;

let fib (n: int) : int = 
  let rec fib_iter n (a, b) = 
    if n=0 then a else fib_iter (n-1) (b, a+b)
  in
    fib_iter n (0, 1) ;;

(* Be careful of the order of parameters: *)
List.fold_left ;;
List.fold_right ;;

(* ### Pattern matching *)

(* or patterns *)
let is_vowel (c: char) : bool =
  match c with
    | 'a' | 'e' | 'u' | 'o' | 'i' -> true
    | _ -> false ;;

type color = Red of int | Blue of int ;;

(* function allows immediate pattern matching *)
(* or pattern can bind variable provided the set of variables names is exactly the same in each subpattern *)
let make_blue = function
  | Red x | Blue x -> Blue x

(* as pattern *)
let rec merge xs ys = 
  match xs, ys with
    | [], _ -> ys
    | _, [] -> xs
    | ((x::xss), (y::yss)) ->
      if x <= y then
	x :: (merge xss ys)
      else
	y :: (merge xs yss)

(* when pattern *)
let rec fact = function
  | 0 -> 1
  | n when (n>0) -> n * fact (n-1)
  | n -> failwith "fact: negative argument" ;;

(* character intervals *)
let is_letter = function
  | 'a' .. 'z' | 'A' .. 'Z' -> true
  | c -> false

(* ### type declarations *)

type 'a newtype = Newtype of 'a

(* when there is more than one type in the definition, the types have to be tupled *)
type ('a, 'b) pair = Pair of ('a * 'b)

(* ### records *)

type complex = { re: float; im: float } ;;

let c = { re = 1.0; im = 0.44 } ;;
let rr = c.re ;;

let c2 = { c with re = 0.25 +. c.re } ;;

(* ### Structural and physical equality *)
let a = [1; 2] ;;
let b = [1; 2] ;;

let physical   = a == b ;;
let structural = a = b ;;

(* The problem with structural eq. occurs in infinite or circular data: *)

let rec l2 = 1::l2 ;;

(* This is ok: *)
let bp = l2 == l2 ;;

(* But this causes stack overflow: *)
(* let bs = l2 = l2 ;; *)

(* ### Exceptions *)

exception Empty_list ;;

exception Level of int ;;

let t () = raise (Level 4) ;;


(* using exceptions to get out of a function quickly *)
exception Found_zero ;;

let rec try_find = function
  | [] -> 1
  | 0 :: _ -> raise Found_zero
  | h :: t -> h * try_find t

let fast_product l =
  try try_find l with
  | Found_zero -> 0

(* can we do the same using continuations? *)
(* doesn't feel the right way ... *)
let rec go l cont =
  match l with
    | 0 :: _ -> 0
    | h :: t -> go t (fun x -> h * cont x)
    | [] -> cont 1

let fact_product' l = go l (fun x -> x)
      
(* ### Variants and records *)

type number = Int of int | Float of float | Error ;;

let print_number = function
    Int i   -> print_string (string_of_int i)
  | Float f -> print_string (string_of_float f)
  | Error   -> print_string "error"
;;

type 'a btree = Leaf | Node of 'a * 'a btree * 'a btree
;;

(* an example record *)
type ratio = { num:   int
             ; denum: int
             } 
;;

let inc_num r = { num = r.num + 1
                ; denum = r.denum 
                }
;;

let r = { num = 1 ; denum = 2 }
let r2 = inc_num r
;;

(* ### Imperative features *)

(* arrays *)
let a = [| 1 ; 2 ; 3 |] ;;

let n = Array.length a ;;

let a2 = Array.create 5 'a'

(* references *)
let rf = ref 1 ;;
rf := !rf + 1 ;
!rf ;;

(* GIVE ME POLYMORPHISM *)
type idref = { mutable id: 'a. 'a -> 'a };;
