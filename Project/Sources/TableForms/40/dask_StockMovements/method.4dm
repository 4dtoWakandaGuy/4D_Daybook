If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENTS]dask_StockMovements
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2010 12:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SM_l_LBCont;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(SM_at_DisplayDetail;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_WindowHeight; SM_l_BUT1; SM_l_But2; SM_l_BUT3; SM_l_BUT4; SM_l_BUT5; SM_l_BUT6; SM_l_BUT7; SM_l_BUT8; SM_l_BUT9; xNew)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SM_t_COL1; SM_t_COL2; SM_t_COL3; SM_t_COL4; SM_t_COL5; SM_t_COL6; SM_t_COL7)
	C_TEXT:C284(SM_t_COL8; SM_t_COL9; SM_t_HED1; SM_t_HED2; SM_t_HED3; SM_t_HED4; SM_t_HED5; SM_t_HED6; SM_t_HED7; SM_t_HED8; SM_t_HED9)
	C_TEXT:C284(vContact)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENTS].dask_StockMovements"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(SM_at_DisplayDetail; 0)
		DB_LoadDisplay(Table:C252(->[STOCK_MOVEMENTS:40]); ->SM_at_DisplayDetail)
		
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); "dAsk_stockMovements")
		SM_List
		
		
		
		vContact:=""
		If ((DB_t_CurrentFormUsage="NC") | (DB_GetModuleSettingByNUM(Module_StockControl)=3))
			OBJECT SET VISIBLE:C603(xNew; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddNew"; False:C215)
			OBJECT SET ENABLED:C1123(xNew; False:C215)
		End if 
		$_l_WindowHeight:=31+(Size of array:C274(GEN_at_RecordCode)*13)
		If ($_l_WindowHeight<120)
			$_l_WindowHeight:=120
		End if 
		WS_AutoscreenSize(2; $_l_WindowHeight; 377)
		
		LB_SetupListbox(->SM_l_LBCont; "SM_t"; "SM_L"; 1; ->GEN_at_RecordCode; ->GEN_at_Name; ->GEN_at_Identity)
		LB_SetColumnHeaders(->SM_l_LBCont; "SM_L"; 1; "Stock Movement"; "Type")
		
		LB_SetColumnWidths(->SM_l_LBCont; "SM_t"; 1; 87; 187; 0)
		
		LB_SetEnterable(->SM_l_LBCont; False:C215; 0)
		LB_SetScroll(->SM_l_LBCont; -3; -2)
		
		LB_StyleSettings(->SM_l_LBCont; "Black"; 9; "SM_t"; ->[ACCOUNTS:32])
		
		GEN_at_Identity:=1
		GEN_at_Name:=1
		GEN_at_RecordCode:=1
		LISTBOX SELECT ROW:C912(SM_l_LBCont; GEN_at_Identity; 0)
		LB_SetScroll(->SM_l_LBCont; GEN_at_Identity)
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [STOCK_MOVEMENTS].dask_StockMovements"; $_t_oldMethodName)
