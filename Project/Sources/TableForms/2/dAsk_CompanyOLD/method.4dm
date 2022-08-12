If (False:C215)
	//Table Form Method Name: [COMPANIES]dAsk_CompanyOLD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_lb_Companies;0)
	//ARRAY TEXT(COM_at_DisplayDetail;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_bestHeight; $_l_BestObjectWidth1; $_l_BestObjectWidth2; $_l_BestObjectWidth3; $_l_bestWidth; $_l_event; $_l_FormWidth; $_l_Index; $_l_TotalWidth; $_l_WindowHeight; bd1)
	C_LONGINT:C283(ch1; ch2; COM_l_BUT1; COM_l_But2; COM_l_BUT3; COM_l_BUT4; COM_l_BUT5; COM_l_BUT6; COM_l_BUT7; COM_l_BUT8; COM_l_BUT9)
	C_LONGINT:C283(xNew)
	C_TEXT:C284($_t_oldMethodName; COM_t_BestColumn1; COM_t_BestColumn2; COM_t_BestColumn3; COM_t_COL1; COM_t_COL2; COM_t_COL3; COM_t_COL4; COM_t_COL5; COM_t_COL6; COM_t_COL7)
	C_TEXT:C284(COM_t_COL8; COM_t_COL9; COM_t_HED1; COM_t_HED2; COM_t_HED3; COM_t_HED4; COM_t_HED5; COM_t_HED6; COM_t_HED7; COM_t_HED8; COM_t_HED9)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAsk_CompanyOLD"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//TRACE
		Load_Fields
		
		ARRAY TEXT:C222(COM_at_DisplayDetail; 0)
		DB_LoadDisplay(Table:C252(->[COMPANIES:2]); ->COM_at_DisplayDetail)
		If (DB_t_CurrentFormUsage="MC")
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			
			Array_LCx(Records in selection:C76([CONTACTS_COMPANIES:145]))
			FIRST RECORD:C50([CONTACTS_COMPANIES:145])
			$_l_Index:=1
			While (Not:C34(End selection:C36([CONTACTS_COMPANIES:145])))
				RELATE ONE:C42([CONTACTS_COMPANIES:145]Company_Code:1)
				GEN_at_RecordCode{$_l_Index}:=[CONTACTS_COMPANIES:145]Company_Code:1
				GEN_at_Name{$_l_Index}:=[COMPANIES:2]Company_Name:2
				Companies_Arr2($_l_Index; "MC"; COM_at_DisplayDetail)
				$_l_Index:=$_l_Index+1
				NEXT RECORD:C51([CONTACTS_COMPANIES:145])
			End while 
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
		For ($_l_Index; 1; Size of array:C274(GEN_at_RecordCode))
			COM_t_BestColumn1:=GEN_at_RecordCode{$_l_Index}
			COM_t_BestColumn2:=GEN_at_Name{$_l_Index}
			COM_t_BestColumn3:=GEN_at_Identity{$_l_Index}
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
		$_l_WindowHeight:=34+(bd1*16)
		If ($_l_WindowHeight<120)
			$_l_WindowHeight:=120
		End if 
		WS_AutoscreenSize(2; $_l_WindowHeight; $_l_FormWidth)
		INT_SetDialog
		LISTBOX SELECT ROW:C912(COM_lb_Companies; 1; 0)
		LB_SetScroll(->COM_lb_Companies; 1)
		SD2_SetDiaryPopup
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[COMPANIES:2])
		
End case 
ERR_MethodTrackerReturn("FM:dAsk_Company"; $_t_oldMethodName)
