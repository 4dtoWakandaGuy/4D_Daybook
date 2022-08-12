If (False:C215)
	//Table Form Method Name: [ORDERS]dAsk_Order
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/03/2010 17:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(bd1)
	//C_UNKNOWN(xNew)
	//ARRAY BOOLEAN(SO_l_LBCont;0)
	//ARRAY DATE(ORD_ad_orderDate;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(ORD_at_DisplayDetail;0)
	//ARRAY TEXT(ORD_at_StateNames;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_LBWidth; bd1; SO_l_BUT1; SO_l_But2; SO_l_BUT3; SO_l_BUT4; SO_l_BUT5; SO_l_BUT6; SO_l_BUT7; SO_l_BUT8; xNew)
	C_LONGINT:C283($_l_ArraySize; $_l_LBWidth; SO_l_BUT9)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SO_t_COL1; SO_t_COL2; SO_t_COL3; SO_t_COL4; SO_t_COL5; SO_t_COL6; SO_t_COL7; SO_t_COL9)
	C_TEXT:C284(SO_t_HED1; SO_t_HED2; SO_t_HED3; SO_t_HED4; SO_t_HED5; SO_t_HED6; SO_t_HED7; SO_t_HED8; SO_t_HED9; $_t_oldMethodName; DB_t_CurrentFormUsage)
	C_TEXT:C284(SO_t_COL8; vContact)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].dAsk_Order"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(ORD_at_DisplayDetail; 0)
		DB_LoadDisplay(Table:C252(->[ORDERS:24]); ->ORD_at_DisplayDetail)
		
		OpenHelp(Table:C252(->[ORDERS:24]); "dAsk_Order")
		
		SO_List
		vContact:=""
		If ((DB_t_CurrentFormUsage="NC") | (DB_GetModuleSettingByNUM(Module_SalesOrders)=3))
			OBJECT SET VISIBLE:C603(xNew; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddNew"; False:C215)
			OBJECT SET ENABLED:C1123(xNew; False:C215)
		End if 
		$_l_ArraySize:=31+(bd1*13)
		If ($_l_ArraySize<120)
			$_l_ArraySize:=120
		End if 
		
		
		LB_SetupListbox(->SO_l_LBCont; "SO_t"; "SO_L"; 1; ->GEN_at_RecordCode; ->GEN_at_Name; ->GEN_at_Identity; ->ORD_ad_orderDate; ->ORD_at_StateNames; ->SVS_at_PreviewEvent)
		LB_SetColumnHeaders(->SO_l_LBCont; "SO_L"; 1; "Code"; "Company"; "Name"; "Date"; "State"; "Contact Code")
		
		LB_SetColumnWidths(->SO_l_LBCont; "SO_t"; 1; 87; 187; 88; 50; 100; 0)
		$_l_LBWidth:=87+187+88+50+100+10
		WS_AutoscreenSize(2; $_l_ArraySize; $_l_LBWidth)
		LB_SetEnterable(->SO_l_LBCont; False:C215; 0)
		LB_SetScroll(->SO_l_LBCont; -3; -2)
		
		LB_StyleSettings(->SO_l_LBCont; "Black"; 9; "SO_t"; ->[ORDERS:24])
		
		GEN_at_Identity:=1
		GEN_at_Name:=1
		GEN_at_RecordCode:=1
		LISTBOX SELECT ROW:C912(SO_l_LBCont; GEN_at_Identity; 0)
		LB_SetScroll(->SO_l_LBCont; GEN_at_Identity)
		
		INT_SetDialog
		
End case 


ERR_MethodTrackerReturn("FM [ORDERS].dAsk_Order"; $_t_oldMethodName)
