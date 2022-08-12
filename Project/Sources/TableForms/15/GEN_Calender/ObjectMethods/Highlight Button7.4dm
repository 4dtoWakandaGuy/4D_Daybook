If (False:C215)
	//object Name: [USER]GEN_Calender.Highlight Button7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CAL_bo_AutoCancel; CAL_bo_isFloating)
	C_DATE:C307($_d_ReturnDate; CAL_D_ReturnDate; VCalF)
	C_LONGINT:C283($_l_Index; $_l_ProcessState; $_l_ProcessTime; CAL_l_CallBackEventNo; CAL_l_CallBackProcess)
	C_POINTER:C301($_ptr_Variable; $_ptr_Variable2)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; Cal_t_VariableName; Cal_t_VariableName2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].GEN_Calender.Highlight Button7"; Form event code:C388)
If (Not:C34(CAL_bo_isFloating))
	CANCEL:C270
Else 
	For ($_l_Index; 36; 37)
		$_ptr_Variable2:=Get pointer:C304("vD"+String:C10($_l_Index))
		$_d_ReturnDate:=(VCalF-1)+Num:C11($_ptr_Variable2->)
		If ($_d_ReturnDate#!00-00-00!)
			$_l_Index:=999
		End if 
	End for 
	
	CAL_D_ReturnDate:=$_d_ReturnDate
	CAL_l_CallBackEventNo:=16  //goto week
	If (CAL_D_RETURNDate#!00-00-00!)
		If (CAL_l_CallBackProcess>0)
			$_ptr_Variable:=Get pointer:C304(Cal_t_VariableName)
			PROCESS PROPERTIES:C336(CAL_l_CallBackProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
			If ($_l_ProcessState>=0)  // 30/05/02 pb
				SET PROCESS VARIABLE:C370(CAL_l_CallBackProcess; $_ptr_Variable->; CAL_D_RETURNDate)
				
				If (Cal_t_VariableName2#"")
					$_ptr_Variable:=Get pointer:C304(Cal_t_VariableName2)
					SET PROCESS VARIABLE:C370(CAL_l_CallBackProcess; $_ptr_Variable->; CAL_l_CallBackEventNo)
				End if 
				POST OUTSIDE CALL:C329(CAL_l_CallBackProcess)
			End if 
		End if 
		
	End if 
	If (CAL_bo_AutoCancel)
		CANCEL:C270
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].GEN_Calender.Highlight Button7"; $_t_oldMethodName)
