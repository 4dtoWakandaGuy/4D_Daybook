If (False:C215)
	//Table Form Method Name: Object Name:      [CONTACTS].dSWContact
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
	//C_UNKNOWN(Address_Status)
	//ARRAY BOOLEAN(CON_LB_Companies;0)
	//ARRAY TEXT(a03Stri1;0)
	//ARRAY TEXT(a03Stri2;0)
	//ARRAY TEXT(a03Stri3;0)
	//ARRAY TEXT(a03Stri4;0)
	//ARRAY TEXT(a03Stri5;0)
	//ARRAY TEXT(a03Stri6;0)
	//ARRAY TEXT(a03Stri7;0)
	C_BOOLEAN:C305(DB_bo_FontsInited; DB_bo_NoLoad)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; $_l_event; $_l_LineNumber; COM_l_BUT1; COM_l_BUT3; COM_l_BUT5; COM_l_BUT6; COM_l_BUT7; COM_l_BUT8; COM_l_BUT9)
	C_LONGINT:C283(COM_L2; CON_l_SelectRow; INV_l_BUT4)
	C_TEXT:C284(<>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; <>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_oldMethodName; oCompanies_COL1; oCompanies_COL2; oCompanies_COL3; oCompanies_COL4)
	C_TEXT:C284(oCompanies_COL5; oCompanies_COL6; oCompanies_COL7; oCompanies_COL8; oCompanies_COL9; oCompanies_HED1; oCompanies_HED2; oCompanies_HED3; oCompanies_HED4; oCompanies_HED5; oCompanies_HED6)
	C_TEXT:C284(oCompanies_HED7; oCompanies_HED8; oCompanies_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].dSWContact"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CONTACTS:1]); "dSWContact")
		CON_l_SelectRow:=0
		//LBi_ArrDef03 
		LBI_AddDef07to99(3)
		
		LBI_ArrayDefPic(3)
		LBI_arrayDefTime(3)
		$_l_LineNumber:=1
		QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
		QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		If (Records in selection:C76([CONTACTS_COMPANIES:145])>0)
			While (Not:C34(End selection:C36([CONTACTS_COMPANIES:145])))
				MESSAGES OFF:C175
				If ($_l_LineNumber=1)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1; *)
					$_l_LineNumber:=2
				Else 
					QUERY:C277([COMPANIES:2];  | ; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1; *)
				End if 
				NEXT RECORD:C51([CONTACTS_COMPANIES:145])
			End while 
			QUERY:C277([COMPANIES:2])
			MESSAGES ON:C181
		Else 
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
		End if 
		If (Gen_CheckFieldToArray(->[COMPANIES:2]Company_Code:1; ->a03Stri1; ->[COMPANIES:2]Company_Name:2; ->a03Stri2; ->[COMPANIES:2]Address_Line_one:3; ->a03Stri3; ->[COMPANIES:2]Town_or_City:5; ->a03Stri4; ->[COMPANIES:2]County_or_State:6; ->a03Stri5; ->[COMPANIES:2]Postal_Code:7; ->a03Stri6; ->[COMPANIES:2]Country:8; ->a03Stri7))
			
			
			SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; a03Stri1; [COMPANIES:2]Company_Name:2; a03Stri2; [COMPANIES:2]Address_Line_one:3; a03Stri3; [COMPANIES:2]Town_or_City:5; a03Stri4; [COMPANIES:2]County_or_State:6; a03Stri5; [COMPANIES:2]Postal_Code:7; a03Stri6; [COMPANIES:2]Country:8; a03Stri7)
		Else 
			Gen_Alert("There is an error in 'dswContact' please report this to the Daybook helpdesk")
		End if 
		
		
		
		
		
		LB_SetupListbox(->CON_LB_Companies; "oCompanies"; "COM_L"; 1; ->a03Stri1; ->a03Stri2; ->a03Stri3; ->a03Stri4; ->a03Stri5; ->a03Stri6; ->a03Stri7)
		LB_SetColumnHeaders(->CON_LB_Companies; "COM_L"; 1; "Code"; "Name"; "Address 1"; <>DB_t_TownLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_CountryLabel)
		LB_SetColumnWidths(->CON_LB_Companies; "oCompanies"; 1; 90; 120; 100; 90; 90; 60; 900)
		LB_SetScroll(->CON_LB_Companies; -3; -2)
		If (Not:C34(DB_bo_FontsInited))
			DB_SetDefaultFonts
		End if 
		LB_SETFONT(->CON_LB_Companies; "oCompanies"; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize; 0)
		LB_SETFONT(->CON_LB_Companies; "oCompanies"; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize; 0)
		LB_Setdividers(->CON_LB_Companies; 0; 4)  //Both on
		LB_Setdividers(->CON_LB_Companies; Light grey:K11:13; 32)  //Both black
		LB_SetColours(->CON_LB_Companies; Black:K11:16; Grey:K11:15; Light grey:K11:13)
		
		
		
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:dSWContact"; $_t_oldMethodName)
