If (False:C215)
	//object Name: [USER]ErrorLogViewForm.oLogButton1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 14:58
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
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]ErrorLogViewForm.oLogButton1"; Form event code:C388)


//$_t_oldMethodName:=ERR_MethodTracker ("OBJ [USER].ErrorLogViewForm.oLogButton1";Form event)
//TRACE
If (Form event code:C388=On Clicked:K2:4)
	//TRACE
	<>DB_l_LocalLog:=1
	<>DB_l_TrackPath:=1
	//◊l_ErrorDebugLogStatus:=1
End if 
//
ERR_MethodTrackerReturn("OBJ [USER].ErrorLogViewForm.oLogButton1"; $_t_oldMethodName)