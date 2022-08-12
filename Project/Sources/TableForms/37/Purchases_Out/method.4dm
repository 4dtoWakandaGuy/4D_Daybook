If (False:C215)
	//Table Form Method Name: [PURCHASE_INVOICES]Purchases_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/09/2010 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DEF_l_SettingsCalled; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; PI_l_SortFieldWas; PI_l_SortOrderWas; PI_l_SortTableWas; SIZ_l_Minimized; SIZ_l_OLDBottom)
	C_LONGINT:C283(SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop; vCalls; vContr)
	C_TEXT:C284($_t_oldMethodName; vButtDisO; vCallsSTR; VContrSTR; vInvTitle; vStatus_; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_INVOICES].Purchases_Out"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (DEF_l_SettingsCalled=0)
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			INT_Setoutput(Table:C252(->[PURCHASE_INVOICES:37]); WIN_t_CurrentOutputform)  //;->vInvTitle) `Rollo 9/7/2004 is undefined!!
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
		If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
			Case of 
				: ([PURCHASE_INVOICES:37]State:24=-3)
					vStatus_:="Payment"
				: ([PURCHASE_INVOICES:37]State:24=-2)
					vStatus_:="Pre-Payment"
				: ([PURCHASE_INVOICES:37]State:24=-1)
					vStatus_:=""
				: ([PURCHASE_INVOICES:37]State:24=0)
					vStatus_:="Not Posted"
				: ([PURCHASE_INVOICES:37]State:24=1)
					vStatus_:="Batched"
				: ([PURCHASE_INVOICES:37]State:24=2)
					vStatus_:="Posted"
				: ([PURCHASE_INVOICES:37]State:24=3)
					vStatus_:="PL Only"
			End case 
			vCalls:=Current date:C33(*)-[PURCHASE_INVOICES:37]Invoice_Date:5
			If ([PURCHASE_INVOICES:37]Total_Due:9>0)
				If ([PURCHASE_INVOICES:37]Due_Date:17>!00-00-00!)
					
					vContr:=Current date:C33(*)-[PURCHASE_INVOICES:37]Due_Date:17
				Else 
					vContr:=Current date:C33(*)-[PURCHASE_INVOICES:37]Invoice_Date:5
				End if 
			Else 
				vContr:=0
				
			End if 
			If (vContr<0)
				vContr:=0
			End if 
			If ([COMPANIES:2]Company_Code:1#[PURCHASE_INVOICES:37]Company_Code:2)  //only here cos StatsView kills auto rels
				RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
			End if 
		Else 
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
			VCalls:=0
			vContr:=0
			Vstatus_:=""
			VContrSTR:=String:C10(VContr)
			vCallsSTR:=String:C10(VCalls)
			
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); "Purchases_Out")
		Cache_Initialise("Master")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		OpenHelp(Table:C252(->[PURCHASE_INVOICES:37]); "Purchases_Out")
		vInvTitle:=Uppercase:C13(Term_SLPLWT("Purchase Ledger"))
		vButtDisO:="O              D "
		Out_Buttons
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Code:1; ->[PURCHASE_INVOICES:37]Company_Code:2; "Purchases"; "DB_MenuNewRecord"; "Purchases_Sel"; "Purchases_OutDe"; "Master"; "Purchases"; "*Purchases_OutCo"; 2; 0)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		PI_l_SortFieldWas:=FS_l_SortFieldNUM
		PI_l_SortTableWas:=FS_l_SortTableNUM
		PI_l_SortOrderWas:=FS_l_SortDirection
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
		
	: ($_l_event=On Close Detail:K2:24)
		FS_l_SortFieldNUM:=PI_l_SortFieldWas
		FS_l_SortTableNUM:=PI_l_SortTableWas
		FS_l_SortDirection:=PI_l_SortOrderWas
		$_t_FormReference:=Table name:C256(->[PURCHASE_INVOICES:37])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vInvTitle:=Uppercase:C13(Term_SLPLWT("Purchase Ledger"))
		vButtDisO:="O              D "
		Out_Buttons
End case 
ERR_MethodTrackerReturn("FM [PURCHASE_INVOICES].Purchases_Out"; $_t_oldMethodName)
