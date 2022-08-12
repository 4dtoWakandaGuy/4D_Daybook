//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrItem_Convert
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
	C_POINTER:C301($_Ptr_VariableorField1; $_Ptr_VariableorField2; $_Ptr_VariableorField3; $1; $2; $3)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CurrItem_Convert")

$_Ptr_VariableorField1:=$1
$_Ptr_VariableorField2:=$2
$_Ptr_VariableorField3:=$3

If ((Count parameters:C259>2) & (Not:C34(Is nil pointer:C315($_Ptr_VariableorField3))) & (Not:C34(Is nil pointer:C315($_Ptr_VariableorField1))))
	PUSH RECORD:C176($_Ptr_VariableorField3->)  //weird 4D/AL error that makes it revert to the 1st Order Item if this isn't here
	Gen_Confirm("Do you want to convert the "+<>SYS_t_BaseCurrency+" Price to "+$_Ptr_VariableorField1->+" at the current rate?"; "Yes"; "No")
	POP RECORD:C177($_Ptr_VariableorField3->)
End if 

If (OK=1)
	//Make it run in the before & when the curr code is changed
	If (Not:C34(Is nil pointer:C315($_Ptr_VariableorField1)))
		CurrRate_MostRecent(<>SYS_t_BaseCurrency; $_Ptr_VariableorField1->)
	End if 
	If (Not:C34(Is nil pointer:C315($_Ptr_VariableorField2)))
		CurrItem_Convert2($_Ptr_VariableorField2)
	End if 
	
Else 
	REDUCE SELECTION:C351([CURRENCY_RATES:72]; 0)
End if 
WS_KeepFocus
ERR_MethodTrackerReturn("CurrItem_Convert"; $_t_oldMethodName)