//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_TransactionsReconcile
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  31/10/2010 11:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_TransactionIncluded; 0)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	//ARRAY TEXT(DB_at_TabNavigation;0)
	C_BOOLEAN:C305($_bo_UseBankStatement; DB_bo_DisplayFilters; DB_bo_ShowArrayBased)
	C_LONGINT:C283($_l_AreaWidth; $_l_CancelSIze; $_l_DropDownSIze; $_l_Index; $_l_oB11Bottom; $_l_oB11Left; $_l_oB11Right; $_l_oB11Top; $_l_oB13Bottom; $_l_oB13Left; $_l_oB13Right)
	C_LONGINT:C283($_l_oB13Top; $_l_oB14Bottom; $_l_oB14Left; $_l_oB14Right; $_l_oB14Top; $_l_oB15Bottom; $_l_oB15Left; $_l_oB15Right; $_l_oB15Top; $_l_oB18Bottom; $_l_oB18Left)
	C_LONGINT:C283($_l_oB18Right; $_l_oB18Top; $_l_oB1Bottom; $_l_oB1Left; $_l_oB1Right; $_l_oB1Top; $_l_oB2Bottom; $_l_oB2Left; $_l_oB2Right; $_l_oB2Top; $_l_oB3Bottom)
	C_LONGINT:C283($_l_oB3Left; $_l_oB3Right; $_l_oB3Top; $_l_oB45Bottom; $_l_oB45Left; $_l_oB45Right; $_l_oB45top; $_l_oB4Bottom; $_l_oB4Left; $_l_oB4Right; $_l_oB4Top)
	C_LONGINT:C283($_l_oBF1Bottom; $_l_oBF1Left; $_l_oBF1Right; $_l_oBF1Top; $_l_oBF2Bottom; $_l_oBF2Left; $_l_oBF2Right; $_l_oBF2Top; $_l_oBF3Bottom; $_l_oBF3Left; $_l_oBF3Right)
	C_LONGINT:C283($_l_oBF3Top; $_l_oBottom; $_l_oBottom2; $_l_oCBBottom; $_l_oCBLeft; $_l_oCBRIght; $_l_oCBTop; $_l_oGrid1Bottom; $_l_oGrid1Left; $_l_oGrid1Right; $_l_oGrid1Top)
	C_LONGINT:C283($_l_oGrid2Bottom; $_l_oGrid2Left; $_l_oGrid2Right; $_l_oGrid2Top; $_l_OK; $_l_oLeft; $_l_oLeft2; $_l_oNavBottom; $_l_oNavLeft; $_l_oNavRight; $_l_oNavTop)
	C_LONGINT:C283($_l_oRight; $_l_oRight2; $_l_oTop; $_l_oTop2; $_l_PreferenceID; $_l_Records in selection; $_l_SearchSIze; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_LONGINT:C283($_l_WIndowWIdth; DB_but_CBFunction1; DB_but_Function1; DB_but_Function2; DB_l_CurrentDisplayedForm; DB_l_LBOutputForm; DB_l_MaxRecords; DB_l_Navigatetoselected; PAL_BUTTON_1; PAL_BUTTON_11; PAL_BUTTON_13)
	C_LONGINT:C283(PAL_BUTTON_14; PAL_BUTTON_15; PAL_BUTTON_18; PAL_BUTTON_2; PAL_BUTTON_3; PAL_BUTTON_4; PAL_BUTTON_45)
	C_OBJECT:C1216($_obj_)
	C_REAL:C285($_r_SumAmount; vBalance; vSubtotal; vTotal)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; SD2_T_SearchValue; TR_t_Reconciliation)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_TransactionsReconcile")
CREATE SET:C116([TRANSACTIONS:29]; "$Temp")
COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "CurrentSelection")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
CREATE SET:C116([TRANSACTIONS:29]; "$trHighlighted")
$_l_PreferenceID:=PREF_GetPreferenceID("Bank Statements")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
If (Records in selection:C76([PREFERENCES:116])=0)
	$_bo_UseBankStatement:=False:C215
	Gen_Confirm("Reconcile Transactions using Bank Statement?"; "No"; "Yes")
	If (OK=0)
		$_bo_UseBankStatement:=True:C214
	End if 
