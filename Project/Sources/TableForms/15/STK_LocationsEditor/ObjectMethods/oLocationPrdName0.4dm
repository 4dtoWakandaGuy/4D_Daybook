If (False:C215)
	//object Name: [USER]STK_LocationsEditor.oLocationPrdName0
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:26
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].STK_LocationsEditor.oLocationPrdName0"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [USER].STK_LocationsEditor.oLocationPrdName0"; $_t_oldMethodName)