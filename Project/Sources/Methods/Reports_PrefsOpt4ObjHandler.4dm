//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsOpt4ObjHandler
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsOpt4ObjHandler
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SR_bo_ReportPrefsDirty)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsOpt4ObjHandler")



//Added 13/11/08 v631b120g -kmw

Case of 
	: ((Form event code:C388=On Data Change:K2:15) | (Form event code:C388=On Clicked:K2:4))
		
		Reports_PrefsSetVisibility
		SR_bo_ReportPrefsDirty:=True:C214  //Added 01/12/08 v631b120i -kmw
	Else 
		
End case 
ERR_MethodTrackerReturn("Reports_PrefsOpt4ObjHandler"; $_t_oldMethodName)