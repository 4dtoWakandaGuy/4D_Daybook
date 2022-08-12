//%attributes = {}
If (False:C215)
	//Project Method Name:      CAL_ButtonHandler
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
	C_BOOLEAN:C305(CAL_bo_AutoCancel; CAL_bo_isFloating)
	C_DATE:C307(CAL_D_RETURNDate; VCalF)
	C_LONGINT:C283($_l_FieldNumber; $_l_ProcessState; $_l_ProcessTime; $_l_TableNumber; CAL_l_CallBackEventNo; CAL_l_CallBackProcess)
	C_POINTER:C301($_ptr_DateVariablePointer; $_ptr_TextVariablePointer; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $_t_VariableName; Cal_t_VariableName; Cal_t_VariableName2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAL_ButtonHandler")
If (Count parameters:C259>=1)
	RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	$_ptr_DateVariablePointer:=Get pointer:C304("vD"+String:C10(Num:C11($_t_VariableName)))
	CAL_D_RETURNDate:=(VCalF-1)+Num:C11($_ptr_DateVariablePointer->)
	If (Not:C34(CAL_bo_isFloating))
		CANCEL:C270
	Else 
		If (CAL_D_RETURNDate#!00-00-00!)
			If (CAL_l_CallBackProcess>0)
				$_ptr_TextVariablePointer:=Get pointer:C304(Cal_t_VariableName)
				PROCESS PROPERTIES:C336(CAL_l_CallBackProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
				If ($_l_ProcessState>=0)  // 30/05/02 pb
					SET PROCESS VARIABLE:C370(CAL_l_CallBackProcess; $_ptr_TextVariablePointer->; CAL_D_RETURNDate)
					If (Cal_t_VariableName2#"")
						$_ptr_TextVariablePointer:=Get pointer:C304(Cal_t_VariableName2)
						SET PROCESS VARIABLE:C370(CAL_l_CallBackProcess; $_ptr_TextVariablePointer->; CAL_l_CallBackEventNo)
					End if 
					POST OUTSIDE CALL:C329(CAL_l_CallBackProcess)
				End if 
			End if 
			
		End if 
	End if 
	If (CAL_bo_AutoCancel)
		CANCEL:C270
	End if 
	
	
End if 
ERR_MethodTrackerReturn("CAL_ButtonHandler"; $_t_oldMethodName)