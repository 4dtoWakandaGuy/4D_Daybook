If (False:C215)
	//Table Form Method Name: [INVOICES]Invoices_Pay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 08:19
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; INT_bo_DetailOpen; WIN_bo_Resize)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DB_l_ButtonClickedFunction; DEF_l_SettingsCalled; iCancel; oOK; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_LONGINT:C283(VCalls; VContr; xApply; xSelect)
	C_TEXT:C284($_t_FormReference; $_t_oldMethodName; DB_t_CallOnCloseorSave; INV_t_ButtonText; vButtDisO; vCallsSTR; vContName; VContrSTR; vInvTitle; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].Invoices_Pay"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (DEF_l_SettingsCalled=0)
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			If (INV_t_ButtonText="")
				INV_t_ButtonText:="Receipt"
			End if 
			OBJECT SET TITLE:C194(xSelect; INV_t_ButtonText)
			
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			INT_Setoutput(Table:C252(->[INVOICES:39]); WIN_t_CurrentOutputform)  //;->vInvTitle) `Rollo 9/7/2004 is undefined!!
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
	: ($_l_event=On Display Detail:K2:22)
		If ([INVOICES:39]Invoice_Number:1#"")
			RELATE ONE:C42([INVOICES:39]Contact_Code:3)
			vContName:=[CONTACTS:1]Contact_Name:31
			vCalls:=<>DB_d_CurrentDate-[INVOICES:39]Invoice_Date:4
			If ([INVOICES:39]Due_Date:18#!00-00-00!)
				If ([INVOICES:39]Total_Due:7>=0)
					vContr:=<>DB_d_CurrentDate-[INVOICES:39]Due_Date:18
				Else 
					VContr:=0
				End if 
			Else 
				If ([INVOICES:39]Total_Due:7>=0)
					vContr:=<>DB_d_CurrentDate-[INVOICES:39]Invoice_Date:4
				Else 
					VContr:=0
				End if 
			End if 
			If (vContr<0)
				vContr:=0
			End if 
			RELATE ONE:C42([INVOICES:39]Company_Code:2)
			VContrSTR:=String:C10(VContr)
			vCallsSTR:=String:C10(VCalls)
			
		Else 
			REDUCE SELECTION:C351([CONTACTS:1]; 0)
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
			VcontName:=""
			VCalls:=0
			VContr:=0
			VContrSTR:=String:C10(VContr)
			vCallsSTR:=String:C10(VCalls)
			
		End if 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[INVOICES:39]); "Invoices_Pay")
		Cache_Initialise("IMaster")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		OpenHelp(Table:C252(->[INVOICES:39]); "Invoices_Pay")
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger))#2)
			OBJECT SET ENABLED:C1123(xApply; False:C215)
		End if 
		vInvTitle:=Uppercase:C13(Term_SLPLWT("Sales Ledger"))
		vButtDisO:="O DP        R AD "
		Out_Buttons
		DB_t_CallOnCloseorSave:="OutClose"
	: (($_l_event=On Outside Call:K2:11) | (oOK=1) | (iCancel=1))
		If (DB_GetLedgerPostBatch)
			If ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("Cancel")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Close")) | (iCancel=1))
				oOK:=0
				iCancel:=0
				DB_l_ButtonClickedFunction:=0
				If (DB_bo_RecordModified)
					Gen_Confirm("Are you sure you want to Cancel all of the Receipts that have been entered?"; "Try again"; "Cancel")
					If (OK=0)
						DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel")
					End if 
				Else 
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel")
				End if 
			End if 
			If ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (oOK=1))
				oOK:=0
				DB_l_ButtonClickedFunction:=0
				If (DB_bo_RecordModified)
					Gen_Confirm("Please confirm that all of the Receipts that have been entered should now be "+"Posted"; "Post"; "Try again")
					If (OK=1)
						DB_l_ButtonClickedFunction:=DB_GetButtonFunction("OK")
					End if 
				Else 
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("OK")
				End if 
			End if 
		End if 
		Out_ButtCall(->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Company_Code:2; "Invoices"; "DB_MenuNewRecord"; "Invoices_Sel"; "Invoices_OutDel"; "IMaster"; "Invoices"; "*Invoices_OutCou"; 2; 3)
	: ($_l_event=On Deactivate:K2:10)
		//  PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
		
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[INVOICES:39])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger))#2)
			OBJECT SET ENABLED:C1123(xApply; False:C215)
		End if 
		vInvTitle:=Uppercase:C13(Term_SLPLWT("Sales Ledger"))
		vButtDisO:="O DP        R AD "
		Out_Buttons
		DB_t_CallOnCloseorSave:="OutClose"
End case 
ERR_MethodTrackerReturn("FM [INVOICES].Invoices_Pay"; $_t_oldMethodName)
