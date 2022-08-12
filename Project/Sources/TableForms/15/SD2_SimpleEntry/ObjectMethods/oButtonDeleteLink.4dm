If (False:C215)
	//object Name: [USER]SD2_SimpleEntry.oButtonDeleteLink
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



$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_SimpleEntry.oButtonDeleteLink"; Form event code:C388)
ACC_DelSubEntityAnalyses
ERR_MethodTrackerReturn("OBJ [USER].SD2_SimpleEntry.oButtonDeleteLink"; $_t_oldMethodName)
