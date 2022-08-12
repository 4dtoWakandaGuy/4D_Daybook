If (False:C215)
	//object Name: [CONTACTS]Contact_In.oCON_CompanyButton1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(xCancel)
	//C_UNKNOWN(xNext)
	//ARRAY TEXT(COM_at_CompanyCodes;0)
	//ARRAY TEXT(COM_at_CompanyNames;0)
	C_BOOLEAN:C305($_bo_AddAddress; $_bo_PersonalAddress; CON_bo_CompanyDeletable; CON_bo_Editaddress)
	C_LONGINT:C283($_l_AddButtonBottom; $_l_AddButtonLeft; $_l_AddButtonRight; $_l_AddButtonTop; $_l_BUttonBottom; $_l_BUttonLeft; $_l_BUttonRight; $_l_BUttonTop; $_l_CoCodeBottom; $_l_CoCodeLeft; $_l_CoCodeRight)
	C_LONGINT:C283($_l_CoCodeTop; $_l_CoDDBottom; $_l_CoDDLeft; $_l_CoDDRight; $_l_CoDDTop; $_l_CoNameBottom; $_l_CoNameLeft; $_l_CoNameTop; $_l_Nul; $_l_ObjectBottom; $_l_ObjectBottom2)
	C_LONGINT:C283($_l_ObjectBottom3; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectLeft3; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectTop; $_l_ObjectTop2; $_l_ObjectTop3; $_l_Position)
	C_LONGINT:C283(bAddComp2Contact)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Country; COM_t_County; COM_t_PostalCode; COM_t_TelephoneNumberFormat; COM_t_Town; CON_t_CoAreaCode; CON_t_CompanyAddress)
	C_TEXT:C284(CON_t_CompanyAdType; CON_t_CompanyCode; CON_t_CompanyFAX; CON_t_CompanyName; CON_t_CompanyTel; CON_t_CompanyTelephone; CON_t_NewlyAddedCompCode; CON_t_ParentRecord; CON_t_SelectedCompanyCode)
