//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices StaChk
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 11:56
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StateAnal; $_bo_MultiCurrency)
	C_LONGINT:C283(vIn)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CurrencyCode1; $_t_CurrencyCode2; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices StaChk")
//Project Method Invoices StaChk /3/2(ID 22051-1858)

//Invoices StaChk

If (<>StateAnal)
	ORDER BY:C49([INVOICES:39]; [INVOICES:39]Analysis_Code:17; >)
	FIRST RECORD:C50([INVOICES:39])
	$_t_CurrencyCode1:=[INVOICES:39]Analysis_Code:17
	LAST RECORD:C200([INVOICES:39])
	$_t_CurrencyCode2:=[INVOICES:39]Analysis_Code:17
	If ($_t_CurrencyCode1#$_t_CurrencyCode2)
		Gen_Confirm("Please select only Invoices from a single Analysis"; ""; "")
		If (OK=0)
			vIn:=0
		Else 
			vIn:=2
		End if 
	End if 
End if 

If (vIn=1)
	ORDER BY:C49([INVOICES:39]; [INVOICES:39]Currency_Code:27; >)
	FIRST RECORD:C50([INVOICES:39])
	$_t_CurrencyCode1:=[INVOICES:39]Currency_Code:27
	LAST RECORD:C200([INVOICES:39])
	$_t_CurrencyCode2:=[INVOICES:39]Currency_Code:27
	If ($_t_CurrencyCode1#$_t_CurrencyCode2)
		$_bo_MultiCurrency:=False:C215
		If (($_t_CurrencyCode1="") & ($_t_CurrencyCode2=<>SYS_t_BaseCurrency))
			FIRST RECORD:C50([INVOICES:39])
			While ((Not:C34(End selection:C36([INVOICES:39]))) & ($_bo_MultiCurrency=False:C215))
				If (([INVOICES:39]Currency_Code:27#$_t_CurrencyCode2) & ([INVOICES:39]Currency_Code:27#$_t_CurrencyCode1))
					$_bo_MultiCurrency:=True:C214
				End if 
				NEXT RECORD:C51([INVOICES:39])
			End while 
		Else 
			$_bo_MultiCurrency:=True:C214
		End if 
		If ($_bo_MultiCurrency)
			Gen_Confirm("Please select only Invoices with a single Currency"; ""; "")
			If (OK=0)
				vIn:=0
			Else 
				vIn:=2
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Invoices StaChk"; $_t_oldMethodName)