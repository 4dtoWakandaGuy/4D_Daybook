If (False:C215)
	//object Method Name: DB_OutputForm.oFilterCMObject
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 
	//Created BY: 
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_OldMethodName)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oFilterCMObject"; Form event code:C388)
LAY_ComboBoxCode(Form event code:C388; Self:C308)
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oFilterCMObject"; $_t_OldMethodName)