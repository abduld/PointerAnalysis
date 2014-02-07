
BeginPackage["PointerAnalysis`Language`"]

Instruction;
TranslateNotation;

Begin["`Private`"]

(* This language in based on steeensgard's paper
   with some modifications needed for Andersen *)

$OpCodes = {
	"AddressOf",
	"Set",
	"Dereference",
	"Function",
	"Call",
	"Allocate",
	"BinaryOp"
};


TranslateNotation["x = y"] :=
	Instruction["Set", {"x", "y"}];
TranslateNotation["x = &y"] :=
	Instruction["Set", {"x", Instruction["AddressOf", "y"]}];
TranslateNotation["x = *y"] :=
	Instruction["Set", {"x", Instruction["Dereference", "y"]}];
	
TranslateNotation["*x = y"] :=
	Instruction["Set", {Instruction["Dereference", "x"], "y"}];
TranslateNotation["*x = &y"] :=
	Instruction["Set", {Instruction["Dereference", "x"], Instruction["AddressOf", "y"]}];
TranslateNotation["*x = *y"] :=
	Instruction["Set", {Instruction["Dereference", "x"], Instruction["Dereference", "y"]}];
	
TranslateNotation["op(y_0, ..., y_n)"] :=
	Instruction["BinaryOp", {"op", "ys"}];
TranslateNotation["alloc(y)"] :=
	Instruction["Allocate", "y"];
TranslateNotation["f(fs) body"] :=
	Instruction["Function", "f", "args", "body"];
TranslateNotation["f(as)"] :=
	Instruction["Call", {"f", "as"}];


End[]

EndPackage[]

