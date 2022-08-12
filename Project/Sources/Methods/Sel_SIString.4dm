//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_SIString
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $3; $4; vRec)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SIString")
MESSAGES OFF:C175
//Sel_SIString
If (($3#"") | ($4#""))
	$3:=Sel_AtOp($3; ">=")
	If ((Character code:C91(Substring:C12($3; 1; 1))=64) & (Length:C16($3)>1))
		Master_UseSS($1)
		Case of 
			: ($4="")
				QUERY SELECTION:C341($1->; $2->; vRec; $3)
			: ($3="")
				$4:=Sel_AtOp($4; "<=")
				QUERY SELECTION:C341($1->; $2->; vRec; $4)
			: (($3=$4) & (vRec=">="))
				vRec:="="
				QUERY SELECTION:C341($1->; $2->; vRec; $3)
			Else 
				QUERY SELECTION:C341($1->; $2->; vRec; $3; *)
				$4:=Sel_AtOp($4; "<=")
				QUERY SELECTION:C341($1->;  & ; $2->; vRec; $4)
		End case 
	Else 
		
		Case of 
			: ($4="")
				QUERY:C277($1->; $2->; vRec; $3)
			: ($3="")
				$4:=Sel_AtOp($4; "<=")
				QUERY:C277($1->; $2->; vRec; $4)
			: (($3=$4) & (vRec=">="))
				vRec:="="
				QUERY:C277($1->; $2->; vRec; $3)
			Else 
				QUERY:C277($1->; $2->; vRec; $3; *)
				$4:=Sel_AtOp($4; "<=")
				QUERY:C277($1->;  & ; $2->; vRec; $4)
		End case 
		
	End if 
	Master2($1)
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("Sel_SIString"; $_t_oldMethodName)