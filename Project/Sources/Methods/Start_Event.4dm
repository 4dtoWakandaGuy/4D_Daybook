//%attributes = {}
If (False:C215)
	//Project Method Name:      Start_Event
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/02/2010 10:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>PER_l_CurrentUserID; <>SCPT_l_ExecutionProcess; <>SCPT_l_PlayerActive; $_l_Functionality)
	C_OBJECT:C1216($_Obj_GetUser)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Start_Event")

If (Application type:C494#4D Server:K5:6)
	$_Obj_GetUser:=New object:C1471("personID"; <>PER_l_CurrentUserID; "functions"; "")
	SYS_GetCurrentUserSetting($_Obj_GetUser)
	
	If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
		If (<>SCPT_l_PlayerActive>0) | (<>SCPT_l_ExecutionProcess>0)
			
			ON EVENT CALL:C190("On_EventW"; "$EventsWait")
		Else 
			$_l_Functionality:=0
			$_l_Functionality:=$_l_Functionality ?+ 5
			If (($_Obj_GetUser.functions ?? 5))  //& (◊ScrnSavMin>0))
				ON EVENT CALL:C190("On_Event"; "$Events")
			Else 
				ON EVENT CALL:C190("On_EventNSS"; "$Events")
			End if 
		End if 
	Else 
		If (($_Obj_GetUser.functions ?? 5))  //& (◊ScrnSavMin>0))
			ON EVENT CALL:C190("On_EventNM"; "$Events")  //NM = no macros
		Else 
			ON EVENT CALL:C190("On_EventNMNSS"; "$Events")  //NSS = no Screen saver
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Start_Event"; $_t_oldMethodName)
