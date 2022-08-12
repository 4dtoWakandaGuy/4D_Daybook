If (False:C215)
	//object Name: [DIARY]SD2_Input.oDetailInputWRITEP1
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_Input.oDetailInputWRITEP1"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_Input.oDetailInputWRITEP1"; $_t_oldMethodName)