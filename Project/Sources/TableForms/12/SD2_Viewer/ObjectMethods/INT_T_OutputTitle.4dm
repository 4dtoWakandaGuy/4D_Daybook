If (False:C215)
	//object Name: [DIARY]SD2_Viewer.INT_T_OutputTitle
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_Viewer.INT_T_OutputTitle"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_Viewer.INT_T_OutputTitle"; $_t_oldMethodName)