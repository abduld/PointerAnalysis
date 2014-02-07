
BeginPackage["PointerAnalysis`Steensgard`", {"PointerAnalysis`Language`"}]


Steensgard;

Begin["`Private`"]

(*
(Points-to Analysis in Almost Linear
Time, B. Steensgaard, 1996 POPL
 
Steensgaard's Algorithm is essentially
Andersen's Algorithm, simplified by
merging nodes a and b if any pointer
can reference both
*)

$BottomType = Type["Null"]


(*************************************************************************)
(*************************************************************************)
(*************************************************************************)
(*************************************************************************)

Type /: Less[Type["Null"], _] := True
Type /: Less[Type[_String, x_], Type[_String, y_]] := x === y
Type /: Less[Type["Multi", t1_, t2_], Type["Multi", t3_, t4_]] := 
	t1 < t3 && t2 < t4

(*************************************************************************)
(*************************************************************************)
(*************************************************************************)

settype[_] := TODO
cjoin[_] := TODO
unify[_] := TODO
join[_] := TODO

(*************************************************************************)
(*************************************************************************)
(*************************************************************************)

End[]

EndPackage[]




