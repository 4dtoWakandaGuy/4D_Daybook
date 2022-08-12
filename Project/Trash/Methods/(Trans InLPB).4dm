//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 06:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(TRNS_lb_BankStatement;0)
	//ARRAY INTEGER(TRNS_ad_StamentDate;0)
	ARRAY LONGINT:C221($_al_StatementRecordIDS; 0)
	//ARRAY LONGINT(ACC_al_StatementID;0)
	ARRAY REAL:C219($_ar_TransReconciledAmounts; 0)
	//ARRAY REAL(TRNS_ar_CrAmount;0)
	//ARRAY REAL(TRNS_ar_DbAmount;0)
	//ARRAY REAL(TRNS_ar_ReconciledAmounts;0)
	//ARRAY TEXT(TRNS_at_BankAccount;0)
	//ARRAY TEXT(TRNS_at_Description;0)
	C_LONGINT:C283($_l_AreaBottom; $_l_AreaHeight; $_l_ButtonsHeight; $_l_ButtonsTop; $_l_ButtonsWidth; $_l_Index; $_l_LastButtonBottom; $_l_LastButtonLeft; $_l_LastButtonRight; $_l_LastButtonTop; $_l_LastFieldBottom)
	C_LONGINT:C283($_l_LastFieldLeft; $_l_LastFieldRight; $_l_LastFieldTop; $_l_LBBottom; $_l_LBLeft; $_l_LBRight; $_l_LBTop; $_l_NewWindowBottom; $_l_PotentialWindowBottom; $_l_StatementRow; $_l_WindowBottom)
	C_LONGINT:C283($_l_WIndowHeight; $_l_WindowLeft; $_l_WindowRIght; $_l_WIndowTop; TRN_l_BUT1; TRN_l_BUT10; TRN_l_BUT11; TRN_l_BUT12; TRN_l_BUT13; TRN_l_BUT14; TRN_l_BUT15)
	C_LONGINT:C283(TRN_l_BUT16; TRN_l_BUT17; TRN_l_BUT18; TRN_l_BUT19; TRN_l_BUT2; TRN_l_BUT20; TRN_l_BUT21; TRN_l_BUT22; TRN_l_BUT23; TRN_l_BUT24; TRN_l_BUT25)
	C_LONGINT:C283(TRN_l_BUT26; TRN_l_BUT27; TRN_l_BUT3; TRN_l_BUT4; TRN_l_BUT5; TRN_l_BUT6; TRN_l_BUT7; TRN_l_BUT8; TRN_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; ACC_t_CurrencyCode; oTRN_COL1; oTRN_COL10; oTRN_COL11; oTRN_COL12; oTRN_COL13; oTRN_COL14; oTRN_COL15; oTRN_COL16; oTRN_COL17)
	C_TEXT:C284(oTRN_COL18; oTRN_COL19; oTRN_COL2; oTRN_COL20; oTRN_COL21; oTRN_COL22; oTRN_COL23; oTRN_COL24; oTRN_COL25; oTRN_COL26; oTRN_COL27)
	C_TEXT:C284(oTRN_COL3; oTRN_COL4; oTRN_COL5; oTRN_COL6; oTRN_COL7; oTRN_COL8; oTRN_COL9; oTRN_HED1; oTRN_HED10; oTRN_HED11; oTRN_HED12)
	C_TEXT:C284(oTRN_HED13; oTRN_HED14; oTRN_HED15; oTRN_HED16; oTRN_HED17; oTRN_HED18; oTRN_HED19; oTRN_HED2; oTRN_HED20; oTRN_HED21; oTRN_HED22)
	C_TEXT:C284(oTRN_HED23; oTRN_HED24; oTRN_HED25; oTRN_HED26; oTRN_HED27; oTRN_HED3; oTRN_HED4; oTRN_HED5; oTRN_HED6; oTRN_HED7; oTRN_HED8)
	C_TEXT:C284(oTRN_HED9; vAccount; vAnalysis; vButtDisTRANS; vCompany; vLayer; vPeriod; vTitle1; vTransType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_InLPB")
If ([TRANSACTIONS:29]Batch_Number:7=0)
	Trans_No
End if 
RELATE ONE:C42([TRANSACTIONS:29]Transaction_Type_Code:1)
vTransType:=[TRANSACTION_TYPES:31]Transaction_Type_Name:2
RELATE ONE:C42([TRANSACTIONS:29]Analysis_Code:2)
vAnalysis:=[ANALYSES:36]Analysis_Name:2
RELATE ONE:C42([TRANSACTIONS:29]Account_Code:3)
vAccount:=[ACCOUNTS:32]Account_Name:3
RELATE ONE:C42([TRANSACTIONS:29]Period_Code:12)
vPeriod:=[PERIODS:33]Period_Name:2
RELATE ONE:C42([TRANSACTIONS:29]Layer_Code:23)
vLayer:=[LAYERS:76]Layer_Name:2
RELATE ONE:C42([TRANSACTIONS:29]Company_Code:9)
vCompany:=[COMPANIES:2]Company_Name:2
RELATE ONE:C42([TRANSACTIONS:29]Currency_Code:22)
ACC_t_CurrencyCode:=[CURRENCIES:71]Currency_Name:2

vTitle1:=Term VATWT("VAT/IO/UE/Amount")
vButtDisTRANS:="I DPMO   SSSRCADT"
If ([TRANSACTIONS:29]Transaction_ID:31>0)
	QUERY:C277([Bank_Reconcile:199]; [Bank_Reconcile:199]Reconciled_TransactionID:5=[TRANSACTIONS:29]Transaction_ID:31)
Else 
	REDUCE SELECTION:C351([Bank_Reconcile:199]; 0)
End if 
OBJECT GET COORDINATES:C663(*; "oChequeNumberFIeld"; $_l_LastFieldLeft; $_l_LastFieldTop; $_l_LastFieldRight; $_l_LastFieldBottom)
OBJECT GET COORDINATES:C663(*; "oSaveButton"; $_l_LastButtonLeft; $_l_LastButtonTop; $_l_LastButtonRight; $_l_LastButtonBottom)
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WIndowTop; $_l_WindowRIght; $_l_WindowBottom)
ARRAY LONGINT:C221(ACC_al_StatementID; 0)
ARRAY DATE:C224(TRNS_ad_StamentDate; 0)
ARRAY TEXT:C222(TRNS_at_BankAccount; 0)
ARRAY REAL:C219(TRNS_ar_CrAmount; 0)
ARRAY REAL:C219(TRNS_ar_ReconciledAmounts; 0)
ARRAY TEXT:C222(TRNS_at_BankAccount; 0)
ARRAY TEXT:C222(TRNS_at_Description; 0)
//TRACE

