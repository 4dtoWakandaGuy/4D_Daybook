//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_SCurr
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
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SCurr")
MESSAGES OFF:C175
If ($3#"")
	If ($3=<>SYS_t_BaseCurrency)
		QUERY:C277($1->; $2->=$3; *)
		QUERY:C277($1->;  | ; $2->="")
		Master2($1)
	Else 
		Sel_S($1; $2; $3)
	End if 
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("Sel_SCurr"; $_t_oldMethodName)