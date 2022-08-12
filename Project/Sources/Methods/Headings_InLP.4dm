//%attributes = {}
If (False:C215)
	//Project Method Name:      Headings_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  05/03/2011 05:12 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACB_lb_SubHeadings;0)
	ARRAY LONGINT:C221($_al_ObjectValues; 0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY REAL(ACC_ar_Group1Totals;0)
	//ARRAY REAL(ACC_ar_Group2Totals;0)
	//ARRAY REAL(ACC_ar_Group3Totals;0)
	ARRAY TEXT:C222($_at_HeadingCodes; 0)
	ARRAY TEXT:C222($_at_ObjectValues; 0)
	//ARRAY TEXT(HED_at_Group;0)
	//ARRAY TEXT(HED_at_Group1;0)
	//ARRAY TEXT(HED_at_Group1Codes;0)
	//ARRAY TEXT(HED_at_Group2;0)
	//ARRAY TEXT(HED_at_Group2Codes;0)
	//ARRAY TEXT(HED_at_Group3;0)
	//ARRAY TEXT(HED_at_Group3Codes;0)
	//ARRAY TEXT(HED_at_Group4;0)
	//ARRAY TEXT(HED_at_Group4Codes;0)
	//ARRAY TEXT(HED_at_GroupCodes;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; Head_bo_GroupsLoaded; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_CurrentLevel; $_l_Event; $_l_HeadingLevelDownProcess; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; HED_l_BUT1; HED_l_BUT10; HED_l_BUT11; HED_l_BUT12)
	C_LONGINT:C283(HED_l_BUT13; HED_l_BUT14; HED_l_BUT15; HED_l_BUT16; HED_l_BUT17; HED_l_BUT18; HED_l_BUT19; HED_l_BUT2; HED_l_BUT20; HED_l_BUT21; HED_l_BUT22)
	C_LONGINT:C283(HED_l_BUT23; HED_l_BUT24; HED_l_BUT25; HED_l_BUT26; HED_l_BUT27; HED_l_BUT3; HED_l_BUT4; HED_l_BUT5; HED_l_BUT6; HED_l_BUT7; HED_l_BUT8)
	C_LONGINT:C283(HED_l_BUT9; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord)
	C_OBJECT:C1216(Head_obj_HeadingDownData)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; oACC_COL1; oACC_COL10; oACC_COL11; oACC_COL12; oACC_COL13; oACC_COL14; oACC_COL15)
	C_TEXT:C284(oACC_COL16; oACC_COL17; oACC_COL18; oACC_COL19; oACC_COL2; oACC_COL20; oACC_COL21; oACC_COL22; oACC_COL23; oACC_COL24; oACC_COL25)
	C_TEXT:C284(oACC_COL26; oACC_COL27; oACC_COL3; oACC_COL4; oACC_COL5; oACC_COL6; oACC_COL7; oACC_COL8; oACC_COL9; oACC_HED1; oACC_HED10)
	C_TEXT:C284(oACC_HED11; oACC_HED12; oACC_HED13; oACC_HED14; oACC_HED15; oACC_HED16; oACC_HED17; oACC_HED18; oACC_HED19; oACC_HED2; oACC_HED20)
	C_TEXT:C284(oACC_HED21; oACC_HED22; oACC_HED23; oACC_HED24; oACC_HED25; oACC_HED26; oACC_HED27; oACC_HED3; oACC_HED4; oACC_HED5; oACC_HED6)
	C_TEXT:C284(oACC_HED7; oACC_HED8; oACC_HED9; PAL_BUTTON)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Headings_InLP")
