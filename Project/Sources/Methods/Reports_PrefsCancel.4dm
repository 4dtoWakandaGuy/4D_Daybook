//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsCancel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsCancel
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

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsCancel")

//Added 01/12/08 v631b120i -kmw

SR_bo_ReportPrefsDirty:=False:C215

Reports_PrefsInitTemps
ERR_MethodTrackerReturn("Reports_PrefsCancel"; $_t_oldMethodName)