If (False:C215)
	//Table Form Method Name: [CUSTOM_FIELDS]CustomFIeld_Header
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CUSTOM_FIELDS].CustomFIeld_Header"; Form event code:C388)
ERR_MethodTrackerReturn("FM [CUSTOM_FIELDS].CustomFIeld_Header"; $_t_oldMethodName)