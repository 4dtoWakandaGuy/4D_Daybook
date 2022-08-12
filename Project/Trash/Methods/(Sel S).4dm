//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel S
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
	C_TEXT:C284($_t_oldMethodName; $3; vRec)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel S")
MESSAGES OFF:C175
//Sel S
If ($3#"")
	$3:=Str_StripDel($3)
	If ($3#"")
		$3:=Sel_AtOp($3; "=")
		If ((Character code:C91(Substring:C12($3; 1; 1))=64) & (Length:C16($3)>1))
			Master_UseSS($1)
			QUERY SELECTION:C341($1->; $2->; vRec; $3)
		Else 
			QUERY:C277($1->; $2->; vRec; $3)
		End if 
		Master2($1)
	End if 
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("Sel S"; $_t_oldMethodName)