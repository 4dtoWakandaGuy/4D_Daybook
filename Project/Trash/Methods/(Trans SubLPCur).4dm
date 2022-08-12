//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans_SubLPCur
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 16:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_POINTER:C301($1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SubLPCur")
//Trans_SubLPCur
//Modified NG may 2004 to work with parameters for area list

Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19)
$0:=(OK=1)

If (OK=1)
	If (Count parameters:C259=0)
		
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
			Gen_Alert("You do not have access to Multi-Currency"; "Cancel")
			[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
		Else 
			Check_MinorNC(->[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
			If ([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
				If ([TRANSACTION_TYPES:31]Currency_Code:17#"")
					[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[TRANSACTION_TYPES:31]Currency_Code:17
				Else 
					[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
				End if 
			End if 
		End if 
	Else 
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
			Gen_Alert("You do not have access to Multi-Currency"; "Cancel")
			$1->:=<>SYS_t_BaseCurrency
		Else 
			Check_MinorNC($1; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
			If ($1->="")
				If ([TRANSACTION_TYPES:31]Currency_Code:17#"")
					$1->:=[TRANSACTION_TYPES:31]Currency_Code:17
				Else 
					$1->:=<>SYS_t_BaseCurrency
				End if 
			End if 
		End if 
		$0:=True:C214
	End if 
	
Else 
	If (Count parameters:C259>0)
		$0:=False:C215
	End if 
	
End if 
ERR_MethodTrackerReturn("Trans_SubLPCur"; $_t_oldMethodName)
