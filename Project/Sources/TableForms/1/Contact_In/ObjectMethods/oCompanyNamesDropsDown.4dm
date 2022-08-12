If (False:C215)
	//object Name: [CONTACTS]Contact_In.Pop-up%2FDrop-down List1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(COM_at_CompanyCodes;0)
	//ARRAY TEXT(COM_at_CompanyNames;0)
	//ARRAY TEXT(CON_at_AddressTypes;0)
	C_BOOLEAN:C305($_bo_NoEdit; CON_bo_CompanyDeletable; CON_bo_Editaddress)
	C_LONGINT:C283($_l_AddButtonBottom; $_l_AddButtonLeft; $_l_AddButtonRight; $_l_AddButtonTop; $_l_CoCodeBottom; $_l_CoCodeLeft; $_l_CoCodeRight; $_l_CoCodeTop; $_l_CoNameBottom; $_l_CoNameLeft; $_l_CoNameRight)
	C_LONGINT:C283($_l_CoNameTop; $_l_FindinArray; $_l_FormEvent; $_l_Index; $_l_Selected; $_l_SelectedRow; bAddComp2Contact)
	C_TEXT:C284($_t_AddressType; $_t_ButtonTitle; $_t_CompanyCode; $_t_oldMethodName; COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Country; COM_t_County; COM_t_PostalCode; COM_t_TelephoneNumberFormat; COM_t_Town)
	C_TEXT:C284(CON_t_CompanyAddress; CON_t_CompanyAdType; CON_t_CompanyArea; CON_t_CompanyCode; CON_t_CompanyFAX; CON_t_CompanyName; CON_t_CompanyTel; CON_t_CompanyTelephone; Con_T_Details; CON_t_ParentRecord; CON_t_SelectedCompanyCode)
	C_TEXT:C284(vArea; VDetails; vTel)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.Pop-up/Drop-down List1"; Form event code:C388)
