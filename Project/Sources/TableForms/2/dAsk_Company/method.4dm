If (False:C215)
	//Table Form Method Name: [COMPANIES]dAsk_Company
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/10/2013 16:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_lb_Companies;0)
	ARRAY LONGINT:C221($_al_ContactRecordIDS; 0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_CompanyNames; 0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	ARRAY TEXT:C222($_at_ContactCompanyCodes; 0)
	//ARRAY TEXT(COM_at_DisplayDetail;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_bestHeight; $_l_BestObjectWidth1; $_l_BestObjectWidth2; $_l_BestObjectWidth3; $_l_bestWidth; $_l_CompaniesIndex; $_l_CompanyRow; $_l_event; $_l_FormWidth; $_l_Size; $_l_TotalWidth)
	C_LONGINT:C283(bd1; ch1; ch2; COM_l_BUT1; COM_l_But2; COM_l_BUT3; COM_l_BUT4; COM_l_BUT5; COM_l_BUT6; COM_l_BUT7; COM_l_BUT8)
	C_LONGINT:C283(COM_l_BUT9; xNew)
	C_TEXT:C284($_t_oldMethodName; COM_t_BestColumn1; COM_t_BestColumn2; COM_t_BestColumn3; COM_t_COL1; COM_t_COL2; COM_t_COL3; COM_t_COL4; COM_t_COL5; COM_t_COL6; COM_t_COL7)
	C_TEXT:C284(COM_t_COL8; COM_t_COL9; COM_t_HED1; COM_t_HED2; COM_t_HED3; COM_t_HED4; COM_t_HED5; COM_t_HED6; COM_t_HED7; COM_t_HED8; COM_t_HED9)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAsk_Company"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		Load_Fields
		
		ARRAY TEXT:C222(COM_at_DisplayDetail; 0)
		DB_LoadDisplay(Table:C252(->[COMPANIES:2]); ->COM_at_DisplayDetail)
		If (DB_t_CurrentFormUsage="MC")
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			
			Array_LCx(Records in selection:C76([CONTACTS_COMPANIES:145]))
			SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Company_Code:1; $_at_ContactCompanyCodes; [CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes; [CONTACTS_COMPANIES:145]ID:3; $_al_ContactRecordIDS)
			QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_ContactCompanyCodes)
			SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; $_at_CompanyCodes; [COMPANIES:2]Company_Name:2; $_at_CompanyNames)
			For ($_l_CompaniesIndex; 1; Size of array:C274($_at_ContactCompanyCodes))
				$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; $_at_ContactCompanyCodes{$_l_CompaniesIndex})
				GEN_at_RecordCode{$_l_CompaniesIndex}:=$_at_ContactCompanyCodes{$_l_CompaniesIndex}
				If ($_l_CompanyRow>0)
					GEN_at_Name{$_l_CompaniesIndex}:=$_at_CompanyCodes{$_l_CompanyRow}
				Else 
					GEN_at_Name{$_l_CompaniesIndex}:="Unknown"
				End if 
			End for 
		Else 
			Companies_Arr(COM_at_DisplayDetail)
		End if 
		SORT ARRAY:C229(GEN_at_RecordCode; GEN_at_Identity; GEN_at_Name; >)
		
		
		OpenHelp(Table:C252(->[COMPANIES:2]); "dAsk_Company")
		Array_LCStart
		ch1:=1
		ch2:=1
		bd1:=Size of array:C274(GEN_at_Name)
		//GEN_at_RecordCode
		//GEN_at_Name
		//GEN_at_Identity
		//```
		$_l_BestObjectWidth1:=87
		$_l_BestObjectWidth2:=187
		$_l_BestObjectWidth3:=88
		For ($_l_CompaniesIndex; 1; Size of array:C274(GEN_at_RecordCode))
			COM_t_BestColumn1:=GEN_at_RecordCode{$_l_CompaniesIndex}
			COM_t_BestColumn2:=GEN_at_Name{$_l_CompaniesIndex}
			COM_t_BestColumn3:=GEN_at_Identity{$_l_CompaniesIndex}
			OBJECT GET BEST SIZE:C717(COM_t_BestColumn1; $_l_bestWidth; $_l_bestHeight)
			If ($_l_bestWidth>$_l_BestObjectWidth1)
				$_l_BestObjectWidth1:=$_l_bestWidth
			End if 
			OBJECT GET BEST SIZE:C717(COM_t_BestColumn2; $_l_bestWidth; $_l_bestHeight)
			If ($_l_bestWidth>$_l_BestObjectWidth2)
				$_l_BestObjectWidth2:=$_l_bestWidth
			End if 
			OBJECT GET BEST SIZE:C717(COM_t_BestColumn3; $_l_bestWidth; $_l_bestHeight)
			If ($_l_bestWidth>$_l_BestObjectWidth3)
				$_l_BestObjectWidth3:=$_l_bestWidth
			End if 
		End for 
		$_l_BestObjectWidth3:=$_l_BestObjectWidth3+20
		$_l_FormWidth:=369
		$_l_TotalWidth:=$_l_BestObjectWidth1+$_l_BestObjectWidth2+$_l_BestObjectWidth3
		If ($_l_TotalWidth>$_l_FormWidth)
			$_l_FormWidth:=$_l_TotalWidth
		End if 
		
		OBJECT SET VISIBLE:C603(COM_t_BestColumn1; False:C215)
		OBJECT SET VISIBLE:C603(COM_t_BestColumn2; False:C215)
		OBJECT SET VISIBLE:C603(COM_t_BestColumn3; False:C215)
		LB_SetupListbox(->COM_lb_Companies; "COM_t"; "COM_L"; 1; ->GEN_at_RecordCode; ->GEN_at_Name; ->GEN_at_Identity)
		LB_SetColumnHeaders(->COM_lb_Companies; "COM_L"; 1; "Code"; "Name"; COM_at_DisplayDetail{COM_at_DisplayDetail})
		LB_SetColumnWidths(->COM_lb_Companies; "COM_t"; 1; $_l_BestObjectWidth1; $_l_BestObjectWidth2; $_l_BestObjectWidth3)
		LB_SetEnterable(->COM_lb_Companies; False:C215; 0)
		LB_SetScroll(->COM_lb_Companies; -3; -2)
		LB_StyleSettings(->COM_lb_Companies; "Black"; 9; "COM_t"; ->[ACCOUNTS:32])
		
		//``
		If ((DB_t_CurrentFormUsage="NC") | (DB_GetModuleSettingByNUM(Module_Companies)=3))
			
			OBJECT SET ENABLED:C1123(xNew; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddNew"; False:C215)
			OBJECT SET VISIBLE:C603(xNew; False:C215)
		End if 
		If (DB_t_CurrentFormUsage="MC")
			OBJECT SET ENABLED:C1123(xNew; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddNew"; False:C215)
			OBJECT SET VISIBLE:C603(xNew; False:C215)
			
			OBJECT SET ENABLED:C1123(ch1; False:C215)
			OBJECT SET VISIBLE:C603(ch1; False:C215)
			OBJECT SET ENABLED:C1123(ch2; False:C215)
			OBJECT SET VISIBLE:C603(Ch2; False:C215)
		End if 
		$_l_Size:=34+(bd1*16)
		If ($_l_Size<120)
			$_l_Size:=120
		End if 
		WS_AutoscreenSize(2; $_l_Size; $_l_FormWidth)
		INT_SetDialog
		LISTBOX SELECT ROW:C912(COM_lb_Companies; 1; 0)
		LB_SetScroll(->COM_lb_Companies; 1)
		SD2_SetDiaryPopup
	: ($_l_event=On Deactivate:K2:10)
		
		// PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		
		In_ButtdCall(->[COMPANIES:2])
		
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dAsk_Company"; $_t_oldMethodName)
