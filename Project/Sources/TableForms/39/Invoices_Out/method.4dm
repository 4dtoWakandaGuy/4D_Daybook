If (False:C215)
	//Table Form Method Name: [INVOICES]Invoices_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/09/2010 10:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DEF_l_SettingsCalled; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; INV_l_SortFieldWas; INV_l_SortOrderWas; INV_l_SortTableWas; SIZ_l_Minimized; SIZ_l_OLDBottom)
	C_LONGINT:C283(SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop; vCalls; vContr)
	C_TEXT:C284($_t_oldMethodName; vButtDisO; vCallsSTR; VContrSTR; vInvTitle; vStatus_; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].Invoices_Out"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (DEF_l_SettingsCalled=0)
			
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
			Case of 
				: ([INVOICES:39]State:10=-3)
					vStatus_:="Receipt"
				: ([INVOICES:39]State:10=-2)
					vStatus_:="Deposit"
				: ([INVOICES:39]State:10=-1)
					vStatus_:="Proforma"
				: ([INVOICES:39]State:10=0)
					vStatus_:="Not Posted"
				: ([INVOICES:39]State:10=1)
					vStatus_:="Batched"
				: ([INVOICES:39]State:10=2)
					vStatus_:="Posted"
				: ([INVOICES:39]State:10=3)
					vStatus_:="SL Only"
			End case 
			
			
			If ([COMPANIES:2]Company_Code:1#[INVOICES:39]Company_Code:2)  //only here cos StatsView kills auto rels
				RELATE ONE:C42([INVOICES:39]Company_Code:2)
			End if 
			If ([INVOICES:39]Total_Due:7>0)
				If ([INVOICES:39]Due_Date:18#!00-00-00!)
					vContr:=<>DB_d_CurrentDate-[INVOICES:39]Due_Date:18
				Else 
					vContr:=<>DB_d_CurrentDate-[INVOICES:39]Invoice_Date:4
				End if 
				
				vCalls:=<>DB_d_CurrentDate-[INVOICES:39]Invoice_Date:4
			Else 
				If ([INVOICES:39]Total_Due:7<0)
					If ([INVOICES:39]Due_Date:18#!00-00-00!)
						vContr:=0
					Else 
						vContr:=0
					End if 
					
					vCalls:=(<>DB_d_CurrentDate-[INVOICES:39]Invoice_Date:4)
					
				Else 
					vCalls:=0
					vContr:=0
				End if 
			End if 
			If (vContr<0)
				vContr:=0
			End if 
			VContrSTR:=String:C10(VContr)
			vCallsSTR:=String:C10(VCalls)
			
		Else 
			vStatus_:=""
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
			vContr:=0
			vCalls:=0
			VContrSTR:=String:C10(VContr)
			vCallsSTR:=String:C10(VCalls)
			
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[INVOICES:39]); "Invoices_Out")
		WS_KeepFocus
		Cache_Initialise("IMaster")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
		
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		OpenHelp(Table:C252(->[INVOICES:39]); "Invoices_Out")
		vInvTitle:=Uppercase:C13(Term_SLPLWT("Sales Ledger"))
		vButtDisO:="O              D "
		Out_Buttons
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Company_Code:2; "Invoices"; "DB_MenuNewRecord"; "Invoices_Sel"; "Invoices_OutDel"; "IMaster"; "Invoices"; "*Invoices_OutCou"; 2; 3)
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		INV_l_SortFieldWas:=FS_l_SortFieldNUM
		INV_l_SortTableWas:=FS_l_SortTableNUM
		INV_l_SortOrderWas:=FS_l_SortDirection
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		FS_l_SortFieldNUM:=INV_l_SortFieldWas
		FS_l_SortTableNUM:=INV_l_SortTableWas
		FS_l_SortDirection:=INV_l_SortOrderWas
		$_t_FormReference:=Table name:C256(->[INVOICES:39])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O              D"
		Out_Buttons
End case 
ERR_MethodTrackerReturn("FM [INVOICES].Invoices_Out"; $_t_oldMethodName)
