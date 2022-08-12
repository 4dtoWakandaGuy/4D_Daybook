//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_Level0
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2010 05:48
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

$_t_oldMethodName:=ERR_MethodTracker("OrderI_Level0")
If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
	QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Component_Level:47=0)
End if 
ERR_MethodTrackerReturn("OrderI_Level0"; $_t_oldMethodName)