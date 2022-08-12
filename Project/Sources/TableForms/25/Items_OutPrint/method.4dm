If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]Items_OutPrint
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
	C_DATE:C307(vDate)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DEF_l_SettingsCalled; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DOC_t_FormName; vButtDisO; VdateSTR; vVATTitleF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].Items_OutPrint"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (DEF_l_SettingsCalled=0)
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			DOC_t_FormName:=""
			INT_Setoutput(Table:C252(->[ORDER_ITEMS:25]); WIN_t_CurrentOutputform; ->DOC_t_FormName; 145)  //last param=pixel pos of the Footer line
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
		If ([ORDER_ITEMS:25]Order_Code:1#"")
			Case of 
				: ([ORDERS:24]Order_Date:4#!00-00-00!)
					vDate:=[ORDERS:24]Order_Date:4
				: ([ORDERS:24]Quotation_Date:26#!00-00-00!)
					vDate:=[ORDERS:24]Quotation_Date:26
				Else 
					vDate:=[ORDERS:24]Enquiry_Date:25
			End case 
		Else 
			REDUCE SELECTION:C351([ORDERS:24]; 0)
			
			vDate:=!00-00-00!
		End if 
		If (Vdate#!00-00-00!)
			VdateSTR:=String:C10(Vdate; 4)
		Else 
			VdateSTR:=""
		End if 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[ORDER_ITEMS:25]); "Items_OutPrint")
		Cache_Initialise("Master")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  // | (vFromIn))
		OpenHelp(Table:C252(->[ORDER_ITEMS:25]); "Items_OutPrint")
		If (vButtDisO#"OI P           DT")
			vButtDisO:="OI P           DT"
			If ((DB_t_CurrentFormUsage="Select") | (DB_t_CurrentFormUsage="Print"))
				DB_SetMenuBar(""; 9)
			Else 
				Orders_PPQtnEst
			End if 
		End if 
		Out_Buttons
		vVATTitleF:=Term_VATWT("VAT/Total")
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Item_Number:27; ->[ORDER_ITEMS:25]Order_Code:1; "OrderI"; ""; "OrderI_Sel"; "OrderI_OutDel"; "Master"; "Order Items"; "OrderI_OutCount"; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
		
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[ORDER_ITEMS:25])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If (vButtDisO#"OI P           DT")
			vButtDisO:="OI P           DT"
			If ((DB_t_CurrentFormUsage="Select") | (DB_t_CurrentFormUsage="Print"))
				SET MENU BAR:C67(9)
			Else 
				Orders_PPQtnEst
			End if 
		End if 
		Out_Buttons
		vVATTitleF:=Term_VATWT("VAT/Total")
		
End case 
ERR_MethodTrackerReturn("FM [ORDER_ITEMS].Items_OutPrint"; $_t_oldMethodName)
