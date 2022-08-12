//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Date vButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($2)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date vButton")
If ($1->=!00-00-00!)
	$1->:=<>DB_d_CurrentDate
Else 
	$1->:=$1->+$2
End if 
ERR_MethodTrackerReturn("Date vButton"; $_t_oldMethodName)