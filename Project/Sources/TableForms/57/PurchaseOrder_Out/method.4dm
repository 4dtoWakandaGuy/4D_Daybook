If (False:C215)
	//Table Form Method Name: [PURCHASE_ORDERS]PurchaseOrder_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; PO_l_SortFieldWas; PO_l_SortOrderWas; PO_l_SortTableWas; PUR_l_Header; SIZ_l_Minimized; SIZ_l_OLDBottom)
	C_LONGINT:C283(SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_oldMethodName; vButtDisO; VStatus_; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_ORDERS].PurchaseOrder_Out"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (PUR_l_Header=0)
			PUR_l_Header:=1
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			INT_Setoutput(Table:C252(->[PURCHASE_ORDERS:57]); WIN_t_CurrentOutputform)  //;->vInvTitle) `Rollo 9/7/2004 is undefined!!
		Else 
			PUR_l_Header:=0
		End if 
	: ($_l_event=On Resize:K2:27)
		If (Not:C34(INT_bo_DetailOpen))
			If (Not:C34(WIN_bo_Resize))
				
				WS_OutputResize
			Else 
				WIN_bo_Resize:=False:C215
			End if 
			
		End if 
		
		INT_bo_DetailOpen:=False:C215
	: ($_l_event=On Display Detail:K2:22)
		If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2#"")
			VStatus_:=PUR_GetFileState
			If (False:C215)
				If ([PURCHASE_ORDERS:57]State:14=-1)
					vStatus_:="Unconfirmed"
				Else 
					vStatus_:="Confirmed"
				End if 
			End if 
			
			If ([COMPANIES:2]Company_Code:1#[PURCHASE_ORDERS:57]Company_Code:1)  //only here cos StatsView kills auto rels
				RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
			End if 
		Else 
			VStatus_:=""
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PURCHASE_ORDERS:57]); "PurchaseOrder_Out")
		Cache_Initialise("PMaster")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		OpenHelp(Table:C252(->[PURCHASE_ORDERS:57]); "PurchaseOrder_Out")
		vButtDisO:="O              D "
		Out_Buttons
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[PURCHASE_ORDERS:57]Company_Code:1; "Purchase Orders"; "PurchOrd_In"; "PurchOrd_Sel"; "Minor_Del"; "PMaster"; "Purchase Orders"; "PurchOrd_OutCou"; 1; 5)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		
		PO_l_SortFieldWas:=FS_l_SortFieldNUM
		PO_l_SortTableWas:=FS_l_SortTableNUM
		PO_l_SortOrderWas:=FS_l_SortDirection
		
		COPY NAMED SELECTION:C331([PURCHASE_ORDERS:57]; "CurrentPOselection")
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
		
	: ($_l_event=On Close Detail:K2:24)
		FS_l_SortFieldNUM:=PO_l_SortFieldWas
		FS_l_SortTableNUM:=PO_l_SortTableWas
		FS_l_SortDirection:=PO_l_SortOrderWas
		USE NAMED SELECTION:C332("CurrentPOselection")
		$_t_FormReference:=Table name:C256(->[PURCHASE_ORDERS:57])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O              D "
		Out_Buttons
End case 
ERR_MethodTrackerReturn("FM [PURCHASE_ORDERS].PurchaseOrder_Out"; $_t_oldMethodName)
