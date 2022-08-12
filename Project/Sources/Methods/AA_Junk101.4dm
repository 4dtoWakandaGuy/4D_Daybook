//%attributes = {}
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
	//ARRAY TEXT(COM_at_CompanyNames;0)
	C_BOOLEAN:C305(CON_bo_CompanyDeletable; CON_bo_Editaddress)
	C_LONGINT:C283($_l_AddButtonBottom; $_l_AddButtonLeft; $_l_AddButtonRight; $_l_AddButtonTop; $_l_CoCodeBottom; $_l_CoCodeLeft; $_l_CoCodeRight; $_l_CoCodeTop; $_l_CoDDBottom; $_l_CoDDLeft; $_l_CoDDRight)
	C_LONGINT:C283($_l_CoDDTop; $_l_CoNameBottom; $_l_CoNameLeft; $_l_CoNameTop; $_l_Nul; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectBottom3; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectLeft3)
	C_LONGINT:C283($_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectRight3; $_l_ObjectTop; $_l_ObjectTop2; $_l_ObjectTop3; bAddComp2Contact)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Country; COM_t_County; COM_t_PostalCode; COM_t_Town; CON_t_CoAreaCode; CON_t_CompanyAdType; CON_t_CompanyCode)
	C_TEXT:C284(CON_t_CompanyFAX; CON_t_CompanyName; CON_t_CompanyTelephone; CON_t_NewlyAddedCompCode; CON_t_ParentRecord)