End if 
//Code Starts Here
TRACE:C157
$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.oCON_CompanyButton1"; Form event code:C388)
If (CON_t_CompanyCode#"")
	QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
	QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Company_Code:1=CON_t_CompanyCode; *)
	QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
	If (Records in selection:C76([CONTACTS_COMPANIES:145])=0)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=CON_t_CompanyCode)
		If ([COMPANIES:2]Private:37) | ([COMPANIES:2]Company_Name:2="")
			//THIS IS A PERSONAL ADDRESS
			$_bo_PersonalAddress:=True:C214
		End if 
		If ($_bo_PersonalAddress)
			If ([CONTACTS:1]Company_Code:1#"") & ([CONTACTS:1]Company_Code:1#CON_t_CompanyCode)
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Type:2="Home"; *)
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				If (Records in selection:C76([CONTACTS_COMPANIES:145])>0)
					//we already have a personal address for this person.
					If (Records in selection:C76([CONTACTS_COMPANIES:145])=1)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
						Gen_Confirm3("Change home address or add additional home address?."+Char:C90(13)+"Current home address is:"+Char:C90(13)+[COMPANIES:2]ADDRESS:60; "Change"; "Add"; "Cancel")
						Case of 
							: (xNext=1)  //cancel
								$_bo_AddAddress:=False:C215
								
							: (xCancel=1)  //Add
								$_bo_AddAddress:=True:C214
							Else 
								//Change-remove from the current home address
								[CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*)
								[CONTACTS_COMPANIES:145]Address_Status:5:=-1
								DB_SaveRecord(->[CONTACTS_COMPANIES:145])
								If ([CONTACTS:1]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
									[CONTACTS:1]Company_Code:1:=CON_t_CompanyCode
								End if 
								$_bo_AddAddress:=True:C214
						End case 
						
					Else 
						//multiple home addresses
						Gen_Confirm("This person already has multiple home addresses. Do you wish to add another or manage which ones to keep?"; "Review"; "Add")
						If (OK=1)
							//Here display the list of addresses in a window which the user can delete others from if required.
							OBJECT GET COORDINATES:C663(Self:C308->; $_l_BUttonLeft; $_l_BUttonTop; $_l_BUttonRight; $_l_BUttonBottom)
							$_bo_AddAddress:=ContactReviewAddresses("Home"; [CONTACTS:1]Contact_Code:2; CON_t_CompanyCode; $_l_BUttonLeft; $_l_BUttonTop)
							
						Else 
							//Here just add the address
							$_bo_AddAddress:=True:C214
						End if 
						OK:=1
						
					End if 
				Else 
					$_bo_AddAddress:=True:C214
				End if 
			Else 
				$_bo_AddAddress:=True:C214
			End if 
			If ($_bo_AddAddress)
				CREATE RECORD:C68([CONTACTS_COMPANIES:145])
				[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
				[CONTACTS_COMPANIES:145]Address_Type:2:="Home"
				[CONTACTS_COMPANIES:145]Company_Code:1:=CON_t_CompanyCode
				[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
			End if 
			///
			
			OBJECT SET VISIBLE:C603(*; "oCON_CompanyLab1"; False:C215)
			OBJECT SET VISIBLE:C603(*; "OCON_COLABEL"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oCONCompanyCode"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCompanyName"; True:C214)
			OBJECT GET COORDINATES:C663(*; "OCON_COLABEL"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oCompanyNamesDropsDown"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT GET COORDINATES:C663(*; "oCON_CompanyButton1"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
			OBJECT SET COORDINATES:C1248(*; "oCompanyNamesDropsDown"; $_l_ObjectRight+9; $_l_ObjectTop2; $_l_ObjectLeft3-5; $_l_ObjectBottom2)
			OBJECT SET COORDINATES:C1248(*; "oCompanyName"; $_l_ObjectRight+9; $_l_ObjectTop2; $_l_ObjectLeft3-(5+17); $_l_ObjectBottom2)
			CustList_PopUp
			
			COM_t_AddressLine1:=""
			COM_t_AddressLine2:=""
			COM_t_Town:=""
			COM_t_County:=""
			COM_t_PostalCode:=""
			COM_t_Country:=""
			$_l_Position:=Find in array:C230(COM_at_CompanyCodes; CON_t_CompanyCode)
			If ($_l_Position>0)
				CON_t_SelectedCompanyCode:=CON_t_CompanyCode
				COM_at_CompanyNames:=$_l_Position
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
				
			End if 
			
			
		Else 
			//this is not a personal address
			//we are adding this person to a company.
			If ([CONTACTS:1]Company_Code:1#"") & ([CONTACTS:1]Company_Code:1#CON_t_CompanyCode)
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Type:2#"Home"; *)  //all company addresses
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				If (Records in selection:C76([CONTACTS_COMPANIES:145])>0)
					Case of 
						: (Records in selection:C76([CONTACTS_COMPANIES:145])=1)
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
							Gen_Confirm3("Change company or add to an additional company? "+Char:C90(13)+"Current company is:"+Char:C90(13)+[COMPANIES:2]Company_Name:2; "Change"; "Add"; "Cancel")
							Case of 
								: (xNext=1)  //cancel
									$_bo_AddAddress:=False:C215
									
								: (xCancel=1)  //Add
									$_bo_AddAddress:=True:C214
								Else 
									//Change-remove from the current home address
									[CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*)
									[CONTACTS_COMPANIES:145]Address_Status:5:=-1
									DB_SaveRecord(->[CONTACTS_COMPANIES:145])
									If ([CONTACTS:1]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
										[CONTACTS:1]Company_Code:1:=CON_t_CompanyCode
									End if 
									$_bo_AddAddress:=True:C214
							End case 
							
							
						: (Records in selection:C76([CONTACTS_COMPANIES:145])>1)
							Gen_Confirm("This person is already linked to multiple companies. Do you wish to add another or manage which ones to keep?"; "Review"; "Add")
							If (OK=1)
								//Here display the list of addresses in a window which the user can delete others from if required.
								OBJECT GET COORDINATES:C663(Self:C308->; $_l_BUttonLeft; $_l_BUttonTop; $_l_BUttonRight; $_l_BUttonBottom)
								$_bo_AddAddress:=ContactReviewAddresses("Work"; [CONTACTS:1]Contact_Code:2; CON_t_CompanyCode; $_l_BUttonLeft; $_l_BUttonTop)
								
							Else 
								//Here just add the address
								$_bo_AddAddress:=True:C214
							End if 
							OK:=1
							
					End case 
				Else 
					//we can add this contact to this company
					$_bo_AddAddress:=True:C214  ////w
				End if 
				
			Else 
				$_bo_AddAddress:=True:C214  //
				
			End if 
			If ($_bo_AddAddress)
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=CON_t_CompanyCode; *)
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2)
				
				If (Records in selection:C76([CONTACTS_COMPANIES:145])=0)
					
					CREATE RECORD:C68([CONTACTS_COMPANIES:145])
					[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
					[CONTACTS_COMPANIES:145]Address_Type:2:="Work"
					[CONTACTS_COMPANIES:145]Company_Code:1:=CON_t_CompanyCode
					[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
					DB_SaveRecord(->[CONTACTS_COMPANIES:145])
				Else 
					[CONTACTS_COMPANIES:145]Address_DateDeleted:7:=!00-00-00!
					[CONTACTS_COMPANIES:145]Address_Type:2:="" ?? ?00:00:00?
					[CONTACTS_COMPANIES:145]Address_Status:5:=0
					DB_SaveRecord(->[CONTACTS_COMPANIES:145])
				End if 
				
				
			End if 
		End if 
		OBJECT SET VISIBLE:C603(*; "oCON_CompanyLab1"; False:C215)
		OBJECT SET VISIBLE:C603(*; "OCON_COLABEL"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oCONCompanyCode"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCompanyName"; True:C214)
		OBJECT GET COORDINATES:C663(*; "OCON_COLABEL"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT GET COORDINATES:C663(*; "oCompanyNamesDropsDown"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		OBJECT GET COORDINATES:C663(*; "oCON_CompanyButton1"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
		OBJECT SET COORDINATES:C1248(*; "oCompanyNamesDropsDown"; $_l_ObjectRight+9; $_l_ObjectTop2; $_l_ObjectLeft3-5; $_l_ObjectBottom2)
		OBJECT SET COORDINATES:C1248(*; "oCompanyName"; $_l_ObjectRight+9; $_l_ObjectTop2; $_l_ObjectLeft3-(5+17); $_l_ObjectBottom2)
		CustList_PopUp
		
		COM_t_AddressLine1:=""
		COM_t_AddressLine2:=""
		COM_t_Town:=""
		COM_t_County:=""
		COM_t_PostalCode:=""
		COM_t_Country:=""
		$_l_Position:=Find in array:C230(COM_at_CompanyCodes; CON_t_CompanyCode)
		If ($_l_Position>0)
			CON_t_SelectedCompanyCode:=CON_t_CompanyCode
			COM_at_CompanyNames:=$_l_Position
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
			
		End if 
		
	Else 
		//this is an existing record
		///if this is a company address you can only edit the type//
		If ([CONTACTS_COMPANIES:145]Address_Type:2#CON_t_CompanyAdType) & (CON_t_CompanyAdType#"")
			[CONTACTS_COMPANIES:145]Address_Type:2:=CON_t_CompanyAdType
			DB_SaveRecord(->[CONTACTS_COMPANIES:145])
		End if 
		OBJECT SET VISIBLE:C603(*; "oCON_CompanyLab1"; False:C215)
		OBJECT SET VISIBLE:C603(*; "OCON_COLABEL"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oCONCompanyCode"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCompanyName"; True:C214)
		OBJECT GET COORDINATES:C663(*; "OCON_COLABEL"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT GET COORDINATES:C663(*; "oCompanyNamesDropsDown"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
		OBJECT GET COORDINATES:C663(*; "oCON_CompanyButton1"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
		OBJECT SET COORDINATES:C1248(*; "oCompanyNamesDropsDown"; $_l_ObjectRight+9; $_l_ObjectTop2; $_l_ObjectLeft3-5; $_l_ObjectBottom2)
		OBJECT SET COORDINATES:C1248(*; "oCompanyName"; $_l_ObjectRight+9; $_l_ObjectTop2; $_l_ObjectLeft3-(5+17); $_l_ObjectBottom2)
		CustList_PopUp
		
		COM_t_AddressLine1:=""
		COM_t_AddressLine2:=""
		COM_t_Town:=""
		COM_t_County:=""
		COM_t_PostalCode:=""
		COM_t_Country:=""
		$_l_Position:=Find in array:C230(COM_at_CompanyCodes; CON_t_CompanyCode)
		If ($_l_Position>0)
			CON_t_SelectedCompanyCode:=CON_t_CompanyCode
			COM_at_CompanyNames:=$_l_Position
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
			
		End if 
		
		
		
		
	End if 
	
	
	
Else 
	//SAVING A HOME ADDRESS??-this can only happen if the contact is new though
	
	CREATE RECORD:C68([COMPANIES:2])
	[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
	[COMPANIES:2]Address_Line_two:4:=COM_t_AddressLine2
	[COMPANIES:2]Area:11:=CON_t_CoAreaCode
	//[COMPANIES]Company_Code:=CON_t_CompanyCode
	[COMPANIES:2]Country:8:=COM_t_Country
	[COMPANIES:2]County_or_State:6:=COM_t_County
	[COMPANIES:2]Default_Currency:59:=<>SYS_t_BaseCurrency
	[COMPANIES:2]EMail_After_At:55:=[CONTACTS:1]EMail_After_At:24
	[COMPANIES:2]Email_Before_At:58:=[CONTACTS:1]Email_Before_At:30
	[COMPANIES:2]Entry_Date:16:=[CONTACTS:1]Entry_Date:17
	[COMPANIES:2]Fax:10:=CON_t_CompanyFAX
	[COMPANIES:2]Postal_Code:7:=COM_t_PostalCode
	[COMPANIES:2]Private:37:=True:C214
	Company_No
	
	[COMPANIES:2]Sales_Person:29:=[CONTACTS:1]Sales_Person:25
	[COMPANIES:2]Source:14:=[CONTACTS:1]Source:16
	[COMPANIES:2]Taken_By:26:=[CONTACTS:1]Taken_by:29
	[COMPANIES:2]Telephone:9:=CON_t_CompanyTelephone
	[COMPANIES:2]Town_or_City:5:=COM_t_Town
	[COMPANIES:2]x_ID:63:=AA_GetNextID(->[COMPANIES:2]x_ID:63)
	SAVE RECORD:C53([COMPANIES:2])
	If ([CONTACTS:1]Company_Code:1="")
		[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
		CREATE RECORD:C68([CONTACTS_COMPANIES:145])
		[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
		[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
		[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
	End if 
	[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
	[CONTACTS_COMPANIES:145]Address_Type:2:=CON_t_CompanyAdType
	DB_SaveRecord(->[CONTACTS_COMPANIES:145])
	
End if 

ERR_MethodTrackerReturn("OBJ:Contact_In,bAddComp2Contact"; $_t_oldMethodName)
