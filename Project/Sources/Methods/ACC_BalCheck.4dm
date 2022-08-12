//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalCheck
	//------------------ Method Notes ------------------
	//was called from ZACC_BalCheck but is replaced with ACC_ValidateBalances
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:53
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_WindowReferenceRow; $_l_WindowRow; vAB; vNo; vNo2; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_AccBalance; $_r_AccBalance2; $_r_BalanceProcess; $_r_Change)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $_t_Semaphore; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalCheck")
//ACC_BalCheck
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
ACC_BalFile
vAB:=1
While (vAB=1)
	// 03/04/03 pb
	vTitle:="CHECK BALANCES"
	ACC_BalSelect
	If (vAB=1)
		If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
			vNo:=Records in selection:C76([ACCOUNT_BALANCES:34])
			vNo2:=vNo
			ORDER BY:C49([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4; >; [ACCOUNT_BALANCES:34]Account_Code:2; >; [ACCOUNT_BALANCES:34]Analysis_Code:1; >)
			Open_Pro_Window("Check Balances"; 0; 1; ->[ACCOUNT_BALANCES:34]; WIN_t_CurrentOutputform)
			DB_t_CurrentFormUsage:="Select"
			FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252(->[ACCOUNT_BALANCES:34]))
			
			WIn_SetFormSize(1; ->[ACCOUNT_BALANCES:34]; WIN_t_CurrentOutputform)
			
			//D`ISPLAY SELECTION([ACC BALANCES];*)
			Close_ProWin
			//If (OK=1)
			Are_You_Sure
			If (OK=1)
				Open_AnyTypeWindow(200; 300; 5; "Check Account Balances")
				MESSAGE:C88(Char:C90(13)+"   Period, Account, Analysis, Currency, Layer"+Char:C90(13)+Char:C90(13))
				If (vNo2#Records in selection:C76([ACCOUNT_BALANCES:34]))
					ORDER BY:C49([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4; >; [ACCOUNT_BALANCES:34]Account_Code:2; >; [ACCOUNT_BALANCES:34]Analysis_Code:1; >)
				End if 
				FIRST RECORD:C50([ACCOUNT_BALANCES:34])
				While (Not:C34(End selection:C36([ACCOUNT_BALANCES:34])))
					$_t_Semaphore:=[ACCOUNT_BALANCES:34]Account_Code:2
					While (Semaphore:C143("UPDATEBALANCE"+$_t_Semaphore))
						DelayTicks
					End while 
					MESSAGE:C88("   "+[ACCOUNT_BALANCES:34]Period_Code:4+"   "+[ACCOUNT_BALANCES:34]Account_Code:2+"   "+[ACCOUNT_BALANCES:34]Analysis_Code:1+"   "+[ACCOUNT_BALANCES:34]Currency_Code:6+"   "+[ACCOUNT_BALANCES:34]Layer_Code:5+Char:C90(13))
					$_r_AccBalance:=[ACCOUNT_BALANCES:34]Balance:3
					$_r_Change:=0
					[ACCOUNT_BALANCES:34]Balance:3:=0
					Case of 
						: ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerVatInputACC)
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=[ACCOUNT_BALANCES:34]Analysis_Code:1; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=[ACCOUNT_BALANCES:34]Period_Code:4; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[ACCOUNT_BALANCES:34]Layer_Code:5; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS"; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS"; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerVatInputACC)
							[ACCOUNT_BALANCES:34]Balance:3:=Gen_Round((Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=[ACCOUNT_BALANCES:34]Analysis_Code:1; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=[ACCOUNT_BALANCES:34]Period_Code:4; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[ACCOUNT_BALANCES:34]Layer_Code:5; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS"; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS"; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=DB_GetLedgerVatInputACC)
							[ACCOUNT_BALANCES:34]Balance:3:=Gen_Round(([ACCOUNT_BALANCES:34]Balance:3+Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
						: ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerCashvatACC)
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OC"; *)
							QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IC"; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=[ACCOUNT_BALANCES:34]Analysis_Code:1; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=[ACCOUNT_BALANCES:34]Period_Code:4; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[ACCOUNT_BALANCES:34]Layer_Code:5; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
							[ACCOUNT_BALANCES:34]Balance:3:=Gen_Round((0-Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OS"; *)
							QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IS"; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=[ACCOUNT_BALANCES:34]Analysis_Code:1; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=[ACCOUNT_BALANCES:34]Period_Code:4; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[ACCOUNT_BALANCES:34]Layer_Code:5; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
							[ACCOUNT_BALANCES:34]Balance:3:=Gen_Round(([ACCOUNT_BALANCES:34]Balance:3+Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=[ACCOUNT_BALANCES:34]Analysis_Code:1; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=[ACCOUNT_BALANCES:34]Period_Code:4; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[ACCOUNT_BALANCES:34]Layer_Code:5; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=DB_GetLedgerCashvatACC)
							[ACCOUNT_BALANCES:34]Balance:3:=Gen_Round(([ACCOUNT_BALANCES:34]Balance:3+Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
						Else 
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=[ACCOUNT_BALANCES:34]Account_Code:2; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=[ACCOUNT_BALANCES:34]Analysis_Code:1; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Period_Code:12=[ACCOUNT_BALANCES:34]Period_Code:4; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[ACCOUNT_BALANCES:34]Currency_Code:6; *)
							QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[ACCOUNT_BALANCES:34]Layer_Code:5)
							[ACCOUNT_BALANCES:34]Balance:3:=Gen_Round((Sum:C1([TRANSACTIONS:29]Amount:6)); 2; 2)
							QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="@C")
							If (Records in selection:C76([TRANSACTIONS:29])>0)
								[ACCOUNT_BALANCES:34]Balance:3:=Gen_Round(([ACCOUNT_BALANCES:34]Balance:3+Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
							End if 
					End case 
					DB_SaveRecord(->[ACCOUNT_BALANCES:34])
					$_r_AccBalance2:=[ACCOUNT_BALANCES:34]Balance:3
					$_r_BalanceProcess:=New process:C317("ACC_RecordBalance"; 180000; "RecordAccountBalanceChange"; [ACCOUNT_BALANCES:34]Account_Code:2; "Validation"; $_r_Change; $_r_AccBalance; $_r_AccBalance2; "Server ACCBalCheck")
					AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
					CLEAR SEMAPHORE:C144("UPDATEBALANCE"+$_t_Semaphore)
					
					NEXT RECORD:C51([ACCOUNT_BALANCES:34])
				End while 
				
				CLOSE WINDOW:C154
				If (WIN_bo_TrackerInited)
					$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
					If ($_l_WindowReferenceRow>0)
						WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
					End if 
				End if 
				WS_KeepFocus
				
				UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
			End if 
		End if 
		vAB:=0
	Else 
		Gen_None("Balances"; ->vAB)
	End if 
End while 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("ACC_BalCheck"; $_t_oldMethodName)
