//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_UpdateScreenInfo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(ACC_lb_BankReconcile;0)
	//ARRAY BOOLEAN(LAY_lb_AnalysisCodes;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY REAL:C219($_ar_ReconciledValue; 0)
	ARRAY REAL:C219($_ar_TotalAccValue; 0)
	ARRAY REAL:C219($_ar_unreconciled; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(ACC_at_ReconAccValue;0)
	//ARRAY TEXT(ACC_at_TotalAccValue;0)
	//ARRAY TEXT(ACC_at_UnreconAccValue;0)
	//ARRAY TEXT(ACC_at_ViewedACCCodes;0)
	//ARRAY TEXT(ACC_at_ViewedCurCodes;0)
	C_BOOLEAN:C305(ACC_bo_ReconcileINited; DB_bo_ScreenInfoInited)
	C_LONGINT:C283($_l_AccWidth; $_l_Build; $_l_Center; $_l_CountLines; $_l_DisplayedTable; $_l_FilterBottom; $_l_FilterLeft; $_l_FilterRight; $_l_FilterTop; $_l_HeightRequired; $_l_ListingBottom)
	C_LONGINT:C283($_l_ListingLeft; $_l_ListingRight; $_l_ListingTop; $_l_Pos; $_l_PromptBottom; $_l_PromptLeft; $_l_PromptRight; $_l_PromptTop; $_l_PromptWidth; $_l_RecordSet1; $_l_RecordsinSet1)
	C_LONGINT:C283($_l_RecordsinSet3; $_l_RecordsinSet4; $_l_SearchBottom; $_l_SearchLeft; $_l_SearchRight; $_l_SearchTop; $_l_ToolBarBottom; $_l_ToolBarLeft; $_l_ToolBarRight; $_l_ToolBarTop; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $1; at_ViewedACCCodes)
	C_TEXT:C284($_t_DisplayedContect; $_t_oldMethodName; $2; DB_t_ReconcileMessage)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_UpdateScreenInfo")

//For some tables in some contexts we want to create some on screen information
//this method will create on screen areas to display that informaton and fill them with whatever. this used object duplication
If (Count parameters:C259>=2)
	$_l_DisplayedTable:=$1
	$_t_DisplayedContect:=$2
	//C_BOOLEAN(DB_bo_ScreenInfoInited)
	
	Case of 
		: ($_l_DisplayedTable=Table:C252(->[TRANSACTIONS:29]))
			Case of 
				: ($_t_DisplayedContect="Reconcile Transactions")
					If (Not:C34(DB_bo_ScreenInfoInited))
						
					End if 
					OBJECT SET VISIBLE:C603(*; "oLBReconcileMessage"; True:C214)
					
					If (Not:C34(ACC_bo_ReconcileINited))
						ARRAY TEXT:C222(ACC_at_ViewedACCCodes; 0)
						ARRAY TEXT:C222(ACC_at_ViewedCurCodes; 0)
						ARRAY REAL:C219($_ar_TotalAccValue; 0)
						ARRAY REAL:C219($_ar_ReconciledValue; 0)
						ARRAY REAL:C219($_ar_unreconciled; 0)
						ARRAY TEXT:C222(ACC_at_ViewedACCCodes; 0)
						ARRAY TEXT:C222(ACC_at_ViewedCurCodes; 0)
						ARRAY REAL:C219($_ar_TotalAccValue; 0)
						ARRAY REAL:C219($_ar_ReconciledValue; 0)
						ARRAY REAL:C219($_ar_unreconciled; 0)
						ARRAY TEXT:C222(ACC_at_TotalAccValue; 0)
						ARRAY TEXT:C222(ACC_at_ReconAccValue; 0)
						ARRAY TEXT:C222(ACC_at_UnreconAccValue; 0)
						
						CREATE EMPTY SET:C140([TRANSACTIONS:29]; "CurrentReconcileCollection")
						ACC_bo_ReconcileINited:=True:C214
						LB_SetupListbox(->ACC_lb_BankReconcile; "ACCREC_"; "USER_L"; 1; ->ACC_at_ViewedACCCodes; ->ACC_at_TotalAccValue)
						//->ACC_at_ReconAccValue;->ACC_at_UnreconAccValue)
						LB_SetColumnHeaders(->ACC_lb_BankReconcile; "USER_L"; 1; "Accounts"; "Unreconciled Balance")
						//;"Reconciled";"Unreconciled")
						LB_SetEnterable(->ACC_lb_BankReconcile; False:C215; 0)
						LB_SetColumnWidths(->ACC_lb_BankReconcile; "ACCREC_"; 1; 60; 200)
						LB_SetScroll(->ACC_lb_BankReconcile; -3; -2)
						LB_StyleSettings(->LAY_lb_AnalysisCodes; "Black"; 8; "ACCREC_S55"; ->[TRANSACTIONS:29])
						
						
					End if 
					CREATE SET:C116([TRANSACTIONS:29]; "CurrentReconcileCollection2")
					DIFFERENCE:C122("CurrentReconcileCollection"; "CurrentReconcileCollection2"; "CurrentDIfference1")
					DIFFERENCE:C122("CurrentReconcileCollection2"; "CurrentReconcileCollection"; "CurrentDIfference2")
					$_l_RecordSet1:=Records in set:C195("CurrentReconcileCollection2")
					$_l_RecordsinSet1:=Records in set:C195("CurrentReconcileCollection")
					$_l_RecordsinSet3:=Records in set:C195("CurrentDIfference2")
					$_l_RecordsinSet4:=Records in set:C195("CurrentDIfference1")
					If ($_l_RecordSet1#$_l_RecordsinSet1)
						//| ($_l_RecordsinSet3) | ($_l_RecordsinSet4>0)
						
						ARRAY TEXT:C222(ACC_at_ViewedACCCodes; 0)
						ARRAY TEXT:C222(ACC_at_ViewedCurCodes; 0)
						ARRAY REAL:C219($_ar_TotalAccValue; 0)
						ARRAY REAL:C219($_ar_ReconciledValue; 0)
						ARRAY REAL:C219($_ar_unreconciled; 0)
						ARRAY TEXT:C222(ACC_at_TotalAccValue; 0)
						ARRAY TEXT:C222(ACC_at_ReconAccValue; 0)
						ARRAY TEXT:C222(ACC_at_UnreconAccValue; 0)
						//TRACE
						ACC_GetReconciledBalances(->ACC_at_ViewedACCCodes; ->ACC_at_ViewedCurCodes; ->$_ar_TotalAccValue; ->$_ar_ReconciledValue; ->$_ar_unreconciled)
						ARRAY TEXT:C222(ACC_at_TotalAccValue; Size of array:C274($_ar_unreconciled))
						ARRAY TEXT:C222(ACC_at_ReconAccValue; Size of array:C274($_ar_unreconciled))
						ARRAY TEXT:C222(ACC_at_UnreconAccValue; Size of array:C274($_ar_unreconciled))
						
						CREATE SET:C116([TRANSACTIONS:29]; "CurrentReconcileCollection")
						For ($_l_Build; Size of array:C274(ACC_at_ViewedCurCodes); 1; -1)
							If ($_ar_TotalAccValue{$_l_Build}#0)
								
								
								$_l_Pos:=Position:C15(","; ACC_at_ViewedACCCodes{$_l_Build})
								
								If ($_l_Pos>0)
									ACC_at_ViewedACCCodes{$_l_Build}:="Multiple Accounts"
								End if 
								ACC_at_TotalAccValue{$_l_Build}:=ACC_at_ViewedCurCodes{$_l_Build}+String:C10(Round:C94($_ar_TotalAccValue{$_l_Build}; 2))
								ACC_at_ReconAccValue{$_l_Build}:=ACC_at_ViewedCurCodes{$_l_Build}+String:C10(Round:C94($_ar_ReconciledValue{$_l_Build}; 2))
								ACC_at_UnreconAccValue{$_l_Build}:=ACC_at_ViewedCurCodes{$_l_Build}+String:C10(Round:C94($_ar_unreconciled{$_l_Build}; 2))
							Else 
								DELETE FROM ARRAY:C228(ACC_at_ViewedACCCodes; $_l_Build)
								DELETE FROM ARRAY:C228(ACC_at_ViewedCurCodes; $_l_Build)
								DELETE FROM ARRAY:C228($_ar_TotalAccValue; $_l_Build)
								DELETE FROM ARRAY:C228($_ar_ReconciledValue; $_l_Build)
								DELETE FROM ARRAY:C228($_ar_unreconciled; $_l_Build)
								DELETE FROM ARRAY:C228(ACC_at_TotalAccValue; $_l_Build)
								DELETE FROM ARRAY:C228(ACC_at_ReconAccValue; $_l_Build)
								DELETE FROM ARRAY:C228(ACC_at_UnreconAccValue; $_l_Build)
							End if 
						End for 
					End if 
					OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_ListingLeft; $_l_ListingTop; $_l_ListingRight; $_l_ListingBottom)
					OBJECT GET COORDINATES:C663(*; "oNavigateOption"; $_l_FilterLeft; $_l_FilterTop; $_l_FilterRight; $_l_FilterBottom)
					OBJECT GET COORDINATES:C663(*; "oRoundArea1"; $_l_SearchLeft; $_l_SearchTop; $_l_SearchRight; $_l_SearchBottom)
					If ($_l_SearchLeft<0)
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
						$_l_SearchLeft:=($_l_WindowRight-$_l_WindowLeft)-200
					End if 
					OBJECT GET COORDINATES:C663(*; "oStrapHeader1"; $_l_ToolBarLeft; $_l_ToolBarTop; $_l_ToolBarRight; $_l_ToolBarBottom)
					OBJECT GET COORDINATES:C663(*; "oLBReconcileMessage"; $_l_PromptLeft; $_l_PromptTop; $_l_PromptRight; $_l_PromptBottom)
					
					$_l_PromptLeft:=$_l_FilterRight+10
					$_l_PromptRight:=$_l_SearchLeft-10
					If (($_l_PromptRight-$_l_PromptLeft)>800)
						$_l_PromptRight:=$_l_PromptLeft+800
					End if 
					$_l_CountLines:=0
					
					$_l_HeightRequired:=20*((Size of array:C274(ACC_at_ViewedCurCodes))+1)
					If ($_l_HeightRequired>(($_l_ListingTop-$_l_ToolBarTop)-2))  //the max height
						$_l_HeightRequired:=($_l_ListingTop-$_l_ToolBarTop)-2
					End if 
					If ($_l_HeightRequired>56)
						$_l_HeightRequired:=56
					End if 
					$_l_Center:=$_l_ToolBarTop+((($_l_ListingTop-$_l_ToolBarTop)-2)/2)
					
					$_l_PromptTop:=$_l_Center-($_l_HeightRequired/2)
					$_l_PromptBottom:=$_l_PromptTop+$_l_HeightRequired
					$_l_PromptWidth:=$_l_PromptRight-$_l_PromptLeft
					$_l_AccWidth:=$_l_PromptWidth-200
					
					OBJECT SET COORDINATES:C1248(*; "oLBReconcileMessage"; $_l_PromptLeft; $_l_PromptTop; $_l_PromptRight; $_l_PromptBottom)
					LB_SetColumnWidths(->ACC_lb_BankReconcile; "ACCREC_"; 1; $_l_AccWidth; 200)
					
					
					
			End case 
	End case 
End if 
ERR_MethodTrackerReturn("DB_UpdateScreenInfo"; $_t_oldMethodName)