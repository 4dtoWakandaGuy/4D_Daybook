//%attributes = {}
If (False:C215)
	//Project Method Name:      Currency_Fill
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
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Currency_Fill")
If ($1->="")
	$1->:=<>SYS_t_BaseCurrency
End if 
//Copied to Orders_InLPB
ERR_MethodTrackerReturn("Currency_Fill"; $_t_oldMethodName)