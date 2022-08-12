If (False:C215)
	//Table Form Method Name: [PURCHASE_ORDERS]dASK_purchaseOrder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/03/2010 22:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PO_lb_LBCont;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(PO_at_DisplayDetail;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_WindowHeight; PO_l_BUT1; PO_l_But2; PO_l_BUT3; PO_l_BUT4; PO_l_BUT5; PO_l_BUT6; PO_l_BUT7; PO_l_BUT8; PO_l_BUT9; xNew)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; PO_t_COL1; PO_t_COL2; PO_t_COL3; PO_t_COL4; PO_t_COL5; PO_t_COL6; PO_t_COL7)
	C_TEXT:C284(PO_t_COL8; PO_t_COL9; PO_t_HED1; PO_t_HED2; PO_t_HED3; PO_t_HED4; PO_t_HED5; PO_t_HED6; PO_t_HED7; PO_t_HED8; PO_t_HED9)
	C_TEXT:C284(vContact)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_ORDERS].dASK_purchaseOrder"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(PO_at_DisplayDetail; 0)
		DB_LoadDisplay(Table:C252(->[PURCHASE_ORDERS:57]); ->PO_at_DisplayDetail)
		
		OpenHelp(Table:C252(->[PURCHASE_ORDERS:57]); "dAsk_PurchaseOrder")
		
		PO_List
		vContact:=""
		If ((DB_t_CurrentFormUsage="NC") | (DB_GetModuleSettingByNUM(Module_PurchaseOrders)=3))
			OBJECT SET VISIBLE:C603(xNew; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddNew"; False:C215)
			OBJECT SET ENABLED:C1123(xNew; False:C215)
		End if 
		$_l_WindowHeight:=31+(Size of array:C274(GEN_at_RecordCode)*13)
		If ($_l_WindowHeight<120)
			$_l_WindowHeight:=120
		End if 
		WS_AutoscreenSize(2; $_l_WindowHeight; 377)
		
		LB_SetupListbox(->PO_lb_LBCont; "PO_t"; "PO_L"; 1; ->GEN_at_RecordCode; ->GEN_at_Name; ->GEN_at_Identity; ->SVS_at_PreviewEvent)
		LB_SetColumnHeaders(->PO_lb_LBCont; "PO_L"; 1; "Code"; "Company"; "Name"; "Contact Code")
		
		LB_SetColumnWidths(->PO_lb_LBCont; "PO_t"; 1; 87; 187; 88; 0)
		
		LB_SetEnterable(->PO_lb_LBCont; False:C215; 0)
		LB_SetScroll(->PO_lb_LBCont; -3; -2)
		
		LB_StyleSettings(->PO_lb_LBCont; "Black"; 9; "PO_t"; ->[ACCOUNTS:32])
		
		GEN_at_Identity:=1
		GEN_at_Name:=1
		GEN_at_RecordCode:=1
		LISTBOX SELECT ROW:C912(PO_lb_LBCont; GEN_at_Identity; 0)
		LB_SetScroll(->PO_lb_LBCont; GEN_at_Identity)
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [PURCHASE_ORDERS].dASK_purchaseOrder"; $_t_oldMethodName)
