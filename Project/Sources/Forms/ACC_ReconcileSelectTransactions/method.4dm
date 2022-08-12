If (False:C215)
	//Project Form Method Name:      ACC_ReconcileSelectTransactions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/02/2012 15:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(ABR_A_TRReconcilledAmt)
	//C_UNKNOWN(ABR_ResolvedDescription)
	//ARRAY BOOLEAN(ABC_lb_ResolvedTransactions;0)
	//ARRAY BOOLEAN(ABC_lb_UnResolvedTransactions;0)
	//ARRAY BOOLEAN(ABR_abo_UNSelected;0)
	//ARRAY INTEGER(ABR_ad_ResolvedDate;0)
	//ARRAY INTEGER(ABR_ad_unResolvedDate;0)
	//ARRAY LONGINT(ABR_al_ResolvedBatch;0)
	//ARRAY LONGINT(ABR_al_TransactionID;0)
	//ARRAY LONGINT(ABR_al_unResolvedBatch;0)
	//ARRAY LONGINT(ABR_al_UNTransactionID;0)
	//ARRAY LONGINT(ACC_al_PartReconcileID;0)
	//ARRAY REAL(ABR_ar_AlreadyReconciledAmount;0)
	//ARRAY REAL(ABR_ar_ResolvedTRAmount;0)
	//ARRAY REAL(ABR_ar_TransactionBalance;0)
	//ARRAY REAL(ABR_ar_TRYUNReconcilledAmt;0)
	//ARRAY REAL(ABR_ar_unResolvedTRAmount;0)
	//ARRAY REAL(ACC_ar_PartReconcile;0)
	//ARRAY TEXT(ABR_at_CurrencyCode;0)
	//ARRAY TEXT(ABR_at_FilterTypes;0)
	//ARRAY TEXT(ABR_at_ResolvedAccountCOde;0)
	//ARRAY TEXT(ABR_at_ResolvedCheque;0)
	//ARRAY TEXT(ABR_at_ResolvedPeriod;0)
	//ARRAY TEXT(ABR_at_unCurrencyCode;0)
	//ARRAY TEXT(ABR_at_unResolvedAccountCOde;0)
	//ARRAY TEXT(ABR_at_UnResolvedCheque;0)
	//ARRAY TEXT(ABR_at_unResolvedDescription;0)
	//ARRAY TEXT(ABR_at_unResolvedPeriod;0)
	C_BOOLEAN:C305($_bo_TotalisVisible; ABR_bo_WindowisOpen; ACC_bo_ReconcileModified; DB_bo_NoLoad)
	C_LONGINT:C283($_l_ButtonHeight; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonWidth; $_l_Event; $_l_Height; $_l_Height2; $_l_LabelHeight; $_l_LabelHeight2; $_l_ListBottom; $_l_ListHeight)
	C_LONGINT:C283($_l_NextToBottom; $_l_NextTotals; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectBottom4; $_l_ObjectHeight; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectLeft3; $_l_ObjectLeft4)
	C_LONGINT:C283($_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectRight4; $_l_ObjectTop; $_l_ObjectTop2; $_l_ObjectTop3; $_l_ObjectTop4; $_l_TotalsTop; $_l_UnReconcilledTop; $_l_Windowbottom; $_l_WindowHeight)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_WindowWidth; ABR_l_BUT1; ABR_l_BUT10; ABR_l_BUT11; ABR_l_BUT12; ABR_l_BUT13; ABR_l_BUT14; ABR_l_BUT15)
	C_LONGINT:C283(ABR_l_BUT16; ABR_l_BUT17; ABR_l_BUT18; ABR_l_BUT19; ABR_l_BUT2; ABR_l_BUT20; ABR_l_BUT21; ABR_l_BUT22; ABR_l_BUT23; ABR_l_BUT24; ABR_l_BUT25)
	C_LONGINT:C283(ABR_l_BUT26; ABR_l_BUT27; ABR_l_BUT3; ABR_l_BUT4; ABR_l_BUT5; ABR_l_BUT6; ABR_l_BUT7; ABR_l_BUT8; ABR_l_BUT9; ABR_l_DefaultFilterDates; ABR_l_FilterDates)
	C_LONGINT:C283(ABT_l_BUT1; ABT_l_BUT10; ABT_l_BUT11; ABT_l_BUT12; ABT_l_BUT13; ABT_l_BUT14; ABT_l_BUT15; ABT_l_BUT16; ABT_l_BUT17; ABT_l_BUT18; ABT_l_BUT19)
	C_LONGINT:C283(ABT_l_BUT2; ABT_l_BUT20; ABT_l_BUT21; ABT_l_BUT22; ABT_l_BUT23; ABT_l_BUT24; ABT_l_BUT25; ABT_l_BUT26; ABT_l_BUT27; ABT_l_BUT3; ABT_l_BUT4)
	C_LONGINT:C283(ABT_l_BUT5; ABT_l_BUT6; ABT_l_BUT7; ABT_l_BUT8; ABT_l_BUT9)
	C_REAL:C285(ACC_R_RemainingtoReconcile; ACC_R_SelectedReconcilles)
	C_TEXT:C284($_t_oldMethodName; ABR_t_checkno; oABR_COL1; oABR_COL10; oABR_COL11; oABR_COL12; oABR_COL13; oABR_COL14; oABR_COL15; oABR_COL16; oABR_COL17)
	C_TEXT:C284(oABR_COL18; oABR_COL19; oABR_COL2; oABR_COL20; oABR_COL21; oABR_COL22; oABR_COL23; oABR_COL24; oABR_COL25; oABR_COL26; oABR_COL27)
	C_TEXT:C284(oABR_COL3; oABR_COL4; oABR_COL5; oABR_COL6; oABR_COL7; oABR_COL8; oABR_COL9; oABR_HED1; oABR_HED10; oABR_HED11; oABR_HED12)
	C_TEXT:C284(oABR_HED13; oABR_HED14; oABR_HED15; oABR_HED16; oABR_HED17; oABR_HED18; oABR_HED19; oABR_HED2; oABR_HED20; oABR_HED21; oABR_HED22)
	C_TEXT:C284(oABR_HED23; oABR_HED24; oABR_HED25; oABR_HED26; oABR_HED27; oABR_HED3; oABR_HED4; oABR_HED5; oABR_HED6; oABR_HED7; oABR_HED8)
	C_TEXT:C284(oABR_HED9; oABT_COL1; oABT_COL10; oABT_COL11; oABT_COL12; oABT_COL13; oABT_COL14; oABT_COL15; oABT_COL16; oABT_COL17; oABT_COL18)
	C_TEXT:C284(oABT_COL19; oABT_COL2; oABT_COL20; oABT_COL21; oABT_COL22; oABT_COL23; oABT_COL24; oABT_COL25; oABT_COL26; oABT_COL27; oABT_COL3)
	C_TEXT:C284(oABT_COL4; oABT_COL5; oABT_COL6; oABT_COL7; oABT_COL8; oABT_COL9; oABT_HED1; oABT_HED10; oABT_HED11; oABT_HED12; oABT_HED13)
	C_TEXT:C284(oABT_HED14; oABT_HED15; oABT_HED16; oABT_HED17; oABT_HED18; oABT_HED19; oABT_HED2; oABT_HED20; oABT_HED21; oABT_HED22; oABT_HED23)
	C_TEXT:C284(oABT_HED24; oABT_HED25; oABT_HED26; oABT_HED27; oABT_HED3; oABT_HED4; oABT_HED5; oABT_HED6; oABT_HED7; oABT_HED8; oABT_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM ACC_ReconcileSelectTransactions"; Form event code:C388)
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		ACC_bo_ReconcileModified:=False:C215
		ABR_t_checkno:=""
		ABR_l_FilterDates:=0
		If (ABR_l_DefaultFilterDates>0)
			ABR_l_FilterDates:=ABR_l_DefaultFilterDates
			COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "ToReconcileFilteredByDate")
		End if 
		ABR_l_DefaultFilterDates:=0
		ARRAY TEXT:C222(ABR_at_FilterTypes; 0)
		APPEND TO ARRAY:C911(ABR_at_FilterTypes; "Find sales invoice payment")
		APPEND TO ARRAY:C911(ABR_at_FilterTypes; "Find credit card sales payments")
		//APPEND TO ARRAY(ABR_at_FilterTypes;"Find Purchase invoice payment")
		APPEND TO ARRAY:C911(ABR_at_FilterTypes; "Find purchase Invoice payment")
		APPEND TO ARRAY:C911(ABR_at_FilterTypes; "Find other transactions")
		APPEND TO ARRAY:C911(ABR_at_FilterTypes; "Find transactions matching amount")
		APPEND TO ARRAY:C911(ABR_at_FilterTypes; "Find by payment Reference")  //TRACE
		
		ABR_at_FilterTypes:=0
		ACC_R_SelectedReconcilles:=0
		If ([ACC_Bank_Statements:198]Bank_CreditAmount:9#0)
			ACC_R_RemainingtoReconcile:=([ACC_Bank_Statements:198]Bank_CreditAmount:9+[ACC_Bank_Statements:198]Bank_DebitAmount:8)-[ACC_Bank_Statements:198]Bank_ReconciledAmount:11
			
		Else 
			ACC_R_RemainingtoReconcile:=([ACC_Bank_Statements:198]Bank_DebitAmount:8)-Abs:C99([ACC_Bank_Statements:198]Bank_ReconciledAmount:11)
		End if 
		ARRAY REAL:C219(ACC_ar_PartReconcile; 0)
		ARRAY LONGINT:C221(ACC_al_PartReconcileID; 0)
		
		
		
		
		
		LB_SetupListbox(->ABC_lb_ResolvedTransactions; "oABR"; "ABR_L"; 1; ->ABR_al_TransactionID; ->ABR_at_ResolvedPeriod; ->ABR_ad_ResolvedDate; ->ABR_at_ResolvedCheque; ->ABR_al_ResolvedBatch; ->ABR_ResolvedDescription; ->ABR_at_ResolvedAccountCOde; ->ABR_at_CurrencyCode; ->ABR_ar_ResolvedTRAmount; ->ABR_A_TRReconcilledAmt)
		LB_SetColumnHeaders(->ABC_lb_ResolvedTransactions; "ABR_L"; 1; "ID"; "Period"; "Date"; "Reference"; "Batch No"; "Description"; "Account"; "Curency"; "Transaction Total"; "Reconcilled Amount")
		LB_SetColumnWidths(->ABC_lb_ResolvedTransactions; "oABR"; 1; 0; 97; 88; 100; 100; 200; 80; 50; 90; 90)
		LB_SetFormat(->ABC_lb_ResolvedTransactions; 2; "|Accounts"; 9; 10)
		LB_SetEnterable(->ABC_lb_ResolvedTransactions; False:C215; 0)
		LB_SetScroll(->ABC_lb_ResolvedTransactions; -2; -2)
		LB_StyleSettings(->ABC_lb_ResolvedTransactions; "Black"; 9; "STK_t"; ->[ACCOUNTS:32])
		
		
		
		
		
		ARRAY BOOLEAN:C223(ABR_abo_UNSelected; 0)
		ARRAY BOOLEAN:C223(ABR_abo_UNSelected; Size of array:C274(ABR_al_UNTransactionID))
		LB_SetupListbox(->ABC_lb_UnResolvedTransactions; "oABT"; "ABT_L"; 1; ->ABR_abo_UNSelected; ->ABR_al_UNTransactionID; ->ABR_at_unResolvedPeriod; ->ABR_ad_unResolvedDate; ->ABR_at_UnResolvedCheque; ->ABR_al_unResolvedBatch; ->ABR_at_unResolvedDescription; ->ABR_at_unResolvedAccountCOde; ->ABR_at_unCurrencyCode; ->ABR_ar_unResolvedTRAmount; ->ABR_ar_AlreadyReconciledAmount; ->ABR_ar_TransactionBalance; ->ABR_ar_TRYUNReconcilledAmt)
		
		
		LB_SetColumnHeaders(->ABC_lb_UnResolvedTransactions; "ABT_L"; 1; "Select"; "ID"; "Period"; "Date"; "Reference"; "Batch No"; "Description"; "Account"; "Curency"; "Transaction Total"; "Previously Reconciled"; "Balance"; "Reconcile Amount")
		LB_SetColumnWidths(->ABC_lb_UnResolvedTransactions; "oABT"; 1; 40; 0; 97; 88; 100; 100; 200; 80; 50; 90; 90; 90; 90)
		LB_SetFormat(->ABC_lb_UnResolvedTransactions; 2; "|Accounts"; 10; 11)
		
		LB_SetEnterable(->ABC_lb_UnResolvedTransactions; False:C215; 0)
		LB_SetEnterable(->ABC_lb_UnResolvedTransactions; True:C214; 1)
		LB_SetScroll(->ABC_lb_UnResolvedTransactions; -2; -2)
		LB_StyleSettings(->ABC_lb_UnResolvedTransactions; "Black"; 9; "STK_t"; ->[ACCOUNTS:32])
		//398 min
		//TRACE
		If (Size of array:C274(ABR_al_TransactionID)=0)
			OBJECT GET COORDINATES:C663(ABC_lb_ResolvedTransactions; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowRight; $_l_ObjectBottom)
			OBJECT SET VISIBLE:C603(*; "oReconcilledLabel"; False:C215)
			OBJECT SET VISIBLE:C603(ABC_lb_ResolvedTransactions; False:C215)
			OBJECT GET COORDINATES:C663(*; "oReconcilledTotalLabel"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_ObjectHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
			OBJECT MOVE:C664(*; "oReconcilledTotalLabel"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; ($_l_ObjectTop+$_l_ObjectHeight); *)
			OBJECT MOVE:C664(*; "oNulReconcile"; $_l_ObjectLeft; $_l_ObjectTop; ($_l_ObjectLeft+286); ($_l_ObjectTop+$_l_ObjectHeight); *)
			OBJECT GET COORDINATES:C663(*; "oReconcilledTotal"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_ObjectHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
			OBJECT MOVE:C664(*; "oReconcilledTotal"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; ($_l_ObjectTop+$_l_ObjectHeight); *)
			$_l_UnReconcilledTop:=($_l_ObjectTop+$_l_ObjectHeight)+15
		Else 
			$_l_Height:=15*(Size of array:C274(ABR_al_TransactionID))
			If ($_l_Height<50)
				$_l_Height:=50
			End if 
			If ($_l_Height>73)
				If ($_l_Height>150)
					$_l_Height:=150
				End if 
				OBJECT GET COORDINATES:C663(ABC_lb_ResolvedTransactions; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "oReconcilledTotalLabel"; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowRight; ($_l_ObjectTop+$_l_Height); *)
				$_l_ObjectTop:=$_l_ObjectTop+$_l_Height+15
				OBJECT GET COORDINATES:C663(*; "oReconcilledTotalLabel"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_ObjectHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
				OBJECT MOVE:C664(*; "oReconcilledTotalLabel"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; ($_l_ObjectTop+$_l_ObjectHeight); *)
				OBJECT MOVE:C664(*; "oNulReconcile"; $_l_ObjectLeft; $_l_ObjectTop; ($_l_ObjectLeft+286); ($_l_ObjectTop+$_l_ObjectHeight); *)
				OBJECT GET COORDINATES:C663(*; "oReconcilledTotal"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_ObjectHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
				OBJECT MOVE:C664(*; "oReconcilledTotal"; $_l_ObjectLeft2; $_l_ObjectTop; $_l_ObjectRight2; ($_l_ObjectTop+$_l_ObjectHeight); *)
				$_l_UnReconcilledTop:=$_l_ObjectTop+$_l_Height+5+$_l_ObjectHeight+10
			Else 
				OBJECT GET COORDINATES:C663(*; "oReconcilledTotal"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				$_l_UnReconcilledTop:=$_l_ObjectBottom2+10
			End if 
			
		End if 
		If (Size of array:C274(ABR_al_UNTransactionID)>0)
			$_l_Height2:=15*(Size of array:C274(ABR_al_UNTransactionID))
			If ($_l_Height2>200)
				$_l_Height2:=200
			End if 
			If ($_l_Height2<150)
				$_l_Height2:=150
			End if 
			OBJECT GET COORDINATES:C663(ABC_lb_UnResolvedTransactions; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowRight; $_l_ObjectBottom)
			OBJECT MOVE:C664(ABC_lb_UnResolvedTransactions; $_l_ObjectLeft; $_l_UnReconcilledTop; $_l_WindowRight; ($_l_UnReconcilledTop+$_l_Height2); *)
			$_l_TotalsTop:=($_l_UnReconcilledTop+$_l_Height2)+15
			OBJECT GET COORDINATES:C663(*; "oUnreconcilledTransactionsLabel"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_LabelHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
			OBJECT MOVE:C664(*; "oUnreconcilledTransactionsLabel"; $_l_ObjectLeft2; $_l_UnReconcilledTop; $_l_ObjectRight2; ($_l_UnReconcilledTop+$_l_LabelHeight); *)
			OBJECT GET COORDINATES:C663(*; "oSelectedTotalLabel"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_LabelHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
			OBJECT MOVE:C664(*; "oSelectedTotalLabel"; $_l_ObjectLeft2; $_l_TotalsTop; $_l_ObjectRight2; ($_l_TotalsTop+$_l_LabelHeight); *)
			OBJECT GET COORDINATES:C663(*; "oSelectedunReconcilledTotal"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_LabelHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
			OBJECT MOVE:C664(*; "oSelectedunReconcilledTotal"; $_l_ObjectLeft2; $_l_TotalsTop; $_l_ObjectRight2; ($_l_TotalsTop+$_l_LabelHeight); *)
			$_l_NextTotals:=($_l_TotalsTop+$_l_LabelHeight)+15
			OBJECT GET COORDINATES:C663(*; "oRemainingLabel"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_LabelHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
			OBJECT MOVE:C664(*; "ORemainingLabel"; $_l_ObjectLeft2; $_l_NextTotals; $_l_ObjectRight2; ($_l_NextTotals+$_l_LabelHeight); *)
			OBJECT GET COORDINATES:C663(*; "oRemainingTotal"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			$_l_LabelHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
			OBJECT MOVE:C664(*; "oRemainingTotal"; $_l_ObjectLeft2; $_l_NextTotals; $_l_ObjectRight2; ($_l_NextTotals+$_l_LabelHeight); *)
			$_l_ButtonTop:=$_l_NextTotals+$_l_LabelHeight+25
			$_bo_TotalisVisible:=True:C214
		Else 
			OBJECT SET VISIBLE:C603(ABC_lb_UnResolvedTransactions; False:C215)
			OBJECT SET VISIBLE:C603(*; "oUnreconcilledTransactionsLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSelectedTotalLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oSelectedunReconcilledTotal"; False:C215)
			OBJECT SET VISIBLE:C603(*; "ORemainingLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRemainingTotal"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oFiltersDateLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oFilterDates"; False:C215)
			
			//OBJECT SET VISIBLE(ABR__bo_FindothTransactions;False)
			//OBJECT SET VISIBLE(ABR__bo_FindPPTransactions;False)
			//OBJECT SET VISIBLE(ABR__bo_FindINVTransactions;False)
			//OBJECT SET VISIBLE(ABR__bo_FindCCTransactions;False)
			//OBJECT SET VISIBLE(ABR__bo_FindamtTransactions;False)
			OBJECT SET VISIBLE:C603(ABR_at_FilterTypes; False:C215)
			OBJECT SET VISIBLE:C603(*; "OGeneralSearch"; False:C215)
			OBJECT SET VISIBLE:C603(*; "OEnterTransaction"; False:C215)
			
			OBJECT SET VISIBLE:C603(*; "oFiltersLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oFiltersDatesLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oFiltersDates"; False:C215)
			$_bo_TotalisVisible:=False:C215
			$_l_ButtonTop:=$_l_UnReconcilledTop
		End if 
		OBJECT GET COORDINATES:C663(*; "oButtonContinue"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		$_l_ButtonHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
		$_l_ButtonWidth:=$_l_ObjectRight2-$_l_ObjectLeft2
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
		$_l_Windowbottom:=($_l_ButtonTop+$_l_ButtonHeight)+30
		$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
		If ($_bo_TotalisVisible)
			
			WS_AutoscreenSize(2; $_l_Windowbottom+$_l_WindowTop; $_l_WindowRight; Table name:C256(->[ACC_Bank_Statements:198])+"_"+"ReconcileWindow")
		Else 
			WS_AutoscreenSize(2; $_l_Windowbottom+$_l_WindowTop; $_l_WindowRight; Table name:C256(->[ACC_Bank_Statements:198])+"_"+"ReconcileWindowsmall")
		End if 
		$_l_ButtonTop:=($_l_WindowBottom-$_l_WindowTop)-20-$_l_ButtonHeight
		$_l_ButtonLeft:=($_l_WindowRight-$_l_WindowLeft)-20-$_l_ButtonWidth
		OBJECT MOVE:C664(*; "oButtonContinue"; $_l_ButtonLeft; $_l_ButtonTop; ($_l_ButtonLeft+$_l_ButtonWidth); ($_l_ButtonTop+$_l_ButtonHeight); *)
		SET WINDOW TITLE:C213(String:C10([ACC_Bank_Statements:198]Bank_TransactionDate:5; Internal date long:K1:5)+" "+[ACC_Bank_Statements:198]Bank_Account_Number:2)
		
		OBJECT GET COORDINATES:C663(*; "oButtonContinue"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		
		If ($_bo_TotalisVisible)
			
			OBJECT GET COORDINATES:C663(*; "oRemainingTotal"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
			$_l_LabelHeight:=$_l_ObjectBottom3-$_l_ObjectTop3
			If ($_l_ObjectBottom3>$_l_ObjectTop2)  // it is sitting under the button
				
				$_l_ObjectTop3:=($_l_ObjectTop2-10)-$_l_LabelHeight
				OBJECT MOVE:C664(*; "oRemainingTotal"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; ($_l_ObjectTop3+$_l_LabelHeight); *)
				
				OBJECT GET COORDINATES:C663(*; "oRemainingLabel"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
				$_l_LabelHeight:=$_l_ObjectBottom4-$_l_ObjectTop4
				OBJECT MOVE:C664(*; "oRemainingLabel"; $_l_ObjectLeft4; $_l_ObjectTop3; $_l_ObjectRight4; ($_l_ObjectTop3+$_l_LabelHeight); *)
				$_l_NextToBottom:=$_l_ObjectTop3-10
				OBJECT GET COORDINATES:C663(*; "oSelectedTotalLabel"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				$_l_LabelHeight:=$_l_ObjectBottom3-$_l_ObjectTop3
				$_l_ObjectTop3:=$_l_NextToBottom-$_l_LabelHeight
				OBJECT MOVE:C664(*; "oSelectedTotalLabel"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; ($_l_ObjectTop3+$_l_LabelHeight); *)
				OBJECT GET COORDINATES:C663(*; "oSelectedunReconcilledTotal"; $_l_ObjectLeft3; $_l_ObjectTop4; $_l_ObjectRight3; $_l_ObjectBottom3)
				$_l_LabelHeight2:=$_l_ObjectBottom3-$_l_ObjectTop4
				OBJECT MOVE:C664(*; "oSelectedunReconcilledTotal"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; ($_l_ObjectTop3+$_l_LabelHeight2); *)
				$_l_ListBottom:=$_l_ObjectTop3-10
				OBJECT GET COORDINATES:C663(ABC_lb_UnResolvedTransactions; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				OBJECT GET COORDINATES:C663(*; "oFindothTransactions1"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				If (($_l_ObjectBottom2-10)<$_l_ListBottom)
					$_l_ListBottom:=$_l_ObjectBottom2-10
				End if 
				If ($_l_ObjectBottom3>$_l_ListBottom)
					$_l_ListHeight:=$_l_ListBottom-$_l_ObjectTop3
					OBJECT MOVE:C664(ABC_lb_UnResolvedTransactions; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; ($_l_ObjectTop3+$_l_ListHeight); *)
				End if 
				OBJECT GET COORDINATES:C663(*; "oFindothTransactions1"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				
				
			End if 
		Else 
			OBJECT GET COORDINATES:C663(*; "oReconcilledTotal"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
			$_l_LabelHeight:=$_l_ObjectBottom3-$_l_ObjectTop3
			If ($_l_ObjectBottom3>$_l_ObjectTop2)  // it is sitting under the button
				
				$_l_ObjectTop3:=($_l_ObjectTop2-10)-$_l_LabelHeight
				OBJECT MOVE:C664(*; "oReconcilledTotal"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; ($_l_ObjectTop3+$_l_LabelHeight); *)
				OBJECT GET COORDINATES:C663(*; "oReconcilledTotalLabel"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
				$_l_LabelHeight:=$_l_ObjectBottom4-$_l_ObjectTop4
				OBJECT MOVE:C664(*; "oReconcilledTotalLabel"; $_l_ObjectLeft4; $_l_ObjectTop3; $_l_ObjectRight4; ($_l_ObjectTop3+$_l_LabelHeight); *)
				OBJECT MOVE:C664(*; "oNulReconcile"; $_l_ObjectLeft3; $_l_ObjectTop3; ($_l_ObjectLeft3+286); ($_l_ObjectTop3+$_l_LabelHeight); *)
			End if 
			
		End if 
		
	: ($_l_Event=On Resize:K2:27)
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WindowHeight:=$_l_WindowBottom-$_l_WindowTop
		OBJECT GET COORDINATES:C663(*; "oButtonContinue"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		$_l_ButtonHeight:=$_l_ObjectBottom2-$_l_ObjectTop2
		$_l_ButtonWidth:=$_l_ObjectRight2-$_l_ObjectLeft2
		$_l_ButtonTop:=($_l_WindowBottom-$_l_WindowTop)-20-$_l_ButtonHeight
		$_l_ButtonLeft:=($_l_WindowRight-$_l_WindowLeft)-20-$_l_ButtonWidth
		OBJECT MOVE:C664(*; "oButtonContinue"; $_l_ButtonLeft; $_l_ButtonTop; ($_l_ButtonLeft+$_l_ButtonWidth); ($_l_ButtonTop+$_l_ButtonHeight); *)
		OBJECT GET COORDINATES:C663(*; "oButtonContinue"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		
		If (Size of array:C274(ABR_abo_UNSelected)>0)
			
			OBJECT GET COORDINATES:C663(*; "oRemainingTotal"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
			$_l_LabelHeight:=$_l_ObjectBottom3-$_l_ObjectTop3
			If ($_l_ObjectBottom3>$_l_ObjectTop2)  // it is sitting under the button
				
				$_l_ObjectTop3:=($_l_ObjectTop2-10)-$_l_LabelHeight
				OBJECT MOVE:C664(*; "oRemainingTotal"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; ($_l_ObjectTop3+$_l_LabelHeight); *)
				
				OBJECT GET COORDINATES:C663(*; "oRemainingLabel"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
				$_l_LabelHeight:=$_l_ObjectBottom4-$_l_ObjectTop4
				OBJECT MOVE:C664(*; "oRemainingLabel"; $_l_ObjectLeft4; $_l_ObjectTop3; $_l_ObjectRight4; ($_l_ObjectTop3+$_l_LabelHeight); *)
				$_l_NextToBottom:=$_l_ObjectTop3-10
				OBJECT GET COORDINATES:C663(*; "oSelectedTotalLabel"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				If ($_l_ObjectLeft3>($_l_ObjectRight3-100))
					$_l_ObjectRight3:=$_l_ObjectRight3-100
				End if 
				
				$_l_LabelHeight:=$_l_ObjectBottom3-$_l_ObjectTop3
				$_l_ObjectTop3:=$_l_NextToBottom-$_l_LabelHeight
				OBJECT MOVE:C664(*; "oSelectedTotalLabel"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; ($_l_ObjectTop3+$_l_LabelHeight); *)
				OBJECT GET COORDINATES:C663(*; "oSelectedunReconcilledTotal"; $_l_ObjectLeft3; $_l_ObjectTop4; $_l_ObjectRight3; $_l_ObjectBottom3)
				$_l_LabelHeight2:=$_l_ObjectBottom3-$_l_ObjectTop4
				OBJECT MOVE:C664(*; "oSelectedunReconcilledTotal"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; ($_l_ObjectTop3+$_l_LabelHeight2); *)
				$_l_ListBottom:=$_l_ObjectTop3-10
				OBJECT GET COORDINATES:C663(ABC_lb_UnResolvedTransactions; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
				OBJECT GET COORDINATES:C663(*; "oSelectedTotalLabel"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				If (($_l_ObjectBottom2-10)<$_l_ListBottom)
					$_l_ListBottom:=$_l_ObjectBottom2-10
				End if 
				If ($_l_ObjectBottom3>$_l_ListBottom)
					$_l_ListHeight:=$_l_ListBottom-$_l_ObjectTop3
					OBJECT MOVE:C664(ABC_lb_UnResolvedTransactions; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; ($_l_ObjectTop3+$_l_ListHeight); *)
				End if 
				OBJECT GET COORDINATES:C663(*; "oSelectedTotalLabel"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				
				
			End if 
		Else 
			OBJECT GET COORDINATES:C663(*; "oReconcilledTotal"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
			$_l_LabelHeight:=$_l_ObjectBottom3-$_l_ObjectTop3
			If ($_l_ObjectBottom3>$_l_ObjectTop2)  // it is sitting under the button
				
				$_l_ObjectTop3:=($_l_ObjectTop2-10)-$_l_LabelHeight
				OBJECT MOVE:C664(*; "oReconcilledTotal"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; ($_l_ObjectTop3+$_l_LabelHeight); *)
				OBJECT GET COORDINATES:C663(*; "oReconcilledTotalLabel"; $_l_ObjectLeft4; $_l_ObjectTop4; $_l_ObjectRight4; $_l_ObjectBottom4)
				$_l_LabelHeight:=$_l_ObjectBottom4-$_l_ObjectTop4
				OBJECT MOVE:C664(*; "oReconcilledTotalLabel"; $_l_ObjectLeft4; $_l_ObjectTop3; $_l_ObjectRight4; ($_l_ObjectTop3+$_l_LabelHeight); *)
				OBJECT MOVE:C664(*; "oNulReconcile"; $_l_ObjectLeft3; $_l_ObjectTop3; ($_l_ObjectLeft3+286); ($_l_ObjectTop3+$_l_LabelHeight); *)
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("FM ACC_ReconcileSelectTransactions"; $_t_oldMethodName)
