//%attributes = {}
If (False:C215)
	//Project Method Name:      ADR_CheckRates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/09/2012 12:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ADR_CheckRates")
$_ti_DocumentRef:=Open document:C264(""; "TEXT")
ERR_MethodTrackerReturn("ADR_CheckRates"; $_t_oldMethodName)