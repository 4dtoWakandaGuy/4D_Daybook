//%attributes = {}
If (False:C215)
	//Project Method Name:      Currency_InDDefault
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
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Currency_InDDefault")
If ([COMPANIES:2]Default_Currency:59#"")
	$1->:=[COMPANIES:2]Default_Currency:59
Else 
	$1->:=""
	Currency_Fill($1)
End if 
ERR_MethodTrackerReturn("Currency_InDDefault"; $_t_oldMethodName)