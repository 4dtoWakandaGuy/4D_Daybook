If (False:C215)
	//object Name: [SCRIPTS]Scripts_in.Variable5
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
	C_TEXT:C284($_t_oldMethodName; SMC_T_LastModifiedData)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Scripts_in.Variable5"; Form event code:C388)
SET TEXT TO PASTEBOARD:C523(SMC_T_LastModifiedData)
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Scripts_in.Variable5"; $_t_oldMethodName)