//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetUserCalendars
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 20:01`Method: Cal4D_Cal_GetUserCalendars
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_POINTER:C301(<>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupotherscanviewField; <>Cal_ptr_GroupTable; <>Cal_ptr_GroupUserIDField; Cal_ptr_UsernameField; Cal_ptr_UserTable)
	C_TEXT:C284($_t_oldMethodName; $_t_UserName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetUserCalendars")
$_t_UserName:=$1

//========================    Method Actions    ==================================

QUERY:C277(Cal_ptr_UserTable->; Cal_ptr_UsernameField->=$_t_UserName)

QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupUserIDField->=Cal_ptr_UserIDField->; *)
QUERY:C277(<>Cal_ptr_GroupTable->;  | ; <>Cal_ptr_GroupotherscanviewField->=True:C214)

ORDER BY:C49(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_Name->)

//========================    Clean up and Exit    =================================

$0:=Records in selection:C76(<>Cal_ptr_GroupTable->)
ERR_MethodTrackerReturn("Cal4D_Cal_GetUserCalendars"; $_t_oldMethodName)