//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_BatchPrint2010
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    16/10/2010 19:24
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
	C_BOOLEAN:C305(DB_bo_DisplayFilters; DB_bo_ShowArrayBased)
	C_LONGINT:C283($_l_AreaWidth; $_l_CancelButtonLeft; $_l_CBBottom; $_l_CBLeft; $_l_CBRight; $_l_CBTop; $_l_CurrentDisplayedForm; $_l_DIsplayedFormOLD; $_l_DropDownLeft; $_l_ObjectBottom; $_l_ObjectBottom2)
	C_LONGINT:C283($_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectTop; $_l_ObjectTop2; $_l_OK; $_l_Search; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_windowTop; $_l_WindowWidth; DB_l_CurrentDisplayedForm; DB_l_LBOutputForm; DB_l_Navigatetoselected)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_BatchPrint2010")
CREATE SET:C116([INVOICES:39]; "$Temp")
If (DB_t_CurrentContext="Batch Print Created Invoices")
	CREATE SET:C116([ORDERS:24]; "$Temp2")
End if 
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
$_l_CurrentDisplayedForm:=DB_l_CurrentDisplayedForm
If (Records in selection:C76([INVOICES:39])>0)
	READ WRITE:C146([INVOICES:39])
	UNLOAD RECORD:C212([INVOICES:39])
	LOAD RECORD:C52([INVOICES:39])
	
	FORM SET OUTPUT:C54([INVOICES:39]; "Form")  //NG may 2004 added table
	Invoices_IPrint
	Case of 
		: (DB_t_CurrentContext="Batch Print Created Invoices")
			//we came to this from a list of orders..so validate the transaction an return to orders and the batch invoicing context
			OK:=1
			Transact_End
			USE SET:C118("$Temp2")
			Orders_InvBSP  //make sure this happens if we print the invoices
			
			DB_t_CurrentContext:="Batch Invoice Orders"
			$_l_DIsplayedFormOLD:=DB_l_CurrentDisplayedForm
			DB_l_CurrentDisplayedForm:=Table:C252(->[ORDERS:24])
			
			DB_SetFormTabs(DB_l_CurrentDisplayedForm; DB_t_CurrentContext; ->DB_at_TabNavigation; ->DB_al_TabNavigation; ->DB_at_TabContext)
			DB_SetFormLayout(DB_l_CurrentDisplayedForm; DB_t_CurrentContext; $_l_DIsplayedFormOLD)
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
			$_l_CancelButtonLeft:=(($_l_WindowWidth-10)-$_l_AreaWidth)+(462-269)
			OBJECT MOVE:C664(*; "oSearchCriteriaButton"; $_l_DropDownLeft; $_l_ObjectTop+8; $_l_DropDownLeft+23; $_l_ObjectBottom-5; *)
			OBJECT MOVE:C664(*; "oSearchvalue"; $_l_Search; $_l_ObjectTop+9; $_l_Search+150; $_l_ObjectBottom-9; *)
			OBJECT MOVE:C664(*; "oSearchCriteria"; $_l_Search; $_l_ObjectTop+9; $_l_Search+150; $_l_ObjectBottom-9; *)
			OBJECT MOVE:C664(*; "oSearchClearButton"; $_l_CancelButtonLeft; $_l_ObjectTop+9; $_l_CancelButtonLeft+15; $_l_ObjectBottom-9; *)
			
			OBJECT GET COORDINATES:C663(*; "oRoundArea1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oSRCH_t_Prompt"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT MOVE:C664(*; "oSRCH_t_Prompt"; $_l_CBRight+5; $_l_ObjectTop2; ($_l_ObjectLeft-10); $_l_ObjectBottom2; *)
			$_l_OK:=1
		: (DB_t_CurrentContext="Batch Print Invoices")
			
	End case 
End if 
DB_l_CurrentDisplayedForm:=$_l_CurrentDisplayedForm
ERR_MethodTrackerReturn("INV_BatchPrint2010"; $_t_oldMethodName)