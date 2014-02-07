
BeginPackage["PointerAnalysis`PointerAnalysis`"]

PointsTo;

PointerAnalysis;

Begin["`Private`"]


(* see http://www.cs.cornell.edu/courses/cs711/2005fa/slides/sep08.pdf slide 5 *)

PointerAnalysis[args_, Method -> Steensgard] :=
	Steensgard[args]

End[]

EndPackage[]

