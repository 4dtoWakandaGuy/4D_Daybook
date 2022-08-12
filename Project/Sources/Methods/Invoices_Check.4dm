//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_Check
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   16/10/2010 03:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	//ARRAY LONGINT(DB_al_TabNavigation;0)
	//ARRAY TEXT(DB_at_TabContext;0)
	//ARRAY TEXT(DB_at_TabNavigation;0)
	C_BOOLEAN:C305($0; DB_bo_DisplayFilters; DB_bo_ShowArrayBased)
	C_LONGINT:C283($_l_AreaWidth; $_l_CancelLeft; $_l_CBBottom; $_l_CBLeft; $_l_CBRight; $_l_CBTop; $_l_CurrentDisplayedForm; $_l_displayedTableOLD; $_l_DropDownLeft; $_l_ObjectBottom; $_l_ObjectBottom2)
	C_LONGINT:C283($_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectTop; $_l_ObjectTop2; $_l_OK; $_l_RecordsinSelection; $_l_Search; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_windowTop; $_l_WindowWidth; DB_l_CurrentDisplayedForm; DB_l_LBOutputForm; DB_l_Navigatetoselected; vAdd; vNo)
	C_TEXT:C284($_t_oldMethodName; $_t_Text; DB_t_CurrentContext; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_Check")
//DEFAULT TABLE([INVOICES])
USE SET:C118("IMaster")
$0:=False:C215
$_l_RecordsinSelection:=Records in selection:C76([INVOICES:39])
$_l_CurrentDisplayedForm:=DB_l_CurrentDisplayedForm
If ($_l_RecordsinSelection>0)
	$_t_Text:="Check "+String:C10($_l_RecordsinSelection)+" Invoice"+("s"*(Num:C11($_l_RecordsinSelection#1)))+" / Credit Note"+("s"*(Num:C11($_l_RecordsinSelection#1)))
	Gen_Confirm($_t_Text+" before printing & posting?"; "Check"; "Print")
	DB_t_CurrentFormUsage2:="NC"
	$_l_OK:=0
	If (OK=1)  //check
		If (False:C215)
			DB_t_CurrentFormUsage:="Print"
			vNo:=Records in selection:C76([INVOICES:39])
			vAdd:=0
			
			Invoices_FileI
			Invoices_FileO
			Open_Pro_Window($_t_Text; 0; 1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
			FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252(->[INVOICES:39]))
			WIn_SetFormSize(1; ->[INVOICES:39]; WIN_t_CurrentOutputform)
			MODIFY SELECTION:C204([INVOICES:39]; *)
			Close_ProWin
		Else 
			//we switch to a view of invoices-batch print-so the button changes.when you print it will return to the orders
			DB_t_CurrentContext:="Batch Print Created Invoices"
			$_l_displayedTableOLD:=DB_l_CurrentDisplayedForm
			DB_l_CurrentDisplayedForm:=Table:C252(->[INVOICES:39])
			
			DB_SetFormTabs(DB_l_CurrentDisplayedForm; DB_t_CurrentContext; ->DB_at_TabNavigation; ->DB_al_TabNavigation; ->DB_at_TabContext)
			DB_SetFormLayout(DB_l_CurrentDisplayedForm; DB_t_CurrentContext; $_l_displayedTableOLD)
			DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			//at this point we size the form based on the current selection. on tabbing we change the size to the width of the new form
			//`but we only grow the height of the form on a selection change do not shrink it
			If (DB_bo_ShowArrayBased)
				DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
			Else 
				DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
			End if 
			
			
			DB_SetFormCache(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			DB_HideShowSearch(DB_l_CurrentDisplayedForm)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
			OBJECT GET COORDINATES:C663(DB_l_Navigatetoselected; $_l_CBLeft; $_l_CBTop; $_l_CBRight; $_l_CBBottom)
			OBJECT GET COORDINATES:C663(*; "oRoundArea1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			$_l_AreaWidth:=$_l_ObjectRight-$_l_ObjectLeft
			OBJECT MOVE:C664(*; "oRoundArea1"; ($_l_WindowWidth-10)-$_l_AreaWidth; $_l_ObjectTop; $_l_WindowWidth-10; $_l_ObjectBottom; *)
			OBJECT MOVE:C664(*; "oFocusRing"; ($_l_WindowWidth-10)-$_l_AreaWidth; $_l_ObjectTop; $_l_WindowWidth-10; $_l_ObjectBottom; *)
			//drop down 12 in and 23 wid
			$_l_DropDownLeft:=(($_l_WindowWidth-10)-$_l_AreaWidth)+12
			$_l_Search:=(($_l_WindowWidth-10)-$_l_AreaWidth)+38
			$_l_CancelLeft:=(($_l_WindowWidth-10)-$_l_AreaWidth)+(462-269)
			OBJECT MOVE:C664(*; "oSearchCriteriaButton"; $_l_DropDownLeft; $_l_ObjectTop+8; $_l_DropDownLeft+23; $_l_ObjectBottom-5; *)
			OBJECT MOVE:C664(*; "oSearchvalue"; $_l_Search; $_l_ObjectTop+9; $_l_Search+150; $_l_ObjectBottom-9; *)
			OBJECT MOVE:C664(*; "oSearchCriteria"; $_l_Search; $_l_ObjectTop+9; $_l_Search+150; $_l_ObjectBottom-9; *)
			OBJECT MOVE:C664(*; "oSearchClearButton"; $_l_CancelLeft; $_l_ObjectTop+9; $_l_CancelLeft+15; $_l_ObjectBottom-9; *)
			
			OBJECT GET COORDINATES:C663(*; "oRoundArea1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oSRCH_t_Prompt"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT MOVE:C664(*; "oSRCH_t_Prompt"; $_l_CBRight+5; $_l_ObjectTop2; ($_l_ObjectLeft-10); $_l_ObjectBottom2; *)
			$_l_OK:=1
			
		End if 
	Else 
		OK:=1
		$_l_OK:=1
		Invoices_IPrint
		$0:=True:C214
	End if 
	If (Not:C34($_l_OK=1))
		Gen_Alert("The Invoices have been Cancelled"; "OK")
		OK:=0
	End if 
	DB_t_CurrentFormUsage2:=""
Else 
	$0:=True:C214
	Gen_Alert("No Invoices created"; "Cancel")
	OK:=0
End if 
DB_l_CurrentDisplayedForm:=$_l_CurrentDisplayedForm
ERR_MethodTrackerReturn("Invoices_Check"; $_t_oldMethodName)