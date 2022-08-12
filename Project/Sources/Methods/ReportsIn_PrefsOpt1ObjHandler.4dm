//%attributes = {}
If (False:C215)
	//Project Method Name:      ReportsIn_PrefsOpt1ObjHandler
	//------------------ Method Notes ------------------
	//Added 17/11/08 v631b120i -kmw
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: ReportsIn_PrefsOpt1ObjHandler
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ReportsIn_PrefsOpt1ObjHandler")
Case of 
	: ((Form event code:C388=On Data Change:K2:15) | (Form event code:C388=On Clicked:K2:4))
		
		ReportsIn_PrefsSetVisibility
		
		
	Else 
		
End case 
ERR_MethodTrackerReturn("ReportsIn_PrefsOpt1ObjHandler"; $_t_oldMethodName)