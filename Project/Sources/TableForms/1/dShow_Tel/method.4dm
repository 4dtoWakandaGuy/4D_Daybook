If (False:C215)
	//Table Form Method Name: [CONTACTS]dShow_Tel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2011 07:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	//ARRAY BOOLEAN(CON_lb_LBCont;0)
	//ARRAY LONGINT(TEL_al_TelephoneBlank;0)
	ARRAY TEXT:C222($_at_AddressTypes; 0)
	ARRAY TEXT:C222($_at_CompaniesCompanyCodes; 0)
	ARRAY TEXT:C222($_at_ContactsCompanyCodes; 0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(<>MultiCo; DB_bo_NoLoad)
	C_LONGINT:C283($_l_ArraySize; $_l_CompanyRow; $_l_event; $_l_FillIndex; $i; CON_l_BUT1; CON_l_But2; CON_l_BUT3; CON_l_BUT4; CON_l_BUT5; CON_l_BUT6)
	C_LONGINT:C283(CON_l_BUT7; CON_l_BUT8; CON_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; COM_t_TelephoneNumberFormat; CON_t_COL1; CON_t_COL2; CON_t_COL3; CON_t_COL4; CON_t_COL5; CON_t_COL6; CON_t_COL7; CON_t_COL8; CON_t_COL9)
	C_TEXT:C284(CON_t_HED1; CON_t_HED2; CON_t_HED3; CON_t_HED4; CON_t_HED5; CON_t_HED6; CON_t_HED7; CON_t_HED8; CON_t_HED9; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_CurrentFormUsage3; vContName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].dShow_Tel"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		OpenHelp(Table:C252(->[CONTACTS:1]); "dShow_Tel")
		WS_AutoscreenSize(3; 215; 377)
		If ((Records in selection:C76([CONTACTS:1])=0) | (DB_t_CurrentFormUsage2="Comp"))
			vContName:=[COMPANIES:2]Company_Name:2
			Array_LCx(2)
			$i:=1
			GEN_at_RecordCode{$i}:="COMPANY"
			GEN_at_Name{$i}:="Telephone"
			GEN_at_Identity{$i}:=[COMPANIES:2]Telephone:9
			OBJECT SET FORMAT:C236(GEN_at_Identity; "")
			If ([COMPANIES:2]Country:8#"")
				If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
					QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
					COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
				End if 
			End if 
			If (COM_t_TelephoneNumberFormat#"")
				OBJECT SET FORMAT:C236(GEN_at_Identity; COM_t_TelephoneNumberFormat)
			End if 
			$i:=$i+1
			GEN_at_RecordCode{$i}:=""
			GEN_at_Name{$i}:="Fax"
			GEN_at_Identity{$i}:=[COMPANIES:2]Fax:10
		Else 
			
			
			vContName:=[CONTACTS:1]Contact_Name:31
			If (<>MultiCo)
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				Array_LCx((Records in selection:C76([CONTACTS_COMPANIES:145])*2)+4)
				FIRST RECORD:C50([CONTACTS_COMPANIES:145])
				$i:=1
				SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Company_Code:1; $_at_ContactsCompanyCodes; [CONTACTS_COMPANIES:145]Address_Type:2; $_at_AddressTypes)
				QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_ContactsCompanyCodes)
				SELECTION TO ARRAY:C260([COMPANIES:2]Company_Name:2; GEN_at_Name; [COMPANIES:2]Telephone:9; GEN_at_Identity; [COMPANIES:2]Fax:10; GEN_at_Identity; [COMPANIES:2]Company_Code:1; $_at_CompaniesCompanyCodes)
				$_l_ArraySize:=Size of array:C274(GEN_at_Name)
				
				ARRAY TEXT:C222(GEN_at_RecordCode; 0)
				ARRAY TEXT:C222(GEN_at_RecordCode; $_l_ArraySize)
				
				For ($_l_FillIndex; 1; $_l_ArraySize)
					$_l_CompanyRow:=Find in array:C230($_at_ContactsCompanyCodes; $_at_CompaniesCompanyCodes{$_l_FillIndex})
					If ($_l_CompanyRow>0)  //by deninition it must be..but i like to be safe
						
						If ($_at_AddressTypes{$_l_CompanyRow}="")
							GEN_at_RecordCode{$_l_FillIndex}:="COMPANY"
						Else 
							GEN_at_RecordCode{$_l_FillIndex}:=$_at_AddressTypes{$_l_CompanyRow}
						End if 
					End if 
				End for 
				If (False:C215)
					While (Not:C34(End selection:C36([CONTACTS_COMPANIES:145])))
						
						RELATE ONE:C42([CONTACTS_COMPANIES:145]Company_Code:1)
						If ([CONTACTS_COMPANIES:145]Address_Type:2="")
							
							If ($i<=Size of array:C274(GEN_at_RecordCode))
								GEN_at_RecordCode{$i}:="COMPANY"
							Else 
								APPEND TO ARRAY:C911(GEN_at_RecordCode; "COMPANY")
								APPEND TO ARRAY:C911(GEN_at_Name; "")
								APPEND TO ARRAY:C911(GEN_at_Identity; "")
							End if 
						Else 
							GEN_at_RecordCode{$i}:=[CONTACTS_COMPANIES:145]Address_Type:2
							If ($i<=Size of array:C274(GEN_at_RecordCode))
								GEN_at_RecordCode{$i}:=[CONTACTS_COMPANIES:145]Address_Type:2
							Else 
								APPEND TO ARRAY:C911(GEN_at_RecordCode; [CONTACTS_COMPANIES:145]Address_Type:2)
								APPEND TO ARRAY:C911(GEN_at_Name; "")
								APPEND TO ARRAY:C911(GEN_at_Identity; "")
							End if 
						End if 
						If ($i<=Size of array:C274(GEN_at_Name))
							GEN_at_Name{$i}:=[COMPANIES:2]Company_Name:2
						Else 
							APPEND TO ARRAY:C911(GEN_at_RecordCode; "")
							APPEND TO ARRAY:C911(GEN_at_Name; [COMPANIES:2]Company_Name:2)
							APPEND TO ARRAY:C911(GEN_at_Identity; "")
						End if 
						If ($i<=Size of array:C274(GEN_at_Identity))
							GEN_at_Identity{$i}:=[COMPANIES:2]Telephone:9
						Else 
							APPEND TO ARRAY:C911(GEN_at_RecordCode; "")
							APPEND TO ARRAY:C911(GEN_at_Name; "")
							APPEND TO ARRAY:C911(GEN_at_Identity; [COMPANIES:2]Telephone:9)
						End if 
						$i:=$i+1
						//GEN_at_RecordCode{$i}:=""
						If ($i<=Size of array:C274(GEN_at_Name))
							GEN_at_Name{$i}:="Fax"
						Else 
							APPEND TO ARRAY:C911(GEN_at_RecordCode; "")
							APPEND TO ARRAY:C911(GEN_at_Name; "Fax")
							APPEND TO ARRAY:C911(GEN_at_Identity; [COMPANIES:2]Fax:10)
						End if 
						If ($i<=Size of array:C274(GEN_at_Identity))
							GEN_at_Identity{$i}:=[COMPANIES:2]Fax:10
						Else 
							APPEND TO ARRAY:C911(GEN_at_RecordCode; "")
							APPEND TO ARRAY:C911(GEN_at_Name; "")
							APPEND TO ARRAY:C911(GEN_at_Identity; [COMPANIES:2]Fax:10)
						End if 
						
						$i:=$i+1
						NEXT RECORD:C51([CONTACTS_COMPANIES:145])
					End while 
				End if 
			Else 
				Array_LCx(6)
				$i:=1
				RELATE ONE:C42([CONTACTS:1]Company_Code:1)
				If ($i<=Size of array:C274(GEN_at_RecordCode))
					GEN_at_RecordCode{$i}:="COMPANY"
					GEN_at_Name{$i}:=[COMPANIES:2]Company_Name:2
					GEN_at_Identity{$i}:=[COMPANIES:2]Telephone:9
					
				Else 
					APPEND TO ARRAY:C911(GEN_at_RecordCode; "COMPANY")
					APPEND TO ARRAY:C911(GEN_at_Name; [COMPANIES:2]Company_Name:2)
					APPEND TO ARRAY:C911(GEN_at_Identity; [COMPANIES:2]Telephone:9)
				End if 
				$i:=$i+1
				If ($i<=Size of array:C274(GEN_at_RecordCode))
					GEN_at_RecordCode{$i}:=""
					GEN_at_Name{$i}:="Fax"
					GEN_at_Identity{$i}:=[COMPANIES:2]Fax:10
					
				Else 
					APPEND TO ARRAY:C911(GEN_at_RecordCode; "")
					APPEND TO ARRAY:C911(GEN_at_Name; "Fax")
					APPEND TO ARRAY:C911(GEN_at_Identity; [COMPANIES:2]Fax:10)
				End if 
				
				$i:=$i+1
			End if 
			If ($i<=Size of array:C274(GEN_at_RecordCode))
				GEN_at_RecordCode{$i}:=""
				GEN_at_Name{$i}:=""
				GEN_at_Identity{$i}:=""
				
			Else 
				APPEND TO ARRAY:C911(GEN_at_RecordCode; "")
				APPEND TO ARRAY:C911(GEN_at_Name; "")
				APPEND TO ARRAY:C911(GEN_at_Identity; "")
			End if 
			
			$i:=$i+1
			If ($i<=Size of array:C274(GEN_at_RecordCode))
				GEN_at_RecordCode{$i}:="CONTACT"
				GEN_at_Name{$i}:="Extension/Direct"
				GEN_at_Identity{$i}:=[CONTACTS:1]Extn:9
				
			Else 
				APPEND TO ARRAY:C911(GEN_at_RecordCode; "Contact")
				APPEND TO ARRAY:C911(GEN_at_Name; "Extension/Direct")
				APPEND TO ARRAY:C911(GEN_at_Identity; [CONTACTS:1]Extn:9)
			End if 
			
			$i:=$i+1
			If ($i<=Size of array:C274(GEN_at_RecordCode))
				GEN_at_RecordCode{$i}:=""
				GEN_at_Name{$i}:="Mobile"
				GEN_at_Identity{$i}:=[CONTACTS:1]Mobile:12
				
			Else 
				APPEND TO ARRAY:C911(GEN_at_RecordCode; "")
				APPEND TO ARRAY:C911(GEN_at_Name; "Mobile")
				APPEND TO ARRAY:C911(GEN_at_Identity; [CONTACTS:1]Mobile:12)
			End if 
			
			$i:=$i+1
			If ($i<=Size of array:C274(GEN_at_RecordCode))
				GEN_at_RecordCode{$i}:=""
				GEN_at_Name{$i}:="Direct Fax"
				GEN_at_Identity{$i}:=[CONTACTS:1]Fax:19
				
			Else 
				APPEND TO ARRAY:C911(GEN_at_RecordCode; "")
				APPEND TO ARRAY:C911(GEN_at_Name; "Direct Fax")
				APPEND TO ARRAY:C911(GEN_at_Identity; [CONTACTS:1]Fax:19)
			End if 
			
		End if 
		Array_LCStart
		ARRAY LONGINT:C221(TEL_al_TelephoneBlank; Size of array:C274(GEN_at_Identity))
		
		LB_SetupListbox(->CON_lb_LBCont; "CON_t"; "CON_L"; 1; ->GEN_at_RecordCode; ->GEN_at_Name; ->GEN_at_Identity)
		LB_SetColumnHeaders(->CON_lb_LBCont; "CON_L"; 1; "Code"; "Name"; "Next")
		
		LB_SetColumnWidths(->CON_lb_LBCont; "CON_t"; 1; 87; 187; 88)
		
		LB_SetEnterable(->CON_lb_LBCont; False:C215; 0)
		LB_SetScroll(->CON_lb_LBCont; -3; -2)
		LB_SETENTRYOPTIONS
		
		LB_StyleSettings(->CON_lb_LBCont; "Black"; 9; "CON_t"; ->[ACCOUNTS:32])
		INT_SetDialog
		
	: ($_l_event=On Outside Call:K2:11)
		
		In_ButtdCall(->[CONTACTS:1])
		
End case 
ERR_MethodTrackerReturn("FM:dShow_Tel"; $_t_oldMethodName)
