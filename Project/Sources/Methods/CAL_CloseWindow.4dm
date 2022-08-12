//%attributes = {}
If (False:C215)
	//Project Method Name:      CAL_CloseWindow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>FloatingCALDisplayed; CAL_bo_isFloating)
	C_DATE:C307(CAL_D_RETURNDate)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime; CAL_l_CallBackEventNo; CAL_l_CallBackProcess)
	C_POINTER:C301($_Ptr_Variable)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; Cal_t_VariableName; Cal_t_VariableName2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAL_CloseWindow")
If (CAL_bo_isFloating=False:C215)
	//CAL_D_RETURNDate:=!00/00/00!
	CANCEL:C270
Else 
	HIDE WINDOW:C436
	<>FloatingCALDisplayed:=False:C215
	If (CAL_D_RETURNDate#!00-00-00!)
		If (CAL_l_CallBackProcess>0)
			$_Ptr_Variable:=Get pointer:C304(Cal_t_VariableName)
			PROCESS PROPERTIES:C336(CAL_l_CallBackProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
			If ($_l_ProcessState>=0)  // 30/05/02 pb
				SET PROCESS VARIABLE:C370(CAL_l_CallBackProcess; $_Ptr_Variable->; CAL_D_RETURNDate)
				If (Cal_t_VariableName2#"")
					$_Ptr_Variable:=Get pointer:C304(Cal_t_VariableName2)
					SET PROCESS VARIABLE:C370(CAL_l_CallBackProcess; $_Ptr_Variable->; CAL_l_CallBackEventNo)
				End if 
				POST OUTSIDE CALL:C329(CAL_l_CallBackProcess)
			End if 
		End if 
	End if 
	
	
End if 
ERR_MethodTrackerReturn("CAL_CloseWindow"; $_t_oldMethodName)