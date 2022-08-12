If (False:C215)
	//Table Form Method Name: [CONTACTS][tableForm]ACC_EmailChoice
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:49
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

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].ACC_EmailChoice"; Form event code:C388)

If (False:C215)
	If (True:C214)
	End if 
End if 
ERR_MethodTrackerReturn("FM [CONTACTS].ACC_EmailChoice"; $_t_oldMethodName)
