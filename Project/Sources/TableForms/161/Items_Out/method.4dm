If (False:C215)
	//Table Form Method Name: [INVOICES_ITEMS]Items_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 12:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DEF_l_SettingsCalled; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; ORDI_l_SortFieldWas; ORDI_l_SortOrderWas; ORDI_l_SortTableWas; SIZ_l_Minimized; SIZ_l_OLDBottom)
	C_LONGINT:C283(SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_oldMethodName; vButtDisO; vVATTitleF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES_ITEMS].Items_Out"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (DEF_l_SettingsCalled=0)
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			INT_Setoutput(Table:C252(->[INVOICES_ITEMS:161]); WIN_t_CurrentOutputform)
			DEF_l_SettingsCalled:=1
		Else 
			DEF_l_SettingsCalled:=0
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
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[INVOICES_ITEMS:161]); "Items_Out")
		Cache_Initialise("Master")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
		
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		OpenHelp(Table:C252(->[INVOICES_ITEMS:161]); "Items_Out")
		vButtDisO:="OI P           DT"
		Out_Buttons
		vVATTitleF:=Term_VATWT("VAT")
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[INVOICES_ITEMS:161]; ->[INVOICES_ITEMS:161]Item_Number:12; ->[INVOICES_ITEMS:161]INVOICES_CODE:18; "InvoiceItemsI"; ""; "InvoiceItems_Sel"; ""; "IItemsMaster"; "Invoice Items"; "InvoiceItemsI OutCount"; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		ORDI_l_SortFieldWas:=FS_l_SortFieldNUM
		ORDI_l_SortTableWas:=FS_l_SortTableNUM
		ORDI_l_SortOrderWas:=FS_l_SortDirection
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		FS_l_SortFieldNUM:=ORDI_l_SortFieldWas
		FS_l_SortTableNUM:=ORDI_l_SortTableWas
		FS_l_SortDirection:=ORDI_l_SortOrderWas
		$_t_FormReference:=Table name:C256(->[INVOICES_ITEMS:161])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="OI P           DT"
		Out_Buttons
		vVATTitleF:=Term_VATWT("VAT")
End case 
ERR_MethodTrackerReturn("FM [INVOICES_ITEMS].Items_Out"; $_t_oldMethodName)
