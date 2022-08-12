//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_SetSelect1
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
	ARRAY LONGINT:C221($_al_Lines; 0)
	C_LONGINT:C283($2)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_SetSelect1")

//NG 19/7/06 This is a direct replacement for ALSetSelect1

//ALSetSelect1
If ($2>0)
	ARRAY LONGINT:C221($_al_Lines; 1)
	$_al_Lines{1}:=$2
	LB_SetSelect($1; ->$_al_Lines)
End if 
ERR_MethodTrackerReturn("LBi_SetSelect1"; $_t_oldMethodName)