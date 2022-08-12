//%attributes = {"publishedSoap":true}
If (False:C215)
	//Project Method Name:      ACC_BalAbort
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SYS_l_CancelProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalAbort")
If (Records in selection:C76([HEADINGS:84])=0)
	Gen_Alert("The Report Heading Levels are not correctly set up for Account "+[ACCOUNTS:32]Account_Code:2; "Cancel")
	<>SYS_l_CancelProcess:=Current process:C322
End if 
ERR_MethodTrackerReturn("ACC_BalAbort"; $_t_oldMethodName)
