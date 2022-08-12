//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel_SRadio
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
	C_BOOLEAN:C305($4)
	C_LONGINT:C283($3)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_SRadio")
MESSAGES OFF:C175
//Sel_SRadio
If ($3=1)
	QUERY:C277($1->; $2->=$4)
	Master2($1)
	
End if 

MESSAGES ON:C181
ERR_MethodTrackerReturn("Sel_SRadio"; $_t_oldMethodName)