If (Records in selection:C76([Bank_Reconcile:199])>0)
	SELECTION TO ARRAY:C260([Bank_Reconcile:199]Bank_RecordID:2; $_al_StatementRecordIDS; [Bank_Reconcile:199]Reconciled_Amount:4; $_ar_TransReconciledAmounts)
	QUERY WITH ARRAY:C644([ACC_Bank_Statements:198]x_ID:1; $_al_StatementRecordIDS)
	SELECTION TO ARRAY:C260([ACC_Bank_Statements:198]x_ID:1; ACC_al_StatementID; [ACC_Bank_Statements:198]Bank_TransactionDate:5; TRNS_ad_StamentDate; [ACC_Bank_Statements:198]Bank_Account_Number:2; TRNS_at_BankAccount; [ACC_Bank_Statements:198]Bank_CreditAmount:9; TRNS_ar_CrAmount; [ACC_Bank_Statements:198]Bank_DebitAmount:8; TRNS_ar_DbAmount; [ACC_Bank_Statements:198]Bank_Transaction_Details:7; TRNS_at_Description)
	ARRAY REAL:C219(TRNS_ar_ReconciledAmounts; 0)
	ARRAY REAL:C219(TRNS_ar_ReconciledAmounts; Size of array:C274(TRNS_ad_StamentDate))
	For ($_l_Index; 1; Size of array:C274(TRNS_ad_StamentDate))
		$_l_StatementRow:=Find in array:C230($_al_StatementRecordIDS; ACC_al_StatementID{$_l_Index})
		If ($_l_StatementRow>0)
			TRNS_ar_ReconciledAmounts{$_l_Index}:=$_ar_TransReconciledAmounts{$_l_StatementRow}
		End if 
	End for 
	
	LB_SetupListbox(->TRNS_lb_BankStatement; "oTRN"; "TRN_L"; 1; ->ACC_al_StatementID; ->TRNS_ad_StamentDate; ->TRNS_at_BankAccount; ->TRNS_ar_DbAmount; ->TRNS_ar_CrAmount; ->TRNS_ar_ReconciledAmounts; ->TRNS_at_Description)
	LB_SetColumnHeaders(->TRNS_lb_BankStatement; "TRN_L"; 1; "ID"; "Date"; "Bank Account"; "Debit"; "Credit"; "Reconcilled"; "Description")
	LB_SetColumnWidths(->TRNS_lb_BankStatement; "oTRN"; 1; 0; 65; 70; 60; 60; 60; 250)
	LB_SetFormat(->TRNS_lb_BankStatement; 2; "|Accounts"; 4; 6)
	LB_SetEnterable(->TRNS_lb_BankStatement; False:C215; 0)
	LB_SetScroll(->TRNS_lb_BankStatement; -2; -2)
	LB_StyleSettings(->TRNS_lb_BankStatement; "Black"; 9; "STK_t"; ->[ACCOUNTS:32])
	OBJECT SET VISIBLE:C603(*; "oBankReconcilled"; True:C214)
	OBJECT SET VISIBLE:C603(*; "oStatementLabel"; True:C214)
	
	$_l_AreaHeight:=Size of array:C274(TRNS_ad_StamentDate)*20
	$_l_PotentialWindowBottom:=$_l_LastButtonBottom+$_l_AreaHeight
	If ($_l_AreaHeight<40)
		$_l_AreaHeight:=40
	End if 
	If ($_l_PotentialWindowBottom>(Screen height:C188-50))
		$_l_AreaBottom:=((Screen height:C188-50)-($_l_LastButtonBottom-$_l_LastButtonTop)-5)
		If ($_l_AreaBottom<$_l_LastFieldBottom-40)  //need to have at least 40 for the area
			$_l_AreaHeight:=40
		End if 
	End if 
	$_l_NewWindowBottom:=$_l_LastFieldBottom+10+$_l_AreaHeight+($_l_LastButtonBottom-$_l_LastButtonTop)+10  //bottom of last field plus a space plus the listbox area and then space for the buttons
	If ($_l_WindowBottom<$_l_NewWindowBottom)
		$_l_WindowBottom:=$_l_NewWindowBottom
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_WIndowTop; $_l_WindowRIght; $_l_WIndowTop+$_l_WindowBottom)
	End if 
	OBJECT GET COORDINATES:C663(*; "oBankReconcilled"; $_l_LBLeft; $_l_LBTop; $_l_LBRight; $_l_LBBottom)
	
	OBJECT SET COORDINATES:C1248(*; "oBankReconcilled"; $_l_LBLeft; $_l_LBTop; $_l_LBRight; $_l_LBTop+$_l_AreaHeight)
	OBJECT SET COORDINATES:C1248(*; "oReconcilledCB"; $_l_LBRight+5; $_l_LBTop; $_l_LBRight+89+5; $_l_LBTop+13)
	
	
	
