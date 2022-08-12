//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_GetCardNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/06/2009 11:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	C_LONGINT:C283(CCM_l_LastNoofDigits; $_l_CardLength; CCM_l_LastNoofDigits)
	C_REAL:C285(CCM_r_isinternal)
	C_TEXT:C284($0; CC_T_CCX99999999999; $_t_oldMethodName; CC_T_CCX99999999999)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_GetCardNumber")

If (CCM_r_isinternal=801801801801)
	CC_T_CCX99999999999:=""
	CCM_DecryptCardNumber
	If (CCM_l_LastNoofDigits>0)
		$_l_CardLength:=Length:C16(CC_T_CCX99999999999)
		If ($_l_CardLength>(CCM_l_LastNoofDigits-1))
			$0:=Substring:C12(CC_T_CCX99999999999; $_l_CardLength-(CCM_l_LastNoofDigits-1); $_l_CardLength)
		Else 
			$0:=CC_T_CCX99999999999
		End if 
	Else 
		$0:=CC_T_CCX99999999999
	End if 
End if 
ERR_MethodTrackerReturn("CCM_GetCardNumber"; $_t_oldMethodName)
