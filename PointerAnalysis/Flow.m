
BeginPackage["PointerAnalysis`Flow`", {"PointerAnalysis`Language`"}]

Transfer;
PointsToSet;

Begin["`Private`"]


Transfer[Instruction["AddressOf", x_, y_]] := (* kills previous definitions *)
	PointsToSet[x] = {y}
Transfer[Instruction["Copy", x_, y_]] := (* kills previous definitions *)
	PointsToSet[x] = PointsToSet[y]
Transfer[Instruction["Load", x_, y_]] :=
	PointsToSet[x] = DeleteDuplicates[Flatten[PointsToSet /@ PointsToSet[y]]]
Transfer[Instruction["Store", x_, y_]] :=
	Do[
		PointsToSet[z] = DeleteDuplicates[Flatten[{PointsToSet[z], PointsToSet[y]}]],
		{z, PointsToSet[x]}
	]


End[]

EndPackage[]

