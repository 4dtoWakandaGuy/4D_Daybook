//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_StartDiaryManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2010 15:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_StartDiaryManager")

//This method simple starts another process. This is so control on the server belongs to the server

$_l_Process:=New process:C317("SD2_ServerSideManager"; 1024000; "Manager User Diaries")
ERR_MethodTrackerReturn("SD2_StartDiaryManager"; $_t_oldMethodName)
