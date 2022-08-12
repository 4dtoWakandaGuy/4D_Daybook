If (False:C215)
	//object Name: [USER]ErrorLogViewForm.oPauseButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 14:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>Err_l_DebugLogStatus; b_ErrorDebugPause)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]ErrorLogViewForm.oPauseButton"; Form event code:C388)


//$_t_oldMethodName:=ERR_MethodTracker ("OBJ [USER].ErrorLogViewForm.oPauseButton";Form event)
//TRACE
If (Form event code:C388=On Clicked:K2:4)
	
	Case of 
		: (<>Err_l_DebugLogStatus=0)  //Should never be
			OBJECT SET TITLE:C194(b_ErrorDebugPause; "Pause")
			//TRACE
			<>Err_l_DebugLogStatus:=-1
		: (<>Err_l_DebugLogStatus=-1)
			OBJECT SET TITLE:C194(b_ErrorDebugPause; "Pause")
			//TRACE
			<>Err_l_DebugLogStatus:=l_ErrorDebugLogStatusOLD
		: (<>Err_l_DebugLogStatus=2)
			OBJECT SET TITLE:C194(b_ErrorDebugPause; "Resume")
			//TRACE
			<>Err_l_DebugLogStatus:=-1
		Else 
			//TRACE
			<>Err_l_DebugLogStatus:=0
	End case 
End if 

//
ERR_MethodTrackerReturn("OBJ [USER].ErrorLogViewForm.oPauseButton"; $_t_oldMethodName)