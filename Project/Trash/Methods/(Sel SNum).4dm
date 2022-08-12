//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel_SNum
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
	C_REAL:C285($3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SNum")
//Sel_S
If ($3>0)
	QUERY:C277($1->; $2->=$3)
	Master2($1)
End if 
ERR_MethodTrackerReturn("Sel_SNum"; $_t_oldMethodName)
