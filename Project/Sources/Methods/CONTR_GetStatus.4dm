//%attributes = {}
If (False:C215)
	//Project Method Name:      CONTR_GetStatus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  04/06/2010 10:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CONTR_GetStatus")
$0:=([CONTRACTS:17]xOpenEndedStatus:16=1)
ERR_MethodTrackerReturn("CONTR_GetStatus"; $_t_oldMethodName)