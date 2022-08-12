If (False:C215)
	//object Name: [USER]ErrorLogViewForm.oNOLogButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2013 01:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>DB_l_LocalLog; <>DB_l_TrackPath)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ErrorLogViewForm.oNOLogButton"; Form event code:C388)


If (Form event code:C388=On Clicked:K2:4)
	
	<>DB_l_TrackPath:=0
	<>DB_l_LocalLog:=0
	//◊l_ErrorDebugLogStatus:=2
End if 
//ERR_MethodTrackerReturn ("OBJ:ErrorLogViewForm,b_ErrorDebugPause";$_t_oldMethodName)
