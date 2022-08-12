//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LowMargin
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   09/11/2010 17:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(MCONTINUE)
	C_REAL:C285(DB_R_MINMARGIN)
	C_TEXT:C284(<>SecretPassword; $_t_oldMethodName; MPassword; MReason)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LowMargin")
MCONTINUE:=False:C215
<>SecretPassword:="Cheapskate"
If ([ORDERS:24]Total_Margin_PC:13<DB_R_MINMARGIN)
	CREATE SET:C116([ORDER_ITEMS:25]; "INCLUDE")
	QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2="XXX")
	If (Records in selection:C76([ORDER_ITEMS:25])>0)
		
		DB_R_MINMARGIN:=1
		If ([ORDERS:24]Total_Margin_PC:13<DB_R_MINMARGIN)
			Gen_Confirm("The Margin on this order falls below recommended minimum"; "Override"; "Adjust")
			If (OK=1)
				MPassword:=Gen_Request("Enter the auth code")
				If (MPassword=<>SecretPassword)
					MCONTINUE:=True:C214
					MReason:=Gen_RequestText("Enter a Reason and your initials"; "")
					If (MReason#"")
						If ([ORDERS:24]Comments_2:40#"")
							[ORDERS:24]Comments_2:40:=[ORDERS:24]Comments_2:40+" "+MReason
						Else 
							[ORDERS:24]Comments_2:40:=MReason
							
						End if 
					End if 
				End if 
			End if 
			OK:=1
		Else 
			MCONTINUE:=True:C214
		End if 
	End if 
Else 
	MCONTINUE:=True:C214
End if 
ERR_MethodTrackerReturn("DB_LowMargin"; $_t_oldMethodName)