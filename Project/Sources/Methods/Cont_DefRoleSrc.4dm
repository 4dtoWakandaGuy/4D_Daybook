//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_DefRoleSrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>DefRole; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_DefRoleSrc")
QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Role:11=<>DefRole)
If (Records in selection:C76([CONTACTS:1])=0)
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
End if 
ERR_MethodTrackerReturn("Cont_DefRoleSrc"; $_t_oldMethodName)