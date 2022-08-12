//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans Rec
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 15:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo; vTr)
	C_REAL:C285(vBalance; vSubtotal; vTotal)
	C_TEXT:C284($_t_AccountName; $_t_oldMethodName; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans Rec")
//trans Rec
Start_Process
If (Trans_File)
	While (vTr=1)
		IDLE:C311  // 7/04/03 pb
		DB_t_CurrentFormUsage:="Rec"
		Trans_Sel
		//TRACE
		If (vTr=1)
			If (Records in selection:C76([TRANSACTIONS:29])>0)
				If (Acc_t_AccountCodeFrom=Acc_t_AccountCodeTo)
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=Acc_t_AccountCodeFrom)
					If (Length:C16([ACCOUNTS:32]Account_Name:3)<(51-21))
						vTitle:="BANK RECONCILIATION: "+[ACCOUNTS:32]Account_Name:3
					Else 
						$_t_AccountName:=Substring:C12([ACCOUNTS:32]Account_Name:3; 1; (51-21))
						vTitle:="BANK RECONCILIATION: "+$_t_AccountName
					End if 
					
				Else 
					vTitle:="BANK RECONCILIATION: "+Acc_t_AccountCodeFrom+" - "+Acc_t_AccountCodeTo
				End if 
				CREATE SET:C116([TRANSACTIONS:29]; "Extra2")
				If (Acc_t_AccountCodeFrom=Acc_t_AccountCodeTo)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom; *)
				Else 
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3>=Acc_t_AccountCodeFrom; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3<=Acc_t_AccountCodeTo; *)
				End if 
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Reconciled:14=True:C214)
				Trans_ACLSrc
				
				If (Records in selection:C76([TRANSACTIONS:29])>Records in set:C195("Extra2"))
					If (Acc_t_AccountCodeFrom=Acc_t_AccountCodeTo)
						QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=Acc_t_AccountCodeFrom)
					Else 
						QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2>=Acc_t_AccountCodeFrom; *)
						QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Account_Code:2<=Acc_t_AccountCodeTo)
					End if 
					ACC_BalACLSrc
					vBalance:=Round:C94((Sum:C1([ACCOUNT_BALANCES:34]Balance:3)); 2)
					If (Acc_t_AccountCodeFrom=Acc_t_AccountCodeTo)
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=Acc_t_AccountCodeFrom; *)
					Else 
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3>=Acc_t_AccountCodeFrom; *)
						QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3<=Acc_t_AccountCodeTo; *)
					End if 
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Reconciled:14=False:C215)
					Trans_ACLSrc
					vBalance:=Round:C94((vBalance-(Sum:C1([TRANSACTIONS:29]Amount:6))); 2)
				Else 
					vBalance:=Round:C94((Sum:C1([TRANSACTIONS:29]Amount:6)); 2)
				End if 
				USE SET:C118("Extra2")
				vSubtotal:=0
				vTotal:=vBalance
				vNo:=Records in selection:C76([TRANSACTIONS:29])
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3; >; [TRANSACTIONS:29]Trans_Date:5; >)
				FORM SET OUTPUT:C54([TRANSACTIONS:29]; "Trans BR")
				Open_Pro_Window("Bank Reconciliation"; 0; 1; ->[TRANSACTIONS:29]; WIN_t_CurrentOutputform)
				//FS_SetFormSort (WIN_t_CurrentOutputform)
				WIn_SetFormSize(1; ->[TRANSACTIONS:29]; WIN_t_CurrentOutputform)
				MODIFY SELECTION:C204([TRANSACTIONS:29]; *)
				Close_ProWin
				vTr:=0
			Else 
				Gen_None("Transactions"; ->vTr)
			End if 
		End if 
	End while 
End if 

Process_End
ERR_MethodTrackerReturn("Trans Rec"; $_t_oldMethodName)