Else 
	$_bo_UseBankStatement:=True:C214
End if 
If ($_bo_UseBankStatement) & (Not:C34(Gen_Option))
	$_obj_
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_oB2Left; $_l_oB2Top; $_l_oB2Right; $_l_oB2Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_1; $_l_oB1Left; $_l_oB1Top; $_l_oB1Right; $_l_oB1Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_4; $_l_oB4Left; $_l_oB4Top; $_l_oB4Right; $_l_oB4Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_3; $_l_oB3Left; $_l_oB3Top; $_l_oB3Right; $_l_oB3Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_13; $_l_oB13Left; $_l_oB13Top; $_l_oB13Right; $_l_oB13Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_11; $_l_oB11Left; $_l_oB11Top; $_l_oB11Right; $_l_oB11Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_15; $_l_oB15Left; $_l_oB15Top; $_l_oB15Right; $_l_oB15Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_14; $_l_oB14Left; $_l_oB14Top; $_l_oB14Right; $_l_oB14Bottom)
	OBJECT GET COORDINATES:C663(PAL_BUTTON_18; $_l_oB18Left; $_l_oB18Top; $_l_oB18Right; $_l_oB18Bottom)
	OBJECT GET COORDINATES:C663(DB_but_Function1; $_l_oBF1Left; $_l_oBF1Top; $_l_oBF1Right; $_l_oBF1Bottom)
	OBJECT GET COORDINATES:C663(DB_but_Function2; $_l_oBF2Left; $_l_oBF2Top; $_l_oBF2Right; $_l_oBF2Bottom)
	OBJECT GET COORDINATES:C663(DB_but_CBFunction1; $_l_oBF3Left; $_l_oBF3Top; $_l_oBF3Right; $_l_oBF3Bottom)
	
	OBJECT GET COORDINATES:C663(PAL_BUTTON_45; $_l_oB45Left; $_l_oB45top; $_l_oB45Right; $_l_oB45Bottom)
	OBJECT GET COORDINATES:C663(*; "oNavigator"; $_l_oNavLeft; $_l_oNavTop; $_l_oNavRight; $_l_oNavBottom)
	OBJECT GET COORDINATES:C663(DB_l_LBOutputForm; $_l_oGrid1Left; $_l_oGrid1Top; $_l_oGrid1Right; $_l_oGrid1Bottom)
	OBJECT GET COORDINATES:C663(DB_lb_OutputArrays; $_l_oGrid2Left; $_l_oGrid2Top; $_l_oGrid2Right; $_l_oGrid2Bottom)
	READ WRITE:C146([TRANSACTIONS:29])
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	DIALOG:C40("ACC_ImportStatement")
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	If (DB_bo_ShowArrayBased)
		DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
	Else 
		DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
	End if 
	//SET WINDOW RECT($_l_WindowLeft;$_l_windowTop;$_l_WindowRight;$_l_WindowBottom)
	OBJECT MOVE:C664(PAL_BUTTON_2; $_l_oB2Left; $_l_oB2Top; $_l_oB2Right; $_l_oB2Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_1; $_l_oB1Left; $_l_oB1Top; $_l_oB1Right; $_l_oB1Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_4; $_l_oB4Left; $_l_oB4Top; $_l_oB4Right; $_l_oB4Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_3; $_l_oB3Left; $_l_oB3Top; $_l_oB3Right; $_l_oB3Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_13; $_l_oB13Left; $_l_oB13Top; $_l_oB13Right; $_l_oB13Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_11; $_l_oB11Left; $_l_oB11Top; $_l_oB11Right; $_l_oB11Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_15; $_l_oB15Left; $_l_oB15Top; $_l_oB15Right; $_l_oB15Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_14; $_l_oB14Left; $_l_oB14Top; $_l_oB14Right; $_l_oB14Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_18; $_l_oB18Left; $_l_oB18Top; $_l_oB18Right; $_l_oB18Bottom; *)
	OBJECT MOVE:C664(DB_but_Function1; $_l_oBF1Left; $_l_oBF1Top; $_l_oBF1Right; $_l_oBF1Bottom; *)
	OBJECT MOVE:C664(DB_but_Function2; $_l_oBF2Left; $_l_oBF2Top; $_l_oBF2Right; $_l_oBF2Bottom; *)
	OBJECT MOVE:C664(DB_but_CBFunction1; $_l_oBF3Left; $_l_oBF3Top; $_l_oBF3Right; $_l_oBF3Bottom; *)
	OBJECT MOVE:C664(PAL_BUTTON_45; $_l_oB45Left; $_l_oB45top; $_l_oB45Right; $_l_oB45Bottom; *)
	
	OBJECT SET COORDINATES:C1248(*; "oNavigator"; $_l_oNavLeft; $_l_oNavTop; $_l_oNavRight; $_l_oNavBottom)
	OBJECT MOVE:C664(DB_l_LBOutputForm; $_l_oGrid1Left; $_l_oGrid1Top; $_l_oGrid1Right; $_l_oGrid1Bottom; *)
	OBJECT MOVE:C664(DB_lb_OutputArrays; $_l_oGrid2Left; $_l_oGrid2Top; $_l_oGrid2Right; $_l_oGrid2Bottom; *)
	//``
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	$_l_WIndowWIdth:=$_l_WindowRight-$_l_WindowLeft
	OBJECT GET COORDINATES:C663(DB_l_Navigatetoselected; $_l_oCBLeft; $_l_oCBTop; $_l_oCBRIght; $_l_oCBBottom)
	OBJECT GET COORDINATES:C663(*; "oRoundArea1"; $_l_oLeft; $_l_oTop; $_l_oRight; $_l_oBottom)
	$_l_AreaWidth:=$_l_oRight-$_l_oLeft
	OBJECT MOVE:C664(*; "oRoundArea1"; ($_l_WIndowWIdth-10)-$_l_AreaWidth; $_l_oTop; $_l_WIndowWIdth-10; $_l_oBottom; *)
	OBJECT MOVE:C664(*; "oFocusRing"; ($_l_WIndowWIdth-10)-$_l_AreaWidth; $_l_oTop; $_l_WIndowWIdth-10; $_l_oBottom; *)
	//drop down 12 in and 23 wid
	$_l_DropDownSIze:=(($_l_WIndowWIdth-10)-$_l_AreaWidth)+12
	$_l_SearchSIze:=(($_l_WIndowWIdth-10)-$_l_AreaWidth)+38
	$_l_CancelSIze:=(($_l_WIndowWIdth-10)-$_l_AreaWidth)+(462-269)
	OBJECT MOVE:C664(*; "oSearchCriteriaButton"; $_l_DropDownSIze; $_l_oTop+8; $_l_DropDownSIze+23; $_l_oBottom-5; *)
	OBJECT MOVE:C664(*; "oSearchvalue"; $_l_SearchSIze; $_l_oTop+9; $_l_SearchSIze+150; $_l_oBottom-9; *)
	OBJECT MOVE:C664(*; "oSearchCriteria"; $_l_SearchSIze; $_l_oTop+9; $_l_SearchSIze+150; $_l_oBottom-9; *)
	OBJECT MOVE:C664(*; "oSearchClearButton"; $_l_CancelSIze; $_l_oTop+9; $_l_CancelSIze+15; $_l_oBottom-9; *)
	
	OBJECT GET COORDINATES:C663(*; "oRoundArea1"; $_l_oLeft; $_l_oTop; $_l_oRight; $_l_oBottom)
	OBJECT GET COORDINATES:C663(*; "oSRCH_t_Prompt"; $_l_oLeft2; $_l_oTop2; $_l_oRight2; $_l_oBottom2)
	OBJECT MOVE:C664(*; "oSRCH_t_Prompt"; $_l_oCBRIght+5; $_l_oTop2; ($_l_oLeft-10); $_l_oBottom2; *)
	
	USE NAMED SELECTION:C332("CurrentSelection")
	QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
	
	
