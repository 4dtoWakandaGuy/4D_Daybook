If (False:C215)
	//Table Form Method Name: [PURCHASE_INVOICES]dask_Purchases
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2010 11:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PI_lb_LBCont;0)
	//ARRAY REAL(PI_ar_Value;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(PI_at_DisplayDetail;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_WindowHeight; PI_l_BUT1; PI_l_But2; PI_l_BUT3; PI_l_BUT4; PI_l_BUT5; PI_l_BUT6; PI_l_BUT7; PI_l_BUT8; PI_l_BUT9; xNew)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; PI_t_COL1; PI_t_COL2; PI_t_COL3; PI_t_COL4; PI_t_COL5; PI_t_COL6; PI_t_COL7)
	C_TEXT:C284(PI_t_COL8; PI_t_COL9; PI_t_HED1; PI_t_HED2; PI_t_HED3; PI_t_HED4; PI_t_HED5; PI_t_HED6; PI_t_HED7; PI_t_HED8; PI_t_HED9)
	C_TEXT:C284(vContact)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_INVOICES].dask_Purchases"; Form event code:C388)


Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(PI_at_DisplayDetail; 0)
		DB_LoadDisplay(Table:C252(->[PURCHASE_INVOICES:37]); ->PI_at_DisplayDetail)
		
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); "dAsk_Purchases")
		PI_List
		
		
		vContact:=""
		If ((DB_t_CurrentFormUsage="NC") | (DB_GetModuleSettingByNUM(Module_PurchaseLedger)=3))
			OBJECT SET VISIBLE:C603(xNew; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddNew"; False:C215)
			OBJECT SET ENABLED:C1123(xNew; False:C215)
		End if 
		$_l_WindowHeight:=31+(Size of array:C274(GEN_at_RecordCode)*13)
		If ($_l_WindowHeight<120)
			$_l_WindowHeight:=120
		End if 
		WS_AutoscreenSize(2; $_l_WindowHeight; 377)
		
		LB_SetupListbox(->PI_lb_LBCont; "PI_t"; "PI_L"; 1; ->GEN_at_RecordCode; ->GEN_at_Name; ->GEN_at_Identity; ->PI_ar_Value)
		LB_SetColumnHeaders(->PI_lb_LBCont; "PI_L"; 1; "Code"; "Company"; "Name"; "value")
		
		LB_SetColumnWidths(->PI_lb_LBCont; "PI_t"; 1; 87; 187; 88; 40)
		
		LB_SetEnterable(->PI_lb_LBCont; False:C215; 0)
		LB_SetScroll(->PI_lb_LBCont; -3; -2)
		
		LB_StyleSettings(->PI_lb_LBCont; "Black"; 9; "PI_t"; ->[ACCOUNTS:32])
		
		GEN_at_Identity:=1
		GEN_at_Name:=1
		GEN_at_RecordCode:=1
		LISTBOX SELECT ROW:C912(PI_lb_LBCont; GEN_at_Identity; 0)
		LB_SetScroll(->PI_lb_LBCont; GEN_at_Identity)
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [PURCHASE_INVOICES].dask_Purchases"; $_t_oldMethodName)
