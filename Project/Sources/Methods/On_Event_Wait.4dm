//%attributes = {}

If (False:C215)
	//Project Method Name:      On_Event_Wait
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>SCPT_EXECUTE)
	C_BOOLEAN:C305($_bo_Resume)
	C_LONGINT:C283(<>SCPT_l_ExecutionProcess)
	C_TEXT:C284(<>Execute; $_t_Name; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("On_Event_Wait")

//$_t_oldMethodName:=ERR_MethodTracker ("On_Event_Wait")
//  `cant track in here
If (Count parameters:C259=0)
	$_t_Name:=Substring:C12(<>Execute; 6; 50)
Else 
	$_t_Name:=Replace string:C233($1; "WAIT "; "")
End if 
$_bo_Resume:=False:C215
Case of 
	: ($_t_Name="Return")
		If (Keycode=13)
			$_bo_Resume:=True:C214
			
		End if 
	: ($_t_Name="Enter")
		If (Keycode=3)
			$_bo_Resume:=True:C214
			
		End if 
	: ($_t_Name="Tab")
		If (Keycode=9)
			$_bo_Resume:=True:C214
			
		End if 
	: ($_t_Name="Click")
		If (Mousedown=1)
			$_bo_Resume:=True:C214
			
		End if 
	Else 
		If (Keycode=Num:C11($_t_Name))
			$_bo_Resume:=True:C214
			
		End if 
End case 
If ($_bo_Resume)
	<>Execute:=""
	<>SCPT_EXECUTE:=""
	If (<>SCPT_l_ExecutionProcess>0)
		RESUME PROCESS:C320(<>SCPT_l_ExecutionProcess)
	Else 
		RESUME PROCESS:C320(Frontmost process:C327(*))
	End if 
End if 
//ERR_MethodTrackerReturn ("On_Event_Wait";$_t_oldMethodName)
