If (False:C215)
	//object Name: [USER]SD2_MiniDropSelect.oNameSelector
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
	C_LONGINT:C283(SD2_l_EmailCalledback; SD2_l_LastSelected; $_l_event; SD2_l_Callback; SD2_l_EmailCalledback; SD2_l_LastSelected)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_MiniDropSelect.oNameSelector"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SD2_l_LastSelected:=Self:C308->
		If (SD2_l_Callback>0)
			BRING TO FRONT:C326(SD2_l_Callback)
			SET PROCESS VARIABLE:C370(SD2_l_Callback; SD2_l_EmailCalledback; 1)
			POST OUTSIDE CALL:C329(SD2_l_Callback)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_MiniDropSelect.oNameSelector"; $_t_oldMethodName)
