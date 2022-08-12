//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_SWMerAL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/04/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_SWMerAL")

LB_SetColumnHeaders($1; $2; 1; "Contact"; "Company"; "Contact Code"; "Company Code"; "")
LB_SetColumnWidths($1; $3; 1; 117; 117; 100; 100)
ERR_MethodTrackerReturn("Letters_SWMerAL"; $_t_oldMethodName)