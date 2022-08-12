If (False:C215)
	//Table Form Method Name: [ORDERS]Orders_OutV
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
	//ARRAY TEXT(aPop1;0)
	//ARRAY TEXT(ORD_at_DateDropDown;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_DATE:C307(vDate)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DEF_l_SettingsCalled; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_FormReference; $_t_oldMethodName; vButtDisO; vName; vTitleR; vVATTitleF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].Orders_OutV"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (DEF_l_SettingsCalled=0)
			ARRAY TEXT:C222(ORD_at_DateDropDown; 3)
			ORD_at_DateDropDown{1}:="Enquiry Date"
			ORD_at_DateDropDown{2}:="Quotation Date"
			ORD_at_DateDropDown{3}:="Order Date"
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			vTitleR:="ENQUIRYWRITER"  //Rollo 25/11/2004
			INT_Setoutput(Table:C252(->[ORDERS:24]); WIN_t_CurrentOutputform; ->VTitleR)  //Rollo 25/11/2004
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
		If ([ORDERS:24]Order_Code:3#"")
			RELATE ONE:C42([ORDERS:24]Contact_Code:2)
			vName:=[CONTACTS:1]Contact_Name:31
			Case of 
				: ([ORDERS:24]Order_Date:4#!00-00-00!)
					vDate:=[ORDERS:24]Order_Date:4
				: ([ORDERS:24]Quotation_Date:26#!00-00-00!)
					vDate:=[ORDERS:24]Quotation_Date:26
				Else 
					vDate:=[ORDERS:24]Enquiry_Date:25
			End case 
			If ([COMPANIES:2]Company_Code:1#[ORDERS:24]Company_Code:1)  //only here cos StatsView kills auto rels
				RELATE ONE:C42([ORDERS:24]Company_Code:1)
			End if 
		Else 
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
			REDUCE SELECTION:C351([CONTACTS:1]; 0)
			Vdate:=!00-00-00!
			vName:=""
			
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[ORDERS:24]); "Orders_OutV")
		Cache_Initialise("OrMaster")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  // (vFromIn))
		OpenHelp(Table:C252(->[ORDERS:24]); "Orders_OutV")
		vButtDisO:="OOD            D "
		Out_Buttons
		vTitleR:=Uppercase:C13(Term_OrdWT("EnquiryWriter"))
		vVATTitleF:=Term_VATWT("VAT")
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Company_Code:1; "Orders"; "Order_InE"; "Orders_Sel"; "Orders_OutDel"; "OrMaster"; "Types"; "Orders_OutCntV"; 1; 2)
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[ORDERS:24])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="OOD            D "
		Out_Buttons
		vTitleR:=Uppercase:C13(Term_OrdWT("EnquiryWriter"))
		vVATTitleF:=Term_VATWT("VAT")
End case 
ERR_MethodTrackerReturn("FM [ORDERS].Orders_OutV"; $_t_oldMethodName)