End if 
//Code Starts Here
TRACE:C157
$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.oCON_CompanyButton1"; Form event code:C388)
If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
	If (Not:C34(CON_bo_Editaddress))  // use when editing an existing
		Gen_Confirm("Add Contact to "+CON_t_CompanyName; "Yes"; "No")
	Else 
		OK:=1
	End if 
	CON_bo_Editaddress:=False:C215
	If (Not:C34(OK=1))
		[CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*)
		[CONTACTS_COMPANIES:145]Address_Status:5:=-1
		DB_SaveRecord(->[CONTACTS_COMPANIES:145])
		If ([CONTACTS:1]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
			[CONTACTS:1]Company_Code:1:=""
			CON_t_ParentRecord:=""
		End if 
		//DELETE RECORD([CONTACTS_COMPANIES])
		
	End if 
	//bsw/ng 24/05/04 keep the one which is being saved in memory
	CON_t_NewlyAddedCompCode:=[CONTACTS_COMPANIES:145]Company_Code:1  //bsw 24/05/04
	If (CON_t_NewlyAddedCompCode#[CONTACTS:1]Company_Code:1)  //new company
		If ([CONTACTS:1]Company_Code:1#"")
			If (CON_t_CompanyAdType="Home")
				//update or create the 'company' record
				If (CON_t_CompanyCode#"")
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=CON_t_CompanyCode)
					If (Records in selection:C76([COMPANIES:2])=0)  //just to be safe
						CREATE RECORD:C68([COMPANIES:2])
						[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
						[COMPANIES:2]Address_Line_two:4:=COM_t_AddressLine2
						
						[COMPANIES:2]Area:11:=CON_t_CoAreaCode
						[COMPANIES:2]Company_Code:1:=CON_t_CompanyCode
						[COMPANIES:2]Country:8:=COM_t_Country
						[COMPANIES:2]County_or_State:6:=COM_t_County
						[COMPANIES:2]Default_Currency:59:=<>SYS_t_BaseCurrency
						[COMPANIES:2]EMail_After_At:55:=[CONTACTS:1]EMail_After_At:24
						[COMPANIES:2]Email_Before_At:58:=[CONTACTS:1]Email_Before_At:30
						[COMPANIES:2]Entry_Date:16:=[CONTACTS:1]Entry_Date:17
						[COMPANIES:2]Fax:10:=CON_t_CompanyFAX
						[COMPANIES:2]Postal_Code:7:=COM_t_PostalCode
						[COMPANIES:2]Private:37:=True:C214
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
							[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
							[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
							
						End if 
						[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
						[CONTACTS_COMPANIES:145]Address_Type:2:=CON_t_CompanyAdType
						DB_SaveRecord(->[CONTACTS_COMPANIES:145])
						
					Else 
						If ([CONTACTS:1]Company_Code:1="")
							[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
							CREATE RECORD:C68([CONTACTS_COMPANIES:145])
							[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
							[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
							[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
							
						End if 
						READ WRITE:C146([COMPANIES:2])
						LOAD RECORD:C52([COMPANIES:2])
						
						
						[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
						[CONTACTS_COMPANIES:145]Address_Type:2:=CON_t_CompanyAdType
						DB_SaveRecord(->[CONTACTS_COMPANIES:145])
						
						[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
						[COMPANIES:2]Address_Line_two:4:=COM_t_AddressLine2
						
						[COMPANIES:2]Area:11:=CON_t_CoAreaCode
						[COMPANIES:2]Company_Code:1:=CON_t_CompanyCode
						[COMPANIES:2]Country:8:=COM_t_Country
						[COMPANIES:2]County_or_State:6:=COM_t_County
						[COMPANIES:2]Postal_Code:7:=COM_t_PostalCode
						[COMPANIES:2]Telephone:9:=CON_t_CompanyTelephone
						[COMPANIES:2]Town_or_City:5:=COM_t_Town
						DB_SaveRecord(->[COMPANIES:2])
						
					End if 
					QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
					QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
					
					OBJECT SET VISIBLE:C603(*; "oCON_CompanyLab1"; False:C215)
					OBJECT SET VISIBLE:C603(*; "OCON_COLABEL"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oCONCompanyCode"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oCompanyName"; True:C214)
					OBJECT GET COORDINATES:C663(*; "OCON_COLABEL"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					
					//OBJECT SET VISIBLE(*;"Picture2";True)
					//OBJECT SET VISIBLE(*;"Rectangle3";True)
					
					//OBJECT GET COORDINATES(*;"oCONCompanyCode";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
					OBJECT GET COORDINATES:C663(*; "oCompanyNamesDropsDown"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
					OBJECT GET COORDINATES:C663(*; "oCON_CompanyButton1"; $_l_ObjectLeft3; $_l_ObjectTop3; $_l_ObjectRight3; $_l_ObjectBottom3)
					OBJECT SET COORDINATES:C1248(*; "oCompanyNamesDropsDown"; $_l_ObjectRight+9; $_l_ObjectTop2; $_l_ObjectLeft3-5; $_l_ObjectBottom2)
					OBJECT SET COORDINATES:C1248(*; "oCompanyName"; $_l_ObjectRight+9; $_l_ObjectTop2; $_l_ObjectLeft3-(5+17); $_l_ObjectBottom2)
					
					//TRACE
					//Gen_SetobjectPositionRelativity (->[CONTACTS]Job_Title;->CON_t_CompanyName;"";"";2;1;8)
					//Gen_SetobjectPositionRelativity (->bAddComp2Contact;->COM_at_CompanyNames;"";"";-4;1;8)
					//Gen_SetobjectPositionRelativity (->COM_at_CompanyNames;->CON_t_CompanyName;"";"";5;1;1)
					//Gen_SetObjectPosition (->CON_t_CompanyName;0;0;0;-18)
					
					
					//$ObjectBottom:=Gen_SetObjectPosition (->CON_t_CompanyName;0;$_l_ObjectLeft)
					//MOVE OBJECT(*;"Rectangle3";$_l_ObjectLeft-1;$_l_ObjectTop2-1;$_l_ObjectRight3+1;$_l_ObjectBottom2+1;*)
					//$ObjectBottom:=Gen_SetobjectPositionByname ("Rectangle3";$_l_ObjectTop2-1;$_l_ObjectLeft-1;$_l_ObjectBottom2+1;$_l_ObjectRight3+1)
					
					
					CustList_PopUp
					COM_t_AddressLine1:=""
					COM_t_AddressLine2:=""
					COM_t_Town:=""
					COM_t_County:=""
					COM_t_PostalCode:=""
					COM_t_Country:=""
					
				Else 
					Gen_Alert("You must enter an address before saving")
				End if 
				
			Else 
				
			End if 
		Else 
			[CONTACTS:1]Company_Code:1:=CON_t_NewlyAddedCompCode
		End if 
	Else 
		If (CON_t_CompanyAdType="Home")
			//update or create the 'company' record
			If (CON_t_CompanyCode#"")
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=CON_t_CompanyCode)
				If (Records in selection:C76([COMPANIES:2])=0)  //just to be safe
					CREATE RECORD:C68([COMPANIES:2])
					[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
					[COMPANIES:2]Address_Line_two:4:=COM_t_AddressLine2
					
					[COMPANIES:2]Area:11:=CON_t_CoAreaCode
					[COMPANIES:2]Company_Code:1:=CON_t_CompanyCode
					[COMPANIES:2]Country:8:=COM_t_Country
					[COMPANIES:2]County_or_State:6:=COM_t_County
					[COMPANIES:2]Default_Currency:59:=<>SYS_t_BaseCurrency
					[COMPANIES:2]EMail_After_At:55:=[CONTACTS:1]EMail_After_At:24
					[COMPANIES:2]Email_Before_At:58:=[CONTACTS:1]Email_Before_At:30
					[COMPANIES:2]Entry_Date:16:=[CONTACTS:1]Entry_Date:17
					[COMPANIES:2]Fax:10:=CON_t_CompanyFAX
					[COMPANIES:2]Postal_Code:7:=COM_t_PostalCode
					[COMPANIES:2]Private:37:=True:C214
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
						[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
						[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
						
					End if 
					[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
					[CONTACTS_COMPANIES:145]Address_Type:2:=CON_t_CompanyAdType
					DB_SaveRecord(->[CONTACTS_COMPANIES:145])
					
				Else 
					If ([CONTACTS:1]Company_Code:1="")
						[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
						CREATE RECORD:C68([CONTACTS_COMPANIES:145])
						[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
						[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
						[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
						
					End if 
					
					READ WRITE:C146([COMPANIES:2])
					LOAD RECORD:C52([COMPANIES:2])
					
					[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
					[CONTACTS_COMPANIES:145]Address_Type:2:=CON_t_CompanyAdType
					DB_SaveRecord(->[CONTACTS_COMPANIES:145])
					
					[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
					[COMPANIES:2]Address_Line_two:4:=COM_t_AddressLine2
					
					[COMPANIES:2]Area:11:=CON_t_CoAreaCode
					[COMPANIES:2]Company_Code:1:=CON_t_CompanyCode
					[COMPANIES:2]Country:8:=COM_t_Country
					[COMPANIES:2]County_or_State:6:=COM_t_County
					[COMPANIES:2]Postal_Code:7:=COM_t_PostalCode
					[COMPANIES:2]Telephone:9:=CON_t_CompanyTelephone
					[COMPANIES:2]Town_or_City:5:=COM_t_Town
					DB_SaveRecord(->[COMPANIES:2])
				End if 
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				
				OBJECT SET VISIBLE:C603(*; "oCON_CompanyLab1"; False:C215)
				OBJECT SET VISIBLE:C603(*; "OCON_COLABEL"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; True:C214)
				//OBJECT SET VISIBLE(*;"Picture2";True)
				//OBJECT SET VISIBLE(*;"Rectangle3";True)
				$_l_Nul:=0
				OBJECT GET COORDINATES:C663(*; "OCON_COLABEL"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT GET COORDINATES:C663(*; "oCompanyName"; $_l_CoNameLeft; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
				//OBJECT GET COORDINATES(*;"Picture2";$_l_ObjectLeft3;$_l_ObjectTop3;$_l_ObjectRight3;$_l_ObjectBottom3)
				//TRACE
				//Gen_SetobjectPositionRelativity (->[CONTACTS]Job_Title;->CON_t_CompanyName;"";"";2;1;8)
				//Gen_SetobjectPositionRelativity (->bAddComp2Contact;->COM_at_CompanyNames;"";"";-4;1;8)
				//Gen_SetobjectPositionRelativity (->COM_at_CompanyNames;->CON_t_CompanyName;"";"";5;1;1)
				//Gen_SetObjectPosition (->CON_t_CompanyName;0;0;0;-18)
				OBJECT GET COORDINATES:C663(*; "oCONCompanyCode"; $_l_CoCodeLeft; $_l_CoCodeTop; $_l_CoCodeRight; $_l_CoCodeBottom)
				OBJECT GET COORDINATES:C663(*; "oCompanyNamesDropsDown"; $_l_CoDDLeft; $_l_CoDDTop; $_l_CoDDRight; $_l_CoDDBottom)
				OBJECT GET COORDINATES:C663(*; "oCON_CompanyButton1"; $_l_AddButtonLeft; $_l_AddButtonTop; $_l_AddButtonRight; $_l_AddButtonBottom)
				OBJECT SET COORDINATES:C1248(*; "oCompanyNamesDropsDown"; $_l_ObjectRight+5; $_l_CoDDTop; $_l_AddButtonLeft-5; $_l_CoDDBottom)
				OBJECT SET COORDINATES:C1248(*; "oCompanyName"; $_l_ObjectRight+5; $_l_CoNameTop; $_l_AddButtonLeft-(5+17); $_l_CoNameBottom)
				
				
				//Gen_SetobjectPositionRelativity (->CON_t_CompanyCode;->$_l_Nul;"";"Rectangle3";6;1;1)
				//Gen_SetobjectPositionRelativity (->$_l_Nul;->$_l_Nul;"Picture2";"Rectangle3";6;4;1)
				
				//MOVE OBJECT(CON_t_CompanyName;$_l_ObjectLeft;$_l_ObjectTop2;$_l_ObjectRight2;$_l_ObjectBottom2;*)
				//MOVE OBJECT(*;"Rectangle3";$_l_ObjectLeft-1;$_l_ObjectTop2-1;$_l_ObjectRight3+1;$_l_ObjectBottom2+1;*)
				
				CustList_PopUp
				COM_t_AddressLine1:=""
				COM_t_AddressLine2:=""
				COM_t_Town:=""
				COM_t_County:=""
				COM_t_PostalCode:=""
				COM_t_Country:=""
				
			Else 
				Gen_Alert("You must enter an address before saving")
			End if 
			
		End if 
	End if 
	
	QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
	QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
	OBJECT SET VISIBLE:C603(*; "oCON_CompanyLab1"; False:C215)
	OBJECT SET VISIBLE:C603(*; "OCON_COLABEL"; True:C214)
	OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; True:C214)
	
	OBJECT GET COORDINATES:C663(*; "OCON_COLABEL"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	OBJECT GET COORDINATES:C663(*; "oCompanyName"; $_l_CoNameLeft; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
	//OBJECT GET COORDINATES(*;"Picture2";$_l_ObjectLeft3;$_l_ObjectTop3;$_l_ObjectRight3;$_l_ObjectBottom3)
	//TRACE
	//Gen_SetobjectPositionRelativity (->[CONTACTS]Job_Title;->CON_t_CompanyName;"";"";2;1;8)
	//Gen_SetobjectPositionRelativity (->bAddComp2Contact;->COM_at_CompanyNames;"";"";-4;1;8)
	//Gen_SetobjectPositionRelativity (->COM_at_CompanyNames;->CON_t_CompanyName;"";"";5;1;1)
	//Gen_SetObjectPosition (->CON_t_CompanyName;0;0;0;-18)
	OBJECT GET COORDINATES:C663(*; "oCONCompanyCode"; $_l_CoCodeLeft; $_l_CoCodeTop; $_l_CoCodeRight; $_l_CoCodeBottom)
	OBJECT GET COORDINATES:C663(*; "oCompanyNamesDropsDown"; $_l_CoDDLeft; $_l_CoDDTop; $_l_CoDDRight; $_l_CoDDBottom)
	OBJECT GET COORDINATES:C663(*; "oCON_CompanyButton1"; $_l_AddButtonLeft; $_l_AddButtonTop; $_l_AddButtonRight; $_l_AddButtonBottom)
	OBJECT SET COORDINATES:C1248(*; "oCompanyNamesDropsDown"; $_l_ObjectRight+5; $_l_CoDDTop; $_l_AddButtonLeft-5; $_l_CoDDBottom)
	OBJECT SET COORDINATES:C1248(*; "oCompanyName"; $_l_ObjectRight+5; $_l_CoNameTop; $_l_AddButtonLeft-(5+17); $_l_CoNameBottom)
	
	////OBJECT GET COORDINATES(*;"Picture2";$_l_ObjectLeft3;$_l_ObjectTop3;$_l_ObjectRight3;$_l_ObjectBottom3)
	//TRACE
	//MOVE OBJECT(CON_t_CompanyName;$_l_ObjectLeft;$_l_ObjectTop2;$_l_ObjectRight2;$_l_ObjectBottom2;*)
	//MOVE OBJECT(*;"Rectangle3";$_l_ObjectLeft-1;$_l_ObjectTop2-1;$_l_ObjectRight3+1;$_l_ObjectBottom2+1;*)
	//->Gen_SetobjectPositionRelativity (->[CONTACTS]Job_Title;->CON_t_CompanyName;"";"";2;1;8)
	//->Gen_SetobjectPositionRelativity (->bAddComp2Contact;->COM_at_CompanyNames;"";"";-4;1;8)
	//->Gen_SetobjectPositionRelativity (->COM_at_CompanyNames;->CON_t_CompanyName;"";"";5;1;1)
	//->Gen_SetObjectPosition (->CON_t_CompanyName;0;0;0;-18)
	
	
	CustList_PopUp
	COM_t_AddressLine1:=""
	COM_t_AddressLine2:=""
	COM_t_Town:=""
	COM_t_County:=""
	COM_t_PostalCode:=""
	COM_t_Country:=""
	
Else 
	If (CON_t_CompanyAdType#"HOME")
		If (CON_bo_CompanyDeletable)
			[CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*)
			[CONTACTS_COMPANIES:145]Address_Status:5:=-1
			DB_SaveRecord(->[CONTACTS_COMPANIES:145])
			If ([CONTACTS:1]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
				[CONTACTS:1]Company_Code:1:=""
				CON_t_ParentRecord:=""
			End if 
			
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			OBJECT SET VISIBLE:C603(*; "oCON_CompanyLab1"; False:C215)
			OBJECT SET VISIBLE:C603(*; "OCON_COLABEL"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; True:C214)
			//OBJECT SET VISIBLE(*;"Picture2";True)
			//OBJECT SET VISIBLE(*;"Rectangle3";True)
			OBJECT GET COORDINATES:C663(*; "OCON_COLABEL"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oCompanyName"; $_l_CoNameLeft; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			//OBJECT GET COORDINATES(*;"Picture2";$_l_ObjectLeft3;$_l_ObjectTop3;$_l_ObjectRight3;$_l_ObjectBottom3)
			//TRACE
			//Gen_SetobjectPositionRelativity (->[CONTACTS]Job_Title;->CON_t_CompanyName;"";"";2;1;8)
			//Gen_SetobjectPositionRelativity (->bAddComp2Contact;->COM_at_CompanyNames;"";"";-4;1;8)
			//Gen_SetobjectPositionRelativity (->COM_at_CompanyNames;->CON_t_CompanyName;"";"";5;1;1)
			//Gen_SetObjectPosition (->CON_t_CompanyName;0;0;0;-18)
			OBJECT GET COORDINATES:C663(*; "oCONCompanyCode"; $_l_CoCodeLeft; $_l_CoCodeTop; $_l_CoCodeRight; $_l_CoCodeBottom)
			OBJECT GET COORDINATES:C663(*; "oCompanyNamesDropsDown"; $_l_CoDDLeft; $_l_CoDDTop; $_l_CoDDRight; $_l_CoDDBottom)
			OBJECT GET COORDINATES:C663(*; "oCON_CompanyButton1"; $_l_AddButtonLeft; $_l_AddButtonTop; $_l_AddButtonRight; $_l_AddButtonBottom)
			OBJECT SET COORDINATES:C1248(*; "oCompanyNamesDropsDown"; $_l_ObjectRight+5; $_l_CoDDTop; $_l_AddButtonLeft-5; $_l_CoDDBottom)
			OBJECT SET COORDINATES:C1248(*; "oCompanyName"; $_l_ObjectRight+5; $_l_CoNameTop; $_l_AddButtonLeft-(5+17); $_l_CoNameBottom)
			CustList_PopUp
		Else 
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			OBJECT SET VISIBLE:C603(*; "oCON_CompanyLab1"; False:C215)
			OBJECT SET VISIBLE:C603(*; "OCON_COLABEL"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; True:C214)
			//OBJECT SET VISIBLE(*;"Picture2";True)
			//OBJECT SET VISIBLE(*;"Rectangle3";True)
			OBJECT GET COORDINATES:C663(*; "OCON_COLABEL"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oCompanyName"; $_l_CoNameLeft; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			//OBJECT GET COORDINATES(*;"Picture2";$_l_ObjectLeft3;$_l_ObjectTop3;$_l_ObjectRight3;$_l_ObjectBottom3)
			//TRACE
			//Gen_SetobjectPositionRelativity (->[CONTACTS]Job_Title;->CON_t_CompanyName;"";"";2;1;8)
			//Gen_SetobjectPositionRelativity (->bAddComp2Contact;->COM_at_CompanyNames;"";"";-4;1;8)
			//Gen_SetobjectPositionRelativity (->COM_at_CompanyNames;->CON_t_CompanyName;"";"";5;1;1)
			//Gen_SetObjectPosition (->CON_t_CompanyName;0;0;0;-18)
			OBJECT GET COORDINATES:C663(*; "oCONCompanyCode"; $_l_CoCodeLeft; $_l_CoCodeTop; $_l_CoCodeRight; $_l_CoCodeBottom)
			OBJECT GET COORDINATES:C663(*; "oCompanyNamesDropsDown"; $_l_CoDDLeft; $_l_CoDDTop; $_l_CoDDRight; $_l_CoDDBottom)
			OBJECT GET COORDINATES:C663(*; "oCON_CompanyButton1"; $_l_AddButtonLeft; $_l_AddButtonTop; $_l_AddButtonRight; $_l_AddButtonBottom)
			OBJECT SET COORDINATES:C1248(*; "oCompanyNamesDropsDown"; $_l_ObjectRight+5; $_l_CoDDTop; $_l_AddButtonLeft-5; $_l_CoDDBottom)
			OBJECT SET COORDINATES:C1248(*; "oCompanyName"; $_l_ObjectRight+5; $_l_CoNameTop; $_l_AddButtonLeft-(5+17); $_l_CoNameBottom)
			
			//Gen_SetObjectPosition (->CON_t_CompanyName;0;0;0;-18)
			//Gen_SetobjectPositionRelativity (->$_l_Nul;->$_l_Nul;"Picture2";"Rectangle3";6;4;1)
			
			CustList_PopUp
			
		End if 
		CON_bo_CompanyDeletable:=False:C215
	Else 
		//entering a home address for a contact?
		If (CON_t_CompanyCode#"")
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=CON_t_CompanyCode)
			If (Records in selection:C76([COMPANIES:2])=0)  //just to be safe
				CREATE RECORD:C68([COMPANIES:2])
				[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
				[COMPANIES:2]Address_Line_two:4:=COM_t_AddressLine2
				
				[COMPANIES:2]Area:11:=CON_t_CoAreaCode
				[COMPANIES:2]Company_Code:1:=CON_t_CompanyCode
				[COMPANIES:2]Country:8:=COM_t_Country
				[COMPANIES:2]County_or_State:6:=COM_t_County
				[COMPANIES:2]Default_Currency:59:=<>SYS_t_BaseCurrency
				[COMPANIES:2]EMail_After_At:55:=[CONTACTS:1]EMail_After_At:24
				[COMPANIES:2]Email_Before_At:58:=[CONTACTS:1]Email_Before_At:30
				[COMPANIES:2]Entry_Date:16:=[CONTACTS:1]Entry_Date:17
				[COMPANIES:2]Fax:10:=CON_t_CompanyFAX
				[COMPANIES:2]Postal_Code:7:=COM_t_PostalCode
				[COMPANIES:2]Private:37:=True:C214
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
					
					[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
					[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
					
				End if 
				[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
				[CONTACTS_COMPANIES:145]Address_Type:2:=CON_t_CompanyAdType
				DB_SaveRecord(->[CONTACTS_COMPANIES:145])
				
			Else 
				If ([CONTACTS:1]Company_Code:1="")
					[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
					CREATE RECORD:C68([CONTACTS_COMPANIES:145])
					[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
					[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
					[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
				End if 
				
				[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
				[CONTACTS_COMPANIES:145]Address_Type:2:=CON_t_CompanyAdType
				DB_SaveRecord(->[CONTACTS_COMPANIES:145])
				
			End if 
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			OBJECT SET VISIBLE:C603(*; "oCON_CompanyLab1"; False:C215)
			OBJECT SET VISIBLE:C603(*; "OCON_COLABEL"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; True:C214)
			//OBJECT SET VISIBLE(*;"Picture2";True)
			//OBJECT SET VISIBLE(*;"Rectangle3";True)
			OBJECT GET COORDINATES:C663(*; "OCON_COLABEL"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oCompanyName"; $_l_CoNameLeft; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			//OBJECT GET COORDINATES(*;"Picture2";$_l_ObjectLeft3;$_l_ObjectTop3;$_l_ObjectRight3;$_l_ObjectBottom3)
			//TRACE
			//Gen_SetobjectPositionRelativity (->[CONTACTS]Job_Title;->CON_t_CompanyName;"";"";2;1;8)
			//Gen_SetobjectPositionRelativity (->bAddComp2Contact;->COM_at_CompanyNames;"";"";-4;1;8)
			//Gen_SetobjectPositionRelativity (->COM_at_CompanyNames;->CON_t_CompanyName;"";"";5;1;1)
			//Gen_SetObjectPosition (->CON_t_CompanyName;0;0;0;-18)
			OBJECT GET COORDINATES:C663(*; "oCONCompanyCode"; $_l_CoCodeLeft; $_l_CoCodeTop; $_l_CoCodeRight; $_l_CoCodeBottom)
			OBJECT GET COORDINATES:C663(*; "oCompanyNamesDropsDown"; $_l_CoDDLeft; $_l_CoDDTop; $_l_CoDDRight; $_l_CoDDBottom)
			OBJECT GET COORDINATES:C663(*; "oCON_CompanyButton1"; $_l_AddButtonLeft; $_l_AddButtonTop; $_l_AddButtonRight; $_l_AddButtonBottom)
			OBJECT SET COORDINATES:C1248(*; "oCompanyNamesDropsDown"; $_l_ObjectRight+5; $_l_CoDDTop; $_l_AddButtonLeft-5; $_l_CoDDBottom)
			OBJECT SET COORDINATES:C1248(*; "oCompanyName"; $_l_ObjectRight+5; $_l_CoNameTop; $_l_AddButtonLeft-(5+17); $_l_CoNameBottom)
			CustList_PopUp
			
			
		Else 
			//Gen_Alert ("You must enter an address before saving")
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Contact_In,bAddComp2Contact"; $_t_oldMethodName)
