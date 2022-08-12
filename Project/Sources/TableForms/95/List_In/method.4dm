If (False:C215)
	//Table Form Method Name: [LIST_ITEMS]List_In
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [LIST_ITEMS].List_In"; Form event code:C388)
Lists_InLP
ERR_MethodTrackerReturn("FM [LIST_ITEMS].List_In"; $_t_oldMethodName)
