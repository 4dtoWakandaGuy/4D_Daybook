//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetPublicCalendars
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:52`Method: Cal4D_Cal_GetPublicCalendars
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_POINTER:C301(<>Cal_ptr_GroupFld_Name; <>Cal_ptr_GroupTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetPublicCalendars")

QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupFld_Name->="Public@")

$0:=Records in selection:C76(<>Cal_ptr_GroupTable->)
ERR_MethodTrackerReturn("Cal4D_Cal_GetPublicCalendars"; $_t_oldMethodName)