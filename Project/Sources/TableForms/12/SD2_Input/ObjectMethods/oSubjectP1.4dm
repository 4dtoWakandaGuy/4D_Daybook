If (False:C215)
	//object Name: [DIARY]SD2_Input.oSubjectP1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301(SD2_ptr_LastObject)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_Input.oSubjectP1"; Form event code:C388)

SD2_ptr_LastObject:=->[DIARY:12]Subject:63
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_Input.oSubjectP1"; $_t_oldMethodName)