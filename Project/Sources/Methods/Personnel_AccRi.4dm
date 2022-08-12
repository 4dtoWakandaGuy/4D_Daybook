//%attributes = {}
If (False:C215)
	//Project Method Name:      Personnel_AccRi
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/09/2009 08:31
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

$_t_oldMethodName:=ERR_MethodTracker("Personnel_AccRi")
If ((DB_GetModuleSettingByNUM(1))=5)
	Page_5
Else 
	Page_2
End if 
ERR_MethodTrackerReturn("Personnel_AccRi"; $_t_oldMethodName)