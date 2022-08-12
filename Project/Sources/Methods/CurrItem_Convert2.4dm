//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrItem_Convert2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($_Ptr_VariableorField; $1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CurrItem_Convert2")
$_Ptr_VariableorField:=$1

If (Not:C34(Is nil pointer:C315($_Ptr_VariableorField)))
	If (Records in selection:C76([CURRENCY_RATES:72])>0)
		If ([CURRENCY_RATES:72]Currency_From:1=<>SYS_t_BaseCurrency)
			$_Ptr_VariableorField->:=Gen_Round(($_Ptr_VariableorField->*[CURRENCY_RATES:72]Rate:3); 2; 1)
		Else 
			$_Ptr_VariableorField->:=Gen_Round(($_Ptr_VariableorField->/[CURRENCY_RATES:72]Rate:3); 2; 1)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("CurrItem_Convert2"; $_t_oldMethodName)