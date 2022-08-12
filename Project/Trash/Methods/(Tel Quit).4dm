//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tel Quit
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
	//ARRAY LONGINT(<>TEL_al_TVProcess;0)
	C_BOOLEAN:C305(<>Tel_bo_Quitting; <>TelServer)
	C_LONGINT:C283(<>TelOwner; $_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel Quit")
//Tel Quit
If (<>TelServer)
	<>Tel_bo_Quitting:=True:C214
	For ($_l_Index; 1; Size of array:C274(<>TEL_al_TVProcess))
		PLUGCALL_Telephony("Kill"; 1)
		
	End for 
	If (<>TelOwner>0)
		PLUGCALL_Telephony("CloseLInk"; 1)
		
	End if 
End if 
ERR_MethodTrackerReturn("Tel Quit"; $_t_oldMethodName)
