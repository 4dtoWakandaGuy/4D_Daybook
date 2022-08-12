//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_SLayer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SLayer")
MESSAGES OFF:C175
If ($3#"")
	If ($3=DB_GetLedgerActualLayer)
		QUERY:C277($1->; $2->=$3; *)
		QUERY:C277($1->;  | ; $2->="")
		Master2($1)
	Else 
		Sel_S($1; $2; $3)
	End if 
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("Sel_SLayer"; $_t_oldMethodName)