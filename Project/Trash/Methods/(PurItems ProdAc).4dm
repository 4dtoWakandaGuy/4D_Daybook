//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurItems ProdAc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 18:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurItems ProdAc")
//PurItems ProdAc
If ([PRODUCTS:9]Stock_Account:42#"")
	If ((([TRANSACTION_TYPES:31]D_Range_F:9="") & ([TRANSACTION_TYPES:31]D_Range_T:10="")) | ([TRANSACTION_TYPES:31]D_Enforce:13=False:C215) | (([PRODUCTS:9]Stock_Account:42>=[TRANSACTION_TYPES:31]D_Range_F:9) & ([PRODUCTS:9]Stock_Account:42<=[TRANSACTION_TYPES:31]D_Range_T:10)))
		RELATE ONE:C42([PRODUCTS:9]Stock_Account:42)
		If (Records in selection:C76([ACCOUNTS:32])>0)
			[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8:=[PRODUCTS:9]Stock_Account:42
		End if 
	End if 
Else 
	If ([PRODUCTS:9]Purchase_Account:13#"")
		If ((([TRANSACTION_TYPES:31]D_Range_F:9="") & ([TRANSACTION_TYPES:31]D_Range_T:10="")) | ([TRANSACTION_TYPES:31]D_Enforce:13=False:C215) | (([PRODUCTS:9]Purchase_Account:13>=[TRANSACTION_TYPES:31]D_Range_F:9) & ([PRODUCTS:9]Purchase_Account:13<=[TRANSACTION_TYPES:31]D_Range_T:10)))
			RELATE ONE:C42([PRODUCTS:9]Purchase_Account:13)
			If (Records in selection:C76([ACCOUNTS:32])>0)
				[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8:=[PRODUCTS:9]Purchase_Account:13
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PurItems ProdAc"; $_t_oldMethodName)