$_l_Event:=Form event code:C388
Minor_LP(->[HEADINGS:84]Heading_Code:1; ->[HEADINGS:84]Heading_Name:2; ->[HEADINGS:84]; "Headings"; "1 2 3"+(" 5"*(Num:C11([HEADINGS:84]Heading_Code:1#"G@"))); ""; "")


Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		DB_SetInputFormMenu(Table:C252(->[HEADINGS:84]); "Heading_in")
		If (Records in selection:C76([HEADINGS:84])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		Head_bo_GroupsLoaded:=False:C215
		$_l_HeadingLevelDownProcess:=New process:C317("HEAD_getLevelDown"; 120000; "Get Subheadings"; Current process:C322; [HEADINGS:84]Heading_Code:1)
		
		Repeat 
			DelayTicks(2)
		Until (Head_bo_GroupsLoaded) | (Process state:C330($_l_HeadingLevelDownProcess)=Aborted:K13:1)
		ARRAY TEXT:C222(HED_at_Group1; 0)
		ARRAY TEXT:C222(HED_at_Group1Codes; 0)
		//ARRAY REAL(ACC_ar_Group1Totals;0)
		ARRAY TEXT:C222(HED_at_Group2; 0)
		ARRAY TEXT:C222(HED_at_Group2Codes; 0)
		//ARRAY REAL(ACC_ar_Group2Totals;0)
		ARRAY TEXT:C222(HED_at_Group3; 0)
		ARRAY TEXT:C222(HED_at_Group3Codes; 0)
		//ARRAY REAL(ACC_ar_Group3Totals;0)
		ARRAY TEXT:C222(HED_at_Group4; 0)
		ARRAY TEXT:C222(HED_at_Group4Codes; 0)
		//ARRAY REAL(ACC_ar_Group4Totals;0)
		//ALL RECORDS([ACCOUNTS])
		ARRAY TEXT:C222($_at_HeadingCodes; 0)
		
		OB GET PROPERTY NAMES:C1232(Head_obj_HeadingDownData; $_at_ObjectValues; $_al_ObjectValues)
		If (Find in array:C230($_at_ObjectValues; "Current Level")>0)
			$_l_CurrentLevel:=OB Get:C1224(Head_obj_HeadingDownData; "Current Level")
			OB GET ARRAY:C1229(Head_obj_HeadingDownData; "Group 1"; HED_at_Group1)
			OB GET ARRAY:C1229(Head_obj_HeadingDownData; "Group 1Codes"; HED_at_Group1Codes)
			OB GET ARRAY:C1229(Head_obj_HeadingDownData; "Group 2"; HED_at_Group2)
			OB GET ARRAY:C1229(Head_obj_HeadingDownData; "Group 2Codes"; HED_at_Group2Codes)
			OB GET ARRAY:C1229(Head_obj_HeadingDownData; "Group 3"; HED_at_Group3)
			OB GET ARRAY:C1229(Head_obj_HeadingDownData; "Group 3Codes"; HED_at_Group3Codes)
			OB GET ARRAY:C1229(Head_obj_HeadingDownData; "Group 4"; HED_at_Group4)
			OB GET ARRAY:C1229(Head_obj_HeadingDownData; "Group 4Codes"; HED_at_Group4Codes)
			
			Case of 
				: ($_l_CurrentLevel=4)
					
					//LB_SetupListbox (->ACB_lb_SubHeadings;"oCCM";"ACC_L";1;->HED_at_Group1Codes;->HED_at_Group1;->ACC_ar_Group1Totals;->HED_at_Group2Codes;->HED_at_Group2;->ACC_ar_Group2Totals;->HED_at_GroupCodes;->HED_at_Group;->ACC_ar_Group3Totals;
					LB_SetupListbox(->ACB_lb_SubHeadings; "oCCM"; "ACC_L"; 1; ->HED_at_Group4Codes; ->HED_at_Group4; ->HED_at_Group3Codes; ->HED_at_Group3; ->HED_at_Group2Codes; ->HED_at_Group2; ->HED_at_Group1Codes; ->HED_at_Group1)
					LB_SetColumnHeaders(->ACB_lb_SubHeadings; "ACC_L"; 1; "Codes"; "Names"; "Group Code"; "Group"; "Group Code"; "Group"; "Heading Code"; "Heading")
					LB_SetColumnWidths(->ACB_lb_SubHeadings; "oCCM"; 1; 80; 290; 80; 290; 80; 290; 80; 290)
					
				: ($_l_CurrentLevel=3)
					
					LB_SetupListbox(->ACB_lb_SubHeadings; "oCCM"; "ACC_L"; 1; ->HED_at_Group3Codes; ->HED_at_Group3; ->HED_at_Group2Codes; ->HED_at_Group2; ->HED_at_Group1Codes; ->HED_at_Group1)
					LB_SetColumnHeaders(->ACB_lb_SubHeadings; "ACC_L"; 1; "Group Code"; "Group"; "Group Code"; "Group"; "Heading Code"; "Heading")
					LB_SetColumnWidths(->ACB_lb_SubHeadings; "oCCM"; 1; 80; 290; 80; 290; 80; 290)
					
				: ($_l_CurrentLevel=2)
					LB_SetupListbox(->ACB_lb_SubHeadings; "oCCM"; "ACC_L"; 1; ->HED_at_Group2Codes; ->HED_at_Group2; ->HED_at_Group1Codes; ->HED_at_Group1)
					LB_SetColumnHeaders(->ACB_lb_SubHeadings; "ACC_L"; 1; "Group Code"; "Group"; "Heading Code"; "Heading")
					LB_SetColumnWidths(->ACB_lb_SubHeadings; "oCCM"; 1; 80; 290; 80; 290)
					
				: ($_l_CurrentLevel=1)
					LB_SetupListbox(->ACB_lb_SubHeadings; "oCCM"; "ACC_L"; 1; ->HED_at_Group1Codes; ->HED_at_Group1)
					LB_SetColumnHeaders(->ACB_lb_SubHeadings; "ACC_L"; 1; "Heading Code"; "Heading")
					LB_SetColumnWidths(->ACB_lb_SubHeadings; "oCCM"; 1; 80; 290)
					
					
				: ($_l_CurrentLevel=0)
					
					LB_SetupListbox(->ACB_lb_SubHeadings; "oCCM"; "ACC_L"; 1; ->HED_at_Group1Codes; ->HED_at_Group1)
					LB_SetColumnHeaders(->ACB_lb_SubHeadings; "ACC_L"; 1; "Heading Code"; "Heading")
					
					
					
			End case 
			//Card Type";"Issued by";"Card Number";'"Expiry Date";"";"";"")
			
			
			//`109;162;59;0;0;0)
			LB_SetScroll(->ACB_lb_SubHeadings; -3; -2)
			
			
			
			LB_SetEnterable(->ACB_lb_SubHeadings; False:C215; 0; "")
			
			LBi_InclSetupJustStyle(->ACB_lb_SubHeadings)
			LB_Setdividers(->ACB_lb_SubHeadings; Black:K11:16; 0)
			
			LB_StyleSettings(->ACB_lb_SubHeadings; "Black"; 9; "COM_t"; ->[ACCOUNTS:32])
			
			LBI_Scrollonresize(->ACB_lb_SubHeadings)
			
		End if 
		
		
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([HEADINGS:84]Level_Up_Code:4))
				[HEADINGS:84]Level_Up_Code:4:=Uppercase:C13([HEADINGS:84]Level_Up_Code:4)
				If ([HEADINGS:84]Level_Up_Code:4#"")
					If (([HEADINGS:84]Heading_Code:1#([HEADINGS:84]Level_Up_Code:4+"@")) | ((Length:C16([HEADINGS:84]Level_Up_Code:4))>=(Length:C16([HEADINGS:84]Heading_Code:1))))
						Gen_Alert("The Level -1 Code must be a the same as the Heading Code less final"+" digit(s)"; "Try again")
						REJECT:C38([HEADINGS:84]Level_Up_Code:4)
					End if 
				End if 
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([HEADINGS:84]Group_Code:5))
				[HEADINGS:84]Group_Code:5:=Uppercase:C13([HEADINGS:84]Group_Code:5)
				DB_bo_RecordModified:=True:C214
				
				
		End case 
	: ($_l_Event=On Outside Call:K2:11)
		DB_l_ButtonClickedFunction:=0
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[HEADINGS:84]); "Heading_in")
					
				End if 
				BAR_t_Button:=""
				
				
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[HEADINGS:84]); "Heading_in")
		If (Records in selection:C76([HEADINGS:84])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[HEADINGS:84]); "Heading_in")
		If (Records in selection:C76([HEADINGS:84])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
End case 
ERR_MethodTrackerReturn("Headings_InLP"; $_t_oldMethodName)