Else 
	READ WRITE:C146([TRANSACTIONS:29])
	
	QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
	If (Records in selection:C76([TRANSACTIONS:29])>0)
		$_r_SumAmount:=Round:C94((Sum:C1([TRANSACTIONS:29]Amount:6)); 2)
		Gen_Confirm("Total to reconcile: "+String:C10($_r_SumAmount; "|Accounts")+".  Go ahead?"; "Yes"; "No")
		If (OK=1)
			If (False:C215)  //modified NG Dec 2001!
				$_l_Records in selection:=Records in selection:C76([TRANSACTIONS:29])
				ARRAY BOOLEAN:C223($_abo_TransactionIncluded; $_l_Records in selection)
				For ($_l_Index; 1; $_l_Records in selection)
					$_abo_TransactionIncluded{$_l_Index}:=True:C214
				End for 
				ARRAY TO SELECTION:C261($_abo_TransactionIncluded; [TRANSACTIONS:29]Reconciled:14)
				vSubtotal:=Round:C94((vSubtotal+$_r_SumAmount); 2)
				vTotal:=Round:C94((vBalance+vSubtotal); 2)
			Else 
				TR_t_Reconciliation:=Gen_Request("Would you like to put a reference on these"; "")
				CREATE SET:C116([TRANSACTIONS:29]; "TEMP")
				$_l_OK:=ok
				Repeat 
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
					DB_lockFile(->[TRANSACTIONS:29])
					If (TR_t_Reconciliation#"")
						
						APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14:=True:C214)
						USE SET:C118("TEMP")
						APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciliation_Reference:33:=TR_t_Reconciliation)
						
					Else 
						APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14:=True:C214)
						
					End if 
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
					vSubtotal:=Round:C94((vSubtotal+$_r_SumAmount); 2)
					vTotal:=Round:C94((vBalance+vSubtotal); 2)
					If (Records in set:C195("LockedSet")>0)
						
						Gen_Confirm("Some Records were locked, and could not be updated"; "Retry"; "Stop")
						$_l_OK:=OK
						If ($_l_OK=1)
							USE SET:C118("LockedSet")
							$_r_SumAmount:=Round:C94((Sum:C1([TRANSACTIONS:29]Amount:6)); 2)
						Else 
							USE SET:C118("LockedSet")
							$_r_SumAmount:=Round:C94((Sum:C1([TRANSACTIONS:29]Amount:6)); 2)
							vSubtotal:=Round:C94((vSubtotal-$_r_SumAmount); 2)
							vTotal:=Round:C94((vBalance+vSubtotal); 2)
						End if 
					End if 
					
					
				Until ($_l_OK=0) | (Records in set:C195("LockedSet")=0)
				TR_t_Reconciliation:=""
				
				
				
			End if 
			
		End if 
	Else 
		Gen_Alert("Please select Unreconciled Transactions"; "Try again")
	End if 
End if 
USE NAMED SELECTION:C332("CurrentSelection")

If (DB_GetSalesLedgerBankFrom#"")
	If (DB_GetSalesLedgerBankTo#"")
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3>=DB_GetSalesLedgerBankFrom; *)
	Else 
		QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankFrom; *)
	End if 
	If (DB_GetSalesLedgerBankTo#"")
		QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3<=DB_GetSalesLedgerBankTo)
	Else 
		QUERY SELECTION:C341([TRANSACTIONS:29])
		
	End if 
Else 
	QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankTo)
End if 
QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
DB_l_MaxRecords:=Records in selection:C76([TRANSACTIONS:29])
SD2_T_SearchValue:=""
SEL_UpdateRecordCache(Table:C252(->[TRANSACTIONS:29]))

DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
HIGHLIGHT RECORDS:C656([TRANSACTIONS:29]; "ListboxSet0")
ERR_MethodTrackerReturn("ACC_TransactionsReconcile"; $_t_oldMethodName)
