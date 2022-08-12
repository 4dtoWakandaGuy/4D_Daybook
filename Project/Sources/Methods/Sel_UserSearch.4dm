//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_UserSearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(WS_bo_InsearchScreen)
	C_LONGINT:C283(<>WS_Search_Message; vNo)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_UserSearch")
Menu_Record("Sel_UserSearch"; "User Search ...")
SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
HIDE WINDOW:C436  // NG MARCH 2004
QUERY:C277(vFilePtr->)
SHOW WINDOW:C435

SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
If (OK=1)
	vNo:=Records in selection:C76(vFilePtr->)
	Master2(vFilePtr)
	If (WS_bo_InsearchScreen)
		//we are in a search screen
		<>WS_Search_Message:=1
		If (Application type:C494#4D Server:K5:6)
			POST OUTSIDE CALL:C329(Current process:C322)
		End if 
	End if 
	
End if 
//if we are in a Find window then close the window automatically
ERR_MethodTrackerReturn("Sel_UserSearch"; $_t_oldMethodName)