//CON_t_CompanyName:=[COMPANIES]Company Name
//If (CON_t_CompanyName=Size of array(COM_at_CompanyNames))
$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Clicked:K2:4)
		
		CON_bo_Editaddress:=False:C215
		Case of 
			: (COM_at_CompanyNames{COM_at_CompanyNames}="Remove Company") & (CON_t_CompanyName#"")  //Section added august 2004 to replace button
				If (CON_t_SelectedCompanyCode#"") & (CON_bo_CompanyDeletable) & (Size of array:C274(COM_at_CompanyNames)>4)
					
					Gen_Confirm("Are you sure you wish to remove this person from "+CON_t_CompanyName+"?"; "Yes"; "No")
					
					If (OK=1)
						COM_at_CompanyNames:=1
						QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
						QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
						QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=CON_t_SelectedCompanyCode)
						[CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*)
						[CONTACTS_COMPANIES:145]Address_Status:5:=-1
						DB_SaveRecord(->[CONTACTS_COMPANIES:145])
						If ([CONTACTS:1]Company_Code:1=CON_t_SelectedCompanyCode)
							[CONTACTS:1]Company_Code:1:=""
							CON_t_ParentRecord:=""
						End if 
						//DELETE RECORD([CONTACTS_COMPANIES])
						CON_t_SelectedCompanyCode:=""
						QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
						QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
						CustList_PopUp
						If ([CONTACTS:1]Company_Code:1="")
						End if 
						
					End if 
				End if 
				
			: (COM_at_CompanyNames{COM_at_CompanyNames}="Add Address")
				//$_l_Selected:=Find in array(COM_at_CompanyCodes;CON_t_SelectedCompanyCode)
				//CON_t_CompanyName:=COM_at_CompanyNames{$_l_Selected}
				////CON_t_SelectedCompanyCode:=COM_at_CompanyCodes{$_l_Selected}
				//QUERY([CONTACTS_COMPANIES];[CONTACTS_COMPANIES]Contact_Code=[CONTACTS]Contact_Code;*)
				//QUERY([CONTACTS_COMPANIES]; & ;[CONTACTS_COMPANIES]Company_Code=CON_t_SelectedCompanyCode)
				
				//COM_t_AddressLine1:=""
				//COM_t_AddressLine2:=""
				//COM_t_Town:=""
				//COM_t_County:=""
				//COM_t_PostalCode:=""
				//COM_t_Country:=""
				//CON_t_CompanyArea:=""
				//CON_t_CompanyTelephone:=""
				//oCompanyNamesDropsDown
				OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCompanyName"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oContactAddress"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCONCompanyTel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCONCompanyFAX"; False:C215)
				//SET VISIBLE(BDeleteCompany;False)
				CON_bo_CompanyDeletable:=False:C215
				ARRAY TEXT:C222(CON_at_AddressTypes; 0)
				CON_GetAdressTypes(->CON_at_AddressTypes)
				
				OBJECT SET VISIBLE:C603(*; "oCON_Company@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCONCompany@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCON_Sub@"; False:C215)
				ContComp_SubLP
				CON_t_CompanyCode:=""  //[CONTACTS]COMPANIES'Company Code
				If (CON_t_CompanyCode#"")
					CON_t_CompanyName:=[COMPANIES:2]Company_Name:2
					Con_T_Details:=VDetails
					CON_t_CompanyArea:=vArea
					CON_t_CompanyTelephone:=vTel
					COM_t_AddressLine1:=[COMPANIES:2]Address_Line_one:3
					COM_t_AddressLine2:=[COMPANIES:2]Address_Line_two:4
					COM_t_Town:=[COMPANIES:2]Town_or_City:5
					COM_t_County:=[COMPANIES:2]County_or_State:6
					COM_t_PostalCode:=[COMPANIES:2]Postal_Code:7
					COM_t_Country:=[COMPANIES:2]Country:8
				End if 
				
				
				If (CON_t_CompanyCode="")  //bsw 24/05/04
					OBJECT SET TITLE:C194(*; "oCON_CompanyButton1"; "Cancel")
				Else 
					OBJECT SET TITLE:C194(*; "oCON_CompanyButton1"; "Update")
				End if 
				
				CREATE RECORD:C68([CONTACTS_COMPANIES:145])
				[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
				[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
				
				//Gen_SetobjectPositionRelativity (->[CONTACTS]Job_Title;->CON_t_CompanyCode;"";"";2;1;8)
				//Gen_SetobjectPositionRelativity (->CON_t_CompanyCode;->CON_t_CompanyName;"";"";-1;4;8)
				OBJECT GET COORDINATES:C663(*; "oCONCompanyCode"; $_l_CoCodeLeft; $_l_CoCodeTop; $_l_CoCodeRight; $_l_CoCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oCON_CompanyButton1"; $_l_AddButtonLeft; $_l_AddButtonTop; $_l_AddButtonRight; $_l_AddButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oCompanyName"; $_l_CoNameLeft; $_l_CoNameTop; $_l_CoNameRight; $_l_CoNameBottom)
				OBJECT SET COORDINATES:C1248(*; "oCompanyName"; $_l_CoCodeRight+5; $_l_CoNameTop; $_l_AddButtonLeft-5; $_l_CoNameBottom)
				
				
				
				OBJECT SET VISIBLE:C603(*; "OCON_COLABEL"; False:C215)
				OBJECT SET ENTERABLE:C238(COM_t_AddressLine1; False:C215)
				OBJECT SET ENTERABLE:C238(COM_t_AddressLine2; False:C215)
				OBJECT SET ENTERABLE:C238(COM_t_Town; False:C215)
				OBJECT SET ENTERABLE:C238(COM_t_County; False:C215)
				OBJECT SET ENTERABLE:C238(COM_t_PostalCode; False:C215)
				OBJECT SET ENTERABLE:C238(COM_t_Country; False:C215)
				OBJECT SET ENTERABLE:C238(*; "oCONCompanyCode"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCompanyName"; True:C214)
				Companies_vAT2(->COM_t_Country)
				CON_t_CompanyName:=""
				//OBJECT SET VISIBLE(*;"Picture2";False)
				OBJECT SET ENTERABLE:C238(CON_t_CompanyAdType; True:C214)
				GOTO OBJECT:C206(*; "oCONCompanyCode")
				//``
			: (COM_at_CompanyNames{COM_at_CompanyNames}="Edit Address") | (COM_at_CompanyNames{COM_at_CompanyNames}="Edit Address Type")
				TRACE:C157
				CON_bo_Editaddress:=True:C214
				$_t_CompanyCode:=CON_t_SelectedCompanyCode
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				
				FIRST RECORD:C50([CONTACTS_COMPANIES:145])
				For ($_l_Index; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
					If ([CONTACTS_COMPANIES:145]Company_Code:1=$_t_CompanyCode)
						$_t_AddressType:=[CONTACTS_COMPANIES:145]Address_Type:2
						$_l_Index:=99999
					Else 
						NEXT RECORD:C51([CONTACTS_COMPANIES:145])
					End if 
				End for 
				//like add this shows the address fields-but allready populated
				$_l_SelectedRow:=Find in array:C230(COM_at_CompanyCodes; $_t_CompanyCode)
				CON_t_CompanyName:=COM_at_CompanyNames{$_l_SelectedRow}
				CON_t_SelectedCompanyCode:=COM_at_CompanyCodes{$_l_SelectedRow}
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
				CON_t_CompanyName:=[COMPANIES:2]Company_Name:2
				OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCompanyName"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oContactAddress"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCONCompanyTel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCONCompanyFAX"; False:C215)
				//SET VISIBLE(BDeleteCompany;False)
				CON_bo_CompanyDeletable:=False:C215
				ARRAY TEXT:C222(CON_at_AddressTypes; 0)
				CON_GetAdressTypes(->CON_at_AddressTypes)
				
				OBJECT SET VISIBLE:C603(*; "oCON_Company@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCONCompany@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCON_Sub@"; False:C215)
				$_bo_NoEdit:=False:C215
				If (True:C214)  //bsw 24/05/04
					CON_t_CompanyName:=[COMPANIES:2]Company_Name:2
					CON_t_CompanyCode:=[COMPANIES:2]Company_Code:1
					If ($_t_AddressType="")
						If ([COMPANIES:2]Private:37) | (CON_t_CompanyCode="")
							$_t_AddressType:="Home"
						Else 
							If (CON_t_CompanyCode#"")
								$_t_AddressType:="Work"
								$_bo_NoEdit:=True:C214
							Else 
								$_t_AddressType:="Home"
							End if 
						End if 
						//$_l_FindinArray:=
					End if 
					CON_t_CompanyAdType:=$_t_AddressType
					CON_t_CompanyArea:=[COMPANIES:2]Area:11
					CON_t_CompanyTelephone:=[COMPANIES:2]Telephone:9
					CON_T_Details:=""
					COM_t_AddressLine1:=[COMPANIES:2]Address_Line_one:3
					COM_t_AddressLine2:=[COMPANIES:2]Address_Line_two:4
					COM_t_Town:=[COMPANIES:2]Telephone:9
					COM_t_County:=[COMPANIES:2]Country:8
					COM_t_PostalCode:=[COMPANIES:2]Postal_Code:7
					COM_t_Country:=[COMPANIES:2]Country:8
					
				End if 
				
				If (CON_t_CompanyCode="")  //bsw 24/05/04
					OBJECT SET TITLE:C194(*; "oCON_CompanyButton1"; "Cancel")
				Else 
					$_t_ButtonTitle:="Update"
					If ($_bo_NoEdit)
						$_t_ButtonTitle:="Cancel"
					End if 
					
					OBJECT SET TITLE:C194(*; "oCON_CompanyButton1"; $_t_ButtonTitle)
				End if 
				OBJECT GET COORDINATES:C663(*; "oCONCompanyCode"; $_l_CoCodeLeft; $_l_CoCodeTop; $_l_CoCodeRight; $_l_CoCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oCON_CompanyButton1"; $_l_AddButtonLeft; $_l_AddButtonTop; $_l_AddButtonRight; $_l_AddButtonBottom)
				OBJECT GET COORDINATES:C663(*; "oCompanyName"; $_l_CoNameLeft; $_l_CoNameTop; $_l_CoNameRight; $_l_CoNameBottom)
				OBJECT SET COORDINATES:C1248(*; "oCompanyName"; $_l_CoCodeRight+5; $_l_CoNameTop; $_l_AddButtonLeft-5; $_l_CoNameBottom)
				OBJECT SET VISIBLE:C603(*; "OCON_COLABEL"; False:C215)
				OBJECT SET ENTERABLE:C238(*; "oCONCompanyCode"; False:C215)
				OBJECT SET ENTERABLE:C238(*; "oCON_CompanyAddr1"; (CON_t_CompanyAdType="HOME"))
				OBJECT SET ENTERABLE:C238(*; "oCON_CompanyAddr2"; (CON_t_CompanyAdType="HOME"))
				OBJECT SET ENTERABLE:C238(*; "oCON_CompanyAddr3"; (CON_t_CompanyAdType="HOME"))
				OBJECT SET ENTERABLE:C238(*; "oCON_CompanyAddr4"; (CON_t_CompanyAdType="HOME"))
				OBJECT SET ENTERABLE:C238(*; "oCON_CompanyAddr5"; (CON_t_CompanyAdType="HOME"))
				OBJECT SET ENTERABLE:C238(*; "oCON_CompanyAddr6"; (CON_t_CompanyAdType="HOME"))
				If (False:C215)
					If (CON_t_CompanyAdType#"HOME")
						OBJECT SET ENTERABLE:C238(COM_t_AddressLine1; False:C215)
						OBJECT SET ENTERABLE:C238(COM_t_AddressLine2; False:C215)
						OBJECT SET ENTERABLE:C238(COM_t_Town; False:C215)
						OBJECT SET ENTERABLE:C238(COM_t_County; False:C215)
						OBJECT SET ENTERABLE:C238(COM_t_PostalCode; False:C215)
						OBJECT SET ENTERABLE:C238(COM_t_Country; False:C215)
					Else 
						OBJECT SET ENTERABLE:C238(COM_t_AddressLine1; True:C214)
						OBJECT SET ENTERABLE:C238(COM_t_AddressLine2; True:C214)
						OBJECT SET ENTERABLE:C238(COM_t_Town; True:C214)
						OBJECT SET ENTERABLE:C238(COM_t_County; True:C214)
						OBJECT SET ENTERABLE:C238(COM_t_PostalCode; True:C214)
						OBJECT SET ENTERABLE:C238(COM_t_Country; True:C214)
					End if 
				End if 
				Companies_vAT2(->COM_t_Country)
				OBJECT SET VISIBLE:C603(*; "oCompanyName"; True:C214)
				OBJECT SET ENTERABLE:C238(*; "oCON_CompanyAdType"; True:C214)
				GOTO OBJECT:C206(*; "oCONCompanyCode")
				
				
			Else 
				CON_t_CompanyName:=COM_at_CompanyNames{COM_at_CompanyNames}
				CON_t_SelectedCompanyCode:=COM_at_CompanyCodes{COM_at_CompanyNames}
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=CON_t_SelectedCompanyCode)
				CON_t_CompanyName:=[COMPANIES:2]Company_Name:2
				If ([COMPANIES:2]ADDRESS:60="")
					[COMPANIES:2]ADDRESS:60:=WS_BUILDADDRESS
				End if 
				
				CON_t_CompanyAddress:=[COMPANIES:2]ADDRESS:60
				CON_t_CompanyTel:=[COMPANIES:2]Telephone:9
				If (COM_t_TelephoneNumberFormat#"")
					OBJECT SET FORMAT:C236(*; "oCONCompanyTel"; "TEL: "+COM_t_TelephoneNumberFormat)
				End if 
				CON_t_CompanyFAX:=[COMPANIES:2]Fax:10
				If (COM_t_TelephoneNumberFormat#"")
					OBJECT SET FORMAT:C236(*; "oCONCompanyFAX"; "FAX: "+COM_t_TelephoneNumberFormat)
				End if 
				OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCompanyName"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oContactAddress"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCONCompanyTel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCONCompanyFAX"; True:C214)
				//SET VISIBLE(BDeleteCompany;True)
				CON_bo_CompanyDeletable:=True:C214
				OBJECT SET VISIBLE:C603(*; "oCON_Company@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCONCompany@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCON_Sub@"; True:C214)
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ:Contact_In,COM_at_CompanyNames"; $_t_oldMethodName)