Else 
	OBJECT SET VISIBLE:C603(*; "oBankReconcilled"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStatementLabel"; False:C215)
	$_l_WindowBottom:=($_l_LastFieldBottom+15)+($_l_LastButtonBottom-$_l_LastButtonTop)+10  //bottom of last field plus a space plus the listbox area and then space for the buttons
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_WIndowTop; $_l_WindowRIght; $_l_WIndowTop+$_l_WindowBottom)
	OBJECT SET COORDINATES:C1248(*; "oReconcilledCB"; ($_l_LastFieldLeft); $_l_LastFieldBottom+5; $_l_LastFieldLeft+89; ($_l_LastFieldBottom+5)+13)
	
End if 


Input_Buttons(->[TRANSACTIONS:29]; ->vButtDisTRANS)
If (True:C214)
	OBJECT GET COORDINATES:C663(*; "oSaveButton"; $_l_LastButtonLeft; $_l_LastButtonTop; $_l_LastButtonRight; $_l_LastButtonBottom)
	If (Size of array:C274(TRNS_ad_StamentDate)>0)
		$_l_AreaHeight:=Size of array:C274(TRNS_ad_StamentDate)*20
		$_l_PotentialWindowBottom:=$_l_LastButtonBottom+$_l_AreaHeight
		If ($_l_AreaHeight<40)
			$_l_AreaHeight:=40
		End if 
		If ($_l_PotentialWindowBottom>(Screen height:C188-50))
			$_l_AreaBottom:=((Screen height:C188-50)-($_l_LastButtonBottom-$_l_LastButtonTop)-5)
			If ($_l_AreaBottom<$_l_LastFieldBottom-40)  //need to have at least 40 for the area
				$_l_AreaHeight:=40
			End if 
		End if 
		$_l_NewWindowBottom:=$_l_LastFieldBottom+10+$_l_AreaHeight+($_l_LastButtonBottom-$_l_LastButtonTop)+10  //bottom of last field plus a space plus the listbox area and then space for the buttons
		If ($_l_WindowBottom<$_l_NewWindowBottom)
			$_l_WindowBottom:=$_l_NewWindowBottom
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_WIndowTop; $_l_WindowRIght; $_l_WIndowTop+$_l_WindowBottom)
		End if 
		OBJECT GET COORDINATES:C663(*; "oBankReconcilled"; $_l_LBLeft; $_l_LBTop; $_l_LBRight; $_l_LBBottom)
		
		OBJECT SET COORDINATES:C1248(*; "oBankReconcilled"; $_l_LBLeft; $_l_LBTop; $_l_LBRight; $_l_LBTop+$_l_AreaHeight)
		OBJECT GET COORDINATES:C663(*; "oBankReconcilled"; $_l_LastFieldLeft; $_l_LastFieldTop; $_l_LastFieldRight; $_l_LastFieldBottom)
		
	Else 
		OBJECT GET COORDINATES:C663(*; "oChequeNumberFIeld"; $_l_LastFieldLeft; $_l_LastFieldTop; $_l_LastFieldRight; $_l_LastFieldBottom)
	End if 
	
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WIndowTop; $_l_WindowRIght; $_l_WindowBottom)
	$_l_WIndowHeight:=$_l_WindowBottom-$_l_WIndowTop
	$_l_ButtonsHeight:=$_l_LastButtonBottom-$_l_LastButtonTop
	$_l_ButtonsTop:=($_l_WIndowHeight-5)-$_l_ButtonsHeight
	
	OBJECT SET COORDINATES:C1248(*; "oSaveButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
	
	
	//TRACE
	$_l_ButtonsWidth:=$_l_LastButtonRight-$_l_LastButtonLeft
	$_l_LastButtonRight:=$_l_LastButtonLeft-2
	$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
	OBJECT SET COORDINATES:C1248(*; "oCancelButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
	$_l_LastButtonRight:=$_l_LastButtonLeft-2
	$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
	OBJECT SET COORDINATES:C1248(*; "oMinusButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
	$_l_LastButtonRight:=$_l_LastButtonLeft-2
	$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
	OBJECT SET COORDINATES:C1248(*; "oPlusButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
	$_l_LastButtonRight:=$_l_LastButtonLeft-2
	$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
	OBJECT SET COORDINATES:C1248(*; "oReportButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
	$_l_LastButtonRight:=$_l_LastButtonLeft-2
	$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
	OBJECT SET COORDINATES:C1248(*; "oQualitiesButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
	$_l_LastButtonRight:=$_l_LastButtonLeft-2
	$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
	OBJECT SET COORDINATES:C1248(*; "oCompanyButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
	$_l_LastButtonRight:=$_l_LastButtonLeft-2
	$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
	OBJECT SET COORDINATES:C1248(*; "oContactsButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
	$_l_LastButtonRight:=$_l_LastButtonLeft-2
	$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
	OBJECT SET COORDINATES:C1248(*; "oProductsButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
	$_l_LastButtonRight:=$_l_LastButtonLeft-2
	$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
	OBJECT SET COORDINATES:C1248(*; "oTimeManagerButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
	$_l_LastButtonRight:=$_l_LastButtonLeft-2
	$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
	
End if 

Macro_AccType("Load "+String:C10(Table:C252(->[TRANSACTIONS:29])))
ERR_MethodTrackerReturn("Trans_InLPB"; $_t_oldMethodName)
