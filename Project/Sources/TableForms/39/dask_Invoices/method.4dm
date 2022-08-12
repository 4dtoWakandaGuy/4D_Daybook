If (False:C215)
	//Table Form Method Name: [INVOICES]dask_
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
	//C_UNKNOWN(bd1)
	//C_UNKNOWN(xNew)
	//ARRAY BOOLEAN(SI_lb_LBCont;0)
	//ARRAY DATE(INV_ad_InvoiceDate;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(INV_at_DisplayDetail;0)
	//ARRAY TEXT(INV_at_StateName;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_WIndowWidth; bd1; SI_l_BUT1; SI_l_But2; SI_l_BUT3; SI_l_BUT4; SI_l_BUT5; SI_l_BUT6; SI_l_BUT7; SI_l_BUT8; xNew)
	C_LONGINT:C283($_l_WIndowHeight; $_l_WIndowWidth; SI_l_BUT9)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SI_t_COL1; SI_t_COL2; SI_t_COL3; SI_t_COL4; SI_t_COL5; SI_t_COL6; SI_t_COL7; SI_t_COL9)
	C_TEXT:C284(SI_t_HED1; SI_t_HED2; SI_t_HED3; SI_t_HED4; SI_t_HED5; SI_t_HED6; SI_t_HED7; SI_t_HED8; SI_t_HED9; $_t_oldMethodName; DB_t_CurrentFormUsage)
	C_TEXT:C284(SI_t_COL8; vContact)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].dask_Invoices"; Form event code:C388)


Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(INV_at_DisplayDetail; 0)
		DB_LoadDisplay(Table:C252(->[INVOICES:39]); ->INV_at_DisplayDetail)
		
		OpenHelp(Table:C252(->[INVOICES:39]); "dAsk_Invoices")
		
		SI_List
		vContact:=""
		If ((DB_t_CurrentFormUsage="NC") | (DB_GetModuleSettingByNUM(Module_SalesLedger)=3))
			OBJECT SET VISIBLE:C603(xNew; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddNew"; False:C215)
			OBJECT SET ENABLED:C1123(xNew; False:C215)
		End if 
		$_l_WIndowHeight:=31+(bd1*13)
		If ($_l_WIndowHeight<120)
			$_l_WIndowHeight:=120
		End if 
		
		
		LB_SetupListbox(->SI_lb_LBCont; "SI_t"; "SI_L"; 1; ->GEN_at_RecordCode; ->GEN_at_Name; ->GEN_at_Identity; ->INV_ad_InvoiceDate; ->INV_at_StateName; ->SVS_at_PreviewEvent)
		LB_SetColumnHeaders(->SI_lb_LBCont; "SI_L"; 1; "Invoice No"; "Company"; "Contact"; "Date"; "State"; "Contact Code")
		
		LB_SetColumnWidths(->SI_lb_LBCont; "SI_t"; 1; 87; 187; 88; 50; 100; 0)
		$_l_WIndowWidth:=87+187+88+50+100+10
		WS_AutoscreenSize(2; $_l_WIndowHeight; $_l_WIndowWidth)
		LB_SetEnterable(->SI_lb_LBCont; False:C215; 0)
		LB_SetScroll(->SI_lb_LBCont; -3; -2)
		
		LB_StyleSettings(->SI_lb_LBCont; "Black"; 9; "SI_t"; ->[ORDERS:24])
		
		GEN_at_Identity:=1
		GEN_at_Name:=1
		GEN_at_RecordCode:=1
		LISTBOX SELECT ROW:C912(SI_lb_LBCont; GEN_at_Identity; 0)
		LB_SetScroll(->SI_lb_LBCont; GEN_at_Identity)
		
		INT_SetDialog
		
End case 


ERR_MethodTrackerReturn("FM:dask_Invoices"; $_t_oldMethodName)
