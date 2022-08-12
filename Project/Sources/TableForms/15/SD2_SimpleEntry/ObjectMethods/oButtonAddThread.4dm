If (False:C215)
	//object Name: [USER]SD2_SimpleEntry.oButtonAddThread
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:23
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_SimpleEntry.oButtonAddThread"; Form event code:C388)
ACC_AddSubEntityAnalyses("listbox")
ERR_MethodTrackerReturn("OBJ:Accounts_In,bACC_l_modify"; $_t_oldMethodName)
