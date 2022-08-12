//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_InPLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/07/2012 12:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(INV_at_AssignOptions;0)
	C_BOOLEAN:C305($_bo_IsOK; INV_bo_HidePayment)
	C_LONGINT:C283($_l_Index; BCCM; INV_l_AssignedrecordID; INV_l_AssignedTable)
	C_REAL:C285(INV_R_Depositmaxamt)
	C_TEXT:C284($_t_oldMethodName; CC_t_AuthCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; INV_t_AssignedCode; INV_t_RecordCode; vAccount; vBAccount)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InPLPB")

//The above values are assinged in Invoices_InP
//Note at the moment only relating to orders but designed to change!
If ([INVOICES:39]X_DepositRelatedRecordID:45>0)
	INV_l_AssignedTable:=[INVOICES:39]X_DepositRelatedTable:44
	INV_l_AssignedrecordID:=[INVOICES:39]X_DepositRelatedRecordID:45
End if 

If (INV_l_AssignedTable>0) & (INV_l_AssignedrecordID>0)
	ARRAY TEXT:C222(INV_at_AssignOptions; 1)
	INV_at_AssignOptions{1}:=Table name:C256(INV_l_AssignedTable)
	Case of 
		: (INV_l_AssignedTable=Table:C252(->[ORDERS:24]))
			If ([ORDERS:24]x_ID:58#INV_l_AssignedrecordID)
				QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=INV_l_AssignedrecordID)
			End if 
			If (Records in selection:C76([ORDERS:24])=0)
				INV_t_AssignedCode:=INV_t_RecordCode
			Else 
				INV_t_AssignedCode:=[ORDERS:24]Order_Code:3
			End if 
			[INVOICES:39]X_DepositRelatedTable:44:=Table:C252(->[ORDERS:24])
			[INVOICES:39]X_DepositRelatedRecordID:45:=INV_l_AssignedrecordID
			[INVOICES:39]Currency_Code:27:=[ORDERS:24]Currency_Code:32
			If ([INVOICES:39]Currency_Code:27#"")
				OBJECT SET ENTERABLE:C238([INVOICES:39]Currency_Code:27; False:C215)
			End if 
			If (INV_R_Depositmaxamt>0)
				[INVOICES:39]Total_Paid:6:=INV_R_Depositmaxamt
			End if 
	End case 
	OBJECT SET ENTERABLE:C238(INV_at_AssignOptions; False:C215)
	INV_at_AssignOptions:=1
Else 
	ARRAY TEXT:C222(INV_at_AssignOptions; 1)
	INV_at_AssignOptions{1}:="Orders"
	INV_t_AssignedCode:=""
	INV_at_AssignOptions:=0
End if 

Invoices_InLPBC
If ([INVOICES:39]Invoice_Number:1="")
	InvP_No
	
	OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; True:C214)
	OBJECT SET VISIBLE:C603(BCCM; True:C214)
	OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
	
Else 
	READ ONLY:C145([CCM_PSPTransaction:136])
	QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xDepositCode:12=[INVOICES:39]Invoice_Number:1)
	If (Records in selection:C76([CCM_PSPTransaction:136])>0)
		FIRST RECORD:C50([CCM_PSPTransaction:136])
		OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; True:C214)
		OBJECT SET VISIBLE:C603(BCCM; True:C214)
		OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
		For ($_l_Index; 1; Records in selection:C76([CCM_PSPTransaction:136]))
			$_bo_IsOK:=CCM_GetResponseValidFromTrans([CCM_PSPTransaction:136]x_ID:1)
			If ($_bo_IsOK)
				CC_t_AuthCode:=CCM_GetAuthCodeFromTrans([CCM_PSPTransaction:136]x_ID:1)
				If (CC_t_AuthCode#"")
					OBJECT SET VISIBLE:C603(BCCM; False:C215)
					OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; True:C214)
					OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
					$_l_Index:=99999
				Else 
					
				End if 
			End if 
			NEXT RECORD:C51([CCM_PSPTransaction:136])
		End for 
		UNLOAD RECORD:C212([CCM_PSPTransaction:136])
	Else 
		If (INV_bo_HidePayment)
			OBJECT SET VISIBLE:C603(BCCM; False:C215)
			OBJECT SET VISIBLE:C603(*; "oLabelAuthCode"; False:C215)
			OBJECT SET ENTERABLE:C238([INVOICES:39]Total_Paid:6; False:C215)
		End if 
		
	End if 
	
End if 

[INVOICES:39]State:10:=-2
Invoices_InLPB
QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSDeposit)
If ([INVOICES:39]Debtors_Account:15="")
	[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Credit_Account:5
	RELATE ONE:C42([INVOICES:39]Debtors_Account:15)
	vAccount:=[ACCOUNTS:32]Account_Name:3
	[INVOICES:39]Bank_Account:16:=[TRANSACTION_TYPES:31]Debit_Account:4
	RELATE ONE:C42([INVOICES:39]Bank_Account:16)
	vBAccount:=[ACCOUNTS:32]Account_Name:3
End if 
DB_t_CurrentFormUsage2:="P"
Macro_AccType("Load "+String:C10(Table:C252(->[INVOICES:39])))
ERR_MethodTrackerReturn("Invoices_InPLPB"; $_t_oldMethodName)