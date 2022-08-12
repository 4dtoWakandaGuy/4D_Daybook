//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contacts_InLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(AA_at_ProffesionalAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	C_BOOLEAN:C305(<>SYS_bo_DefaultSalutation)
	C_LONGINT:C283(<>PER_l_AccessLevel; $_l_CharPosition; $_l_event; $_l_objectBottom; $_l_objectLeft; $_l_objectRight; $_l_objectTop; $_l_SalutationRow; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_windowTop; vAdd)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_ContactForename; $_t_ContactNewName; $_t_ContactSurname; $_t_DeleteContactCode; $_t_Forename; $_t_Lastname; $_t_oldMethodName; $_t_Surname; $_t_TempContactName; $_t_Title; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SD_t_AttachContactCode; vCompCode; vCompName; vContCode; vContName; vSurname; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_InLPX")
//Contacts_InLPX

Case of 
	: ($1=(->[CONTACTS:1]Contact_Name:31))  //new  Field and it changes 3 other fields so must run their macros
		
		
		$_t_Title:=[CONTACTS:1]Title:3
		$_t_Forename:=[CONTACTS:1]Forename:4
		$_t_Lastname:=[CONTACTS:1]Surname:5
		AA_LoadNameArrays
		AA_ParseName([CONTACTS:1]Contact_Name:31; 0; ->[CONTACTS:1]Title:3; ->[CONTACTS:1]Forename:4; ->[CONTACTS:1]Surname:5; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
		[CONTACTS:1]Forename:4:=Uppers2([CONTACTS:1]Forename:4; 1)
		[CONTACTS:1]Surname:5:=Uppers2(UppersSurname([CONTACTS:1]Surname:5); 1)
		SD_t_AttachContactCode:=""
		//TRACE
		If (True:C214)
			If (Record number:C243([CONTACTS:1])=-3) | (Old:C35([CONTACTS:1]Contact_Name:31)="") & (([CONTACTS:1]Surname:5#""))
				
				$_t_DeleteContactCode:=[CONTACTS:1]Contact_Code:2
				$_t_ContactSurname:=[CONTACTS:1]Surname:5
				$_t_ContactForename:=[CONTACTS:1]Forename:4
				PUSH RECORD:C176([CONTACTS:1])
				COPY NAMED SELECTION:C331([COMPANIES:2]; "CompPreContactDeDup")  //added 28/11/08 v631b120i -kmw (fix problem with losing current company when adding existing contact name from company screen due to contact de-dup doing a query on company table)
				
				OBJECT GET COORDINATES:C663([CONTACTS:1]Surname:5; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectBottom)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				If ($_t_ContactForename#"")
					$_t_ContactNewName:=DB_DeDupContact($_t_ContactSurname; ->[CONTACTS:1]Soundex:37; ->[CONTACTS:1]Forename:4; $_t_ContactForename[[1]]; $_l_WindowLeft+$_l_objectLeft; $_l_objectTop+$_l_windowTop)
				Else 
					$_t_ContactNewName:=DB_DeDupContact($_t_ContactSurname; ->[CONTACTS:1]Soundex:37; ->[CONTACTS:1]Forename:4; $_t_ContactForename; $_l_WindowLeft+$_l_objectLeft; $_l_objectTop+$_l_windowTop)
				End if 
				SHOW WINDOW:C435
				
				POP RECORD:C177([CONTACTS:1])
				ONE RECORD SELECT:C189([CONTACTS:1])
				
				USE NAMED SELECTION:C332("CompPreContactDeDup")  //added 28/11/08 v631b120i -kmw (fix problem with losing current company when adding existing contact name from company screen due to contact de-dup doing a query on company table)
				POP RECORD:C177([COMPANIES:2])  //added 28/11/08 v631b120i -kmw (fix problem with losing current company when adding existing contact name from company screen due to contact de-dup doing a query on company table)
				
			End if 
		End if 
		
		If (SD_t_AttachContactCode#"")
			If ($_t_DeleteContactCode#SD_t_AttachContactCode)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_DeleteContactCode)
				DELETE RECORD:C58([CONTACTS:1])
			End if 
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD_t_AttachContactCode)
			
			
		Else 
			If ([CONTACTS:1]Title:3#"")
				//to ensure capitalization is correct
				$_l_SalutationRow:=Find in array:C230(AA_at_Salutations; [CONTACTS:1]Title:3)
				If ($_l_SalutationRow>0)
					[CONTACTS:1]Title:3:=AA_at_Salutations{$_l_SalutationRow}
				End if 
			End if 
			
			If ($_t_Title#[CONTACTS:1]Title:3)
				vContName:=CON_BuildContactNameandJobTitle
				Contacts_InLPM
				Macro_AccTypePt(->[CONTACTS:1]Title:3)
			End if 
			If ($_t_Forename#[CONTACTS:1]Forename:4)
				[CONTACTS:1]Forename:4:=Uppers2([CONTACTS:1]Forename:4; 1)
				If (([CONTACTS:1]Forename:4#"") & ([CONTACTS:1]Salutation:7="") & (<>SYS_bo_DefaultSalutation))
					If (Length:C16(FirstWord([CONTACTS:1]Forename:4))>1)
						[CONTACTS:1]Salutation:7:=FirstWord([CONTACTS:1]Forename:4)
					End if 
				End if 
				If (DB_t_CurrentFormUsage#"None")
					Cont_Check
				Else 
					Cont_Check(False:C215)
				End if 
				
				vContName:=CON_BuildContactNameandJobTitle
				Contacts_InLPM
				Macro_AccTypePt(->[CONTACTS:1]Forename:4)
			End if 
			If ($_t_Lastname#[CONTACTS:1]Surname:5)
				[CONTACTS:1]Surname:5:=Uppers2(UppersSurname([CONTACTS:1]Surname:5); 1)
				vContName:=CON_BuildContactNameandJobTitle
				If (DB_t_CurrentFormUsage#"None")
					Cont_Check
				Else 
					Cont_Check(False:C215)
				End if 
				Contacts_InLPM
				Macro_AccTypePt(->[CONTACTS:1]Surname:5)
			End if 
			
			
			$_t_TempContactName:=CON_BuildContactName  // 21/11/02 pb.
			// If ($_t_TempContactName#[CONTACTS]Contact_Name)
			[CONTACTS:1]Contact_Name:31:=$_t_TempContactName
			//   End if
		End if 
		
	: ($1=(->[CONTACTS:1]Title:3))
		// If (◊NoContTit)
		//   [CONTACTS]Title:=Uppers2 ([CONTACTS]Title)
		//  Else
		If (DB_t_CurrentFormUsage#"None")
			Check_Lists(->[CONTACTS:1]Title:3; "Titles")
		End if 
		
		AA_LoadNameArrays
		vContName:=CON_BuildContactNameandJobTitle
		Contacts_InLPM
		$_t_TempContactName:=CON_BuildContactName  // 21/11/02 pb.
		If ($_t_TempContactName#[CONTACTS:1]Contact_Name:31)
			[CONTACTS:1]Contact_Name:31:=$_t_TempContactName
		End if 
		
	: ($1=(->[CONTACTS:1]Forename:4))
		[CONTACTS:1]Forename:4:=Uppers2([CONTACTS:1]Forename:4; 1)
		If (([CONTACTS:1]Forename:4#"") & ([CONTACTS:1]Salutation:7="") & (<>SYS_bo_DefaultSalutation))
			If (Length:C16(FirstWord([CONTACTS:1]Forename:4))>1)
				[CONTACTS:1]Salutation:7:=FirstWord([CONTACTS:1]Forename:4)
			End if 
		End if 
		If (DB_t_CurrentFormUsage#"None")
			Cont_Check
		Else 
			Cont_Check(False:C215)
		End if 
		vContName:=CON_BuildContactNameandJobTitle
		Contacts_InLPM
		$_t_TempContactName:=CON_BuildContactName  // 21/11/02 pb.
		If ($_t_TempContactName#[CONTACTS:1]Contact_Name:31)
			[CONTACTS:1]Contact_Name:31:=$_t_TempContactName
		End if 
		If (False:C215)
			If (Record number:C243([CONTACTS:1])=-3)
				OBJECT GET COORDINATES:C663([CONTACTS:1]Surname:5; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectBottom)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				If ([CONTACTS:1]Forename:4#"")
					$_t_Surname:=DB_DeDupContact([CONTACTS:1]Surname:5; ->[CONTACTS:1]Soundex:37; ->[CONTACTS:1]Forename:4; [CONTACTS:1]Forename:4[[1]]; $_l_WindowLeft+$_l_objectLeft; $_l_objectTop+$_l_windowTop)
				Else 
					$_t_Surname:=DB_DeDupContact([CONTACTS:1]Surname:5; ->[CONTACTS:1]Soundex:37; ->[CONTACTS:1]Forename:4; [CONTACTS:1]Forename:4; $_l_WindowLeft+$_l_objectLeft; $_l_objectTop+$_l_windowTop)
				End if 
				
				
			End if 
			If (SD_t_AttachContactCode#"")
			End if 
			
		End if 
		
	: ($1=(->[CONTACTS:1]Salutation:7))
		[CONTACTS:1]Salutation:7:=Uppers2([CONTACTS:1]Salutation:7; 1)
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Surname:5))
		[CONTACTS:1]Surname:5:=Uppers2(UppersSurname([CONTACTS:1]Surname:5); 1)
		vContName:=CON_BuildContactNameandJobTitle
		If (DB_t_CurrentFormUsage#"None")
			Cont_Check
		Else 
			Cont_Check(False:C215)
		End if 
		Contacts_InLPM
		$_t_TempContactName:=CON_BuildContactName  // 21/11/02 pb.
		If ($_t_TempContactName#[CONTACTS:1]Contact_Name:31)
			[CONTACTS:1]Contact_Name:31:=$_t_TempContactName
		End if 
		If (False:C215)
			If (Record number:C243([CONTACTS:1])=-3)
				OBJECT GET COORDINATES:C663([CONTACTS:1]Surname:5; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectBottom)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				If ([CONTACTS:1]Forename:4#"")
					$_t_Surname:=DB_DeDupContact([CONTACTS:1]Surname:5; ->[CONTACTS:1]Soundex:37; ->[CONTACTS:1]Forename:4; [CONTACTS:1]Forename:4[[1]]; $_l_WindowLeft+$_l_objectLeft; $_l_objectTop+$_l_windowTop)
				Else 
					$_t_Surname:=DB_DeDupContact([CONTACTS:1]Surname:5; ->[CONTACTS:1]Soundex:37; ->[CONTACTS:1]Forename:4; [CONTACTS:1]Forename:4; $_l_WindowLeft+$_l_objectLeft; $_l_objectTop+$_l_windowTop)
				End if 
				
				
			End if 
			If (SD_t_AttachContactCode#"")
			End if 
		End if 
		
	: ($1=(->[CONTACTS:1]Dept:8))
		[CONTACTS:1]Dept:8:=Uppers2([CONTACTS:1]Dept:8)
		vContName:=CON_BuildContactNameandJobTitle
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Salutation:7))
		[CONTACTS:1]Salutation:7:=Uppers2([CONTACTS:1]Salutation:7; 1)
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Job_Title:6))
		[CONTACTS:1]Job_Title:6:=Uppers2([CONTACTS:1]Job_Title:6)
		vContName:=CON_BuildContactNameandJobTitle
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Comments:10))
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Role:11))
		If (DB_t_CurrentFormUsage#"None")
			Check_Minor(->[CONTACTS:1]Role:11; ""; ->[ROLES:87]; ->[ROLES:87]Role_Code:1; ->[ROLES:87]Role_Name:2; "Roles In"; "Role")
		End if 
		
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Status:14))
		If (Old:C35([CONTACTS:1]Status:14)#"")
			OLD RELATED ONE:C44([CONTACTS:1]Status:14)
			If ([STATUS:4]No_Change:4)
				If (DB_t_CurrentFormUsage#"None")
					Gen_Alert("The Status of this Contact cannot be changed"; "Cancel")
				End if 
				
				[CONTACTS:1]Status:14:=Old:C35([CONTACTS:1]Status:14)
			Else 
				If (DB_t_CurrentFormUsage#"None")
					Check_Minor(->[CONTACTS:1]Status:14; "Status_"; ->[STATUS:4]; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Status_Name:2; "Status In"; "Status"; "1")
				End if 
				
			End if 
		Else 
			If (DB_t_CurrentFormUsage#"None")
				Check_Minor(->[CONTACTS:1]Status:14; "Status_"; ->[STATUS:4]; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Status_Name:2; "Status In"; "Status"; "1")
			End if 
			
		End if 
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Contact_Type:15))
		If (DB_t_CurrentFormUsage#"None")
			Check_Minor(->[CONTACTS:1]Contact_Type:15; "Type_"; ->[TYPES:5]; ->[TYPES:5]Type_Code:1; ->[TYPES:5]Type_Name:2; "Types In"; "Type"; "1")
		End if 
		
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Source:16))
		If (DB_t_CurrentFormUsage#"None")
			Check_Minor(->[CONTACTS:1]Source:16; "Source_"; ->[SOURCES:6]; ->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Source_Name:2; "Sources_In"; "Source"; "1")
		End if 
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Omit:20))
		[CONTACTS:1]Omit:20:=Uppercase:C13([CONTACTS:1]Omit:20)
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Extn:9))
		[CONTACTS:1]Extn:9:=Uppercase:C13([CONTACTS:1]Extn:9)
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Mobile:12))
		[CONTACTS:1]Mobile:12:=Uppercase:C13([CONTACTS:1]Mobile:12)
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Fax:19))
		[CONTACTS:1]Fax:19:=Uppercase:C13([CONTACTS:1]Fax:19)
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Email_Before_At:30))
		Gen_EmailAddr(->[CONTACTS:1]Email_Before_At:30; ->[CONTACTS:1]EMail_After_At:24; 1)
		Contacts_InLPM
		If ([CONTACTS:1]EMail_After_At:24#"") & ([CONTACTS:1]Email_Before_At:30#"")
			[CONTACTS:1]Email_Address:35:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
		End if 
		
	: ($1=(->[CONTACTS:1]EMail_After_At:24))
		Gen_EmailAddr(->[CONTACTS:1]Email_Before_At:30; ->[CONTACTS:1]EMail_After_At:24; 2)
		Contacts_InLPM
		If ([CONTACTS:1]EMail_After_At:24#"") & ([CONTACTS:1]Email_Before_At:30#"")
			[CONTACTS:1]Email_Address:35:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
		End if 
	: ($1=(->[CONTACTS:1]Email_Address:35))
		If ([CONTACTS:1]Email_Address:35#"") & (Position:C15(Char:C90(64); [CONTACTS:1]Email_Address:35)<1)
			ALERT:C41("Email addresses must contain an @ sign!")
			
		Else 
			If ([CONTACTS:1]Email_Address:35#"")  // 01/09/03 pb
				$_l_CharPosition:=Position:C15(Char:C90(64); [CONTACTS:1]Email_Address:35)
				If ($_l_CharPosition>0)
					[CONTACTS:1]Email_Before_At:30:=Substring:C12([CONTACTS:1]Email_Address:35; 1; $_l_CharPosition-1)
					[CONTACTS:1]EMail_After_At:24:=Substring:C12([CONTACTS:1]Email_Address:35; $_l_CharPosition+1)
				End if 
			Else 
				If (Old:C35([CONTACTS:1]Email_Address:35)#"") & ([CONTACTS:1]Email_Address:35="")
					[CONTACTS:1]Email_Address:35:=""
					[CONTACTS:1]Email_Before_At:30:=""
					[CONTACTS:1]EMail_After_At:24:=""
				Else 
					If ([CONTACTS:1]Email_Before_At:30#"") | ([CONTACTS:1]EMail_After_At:24#"")
						[CONTACTS:1]Email_Address:35:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
					End if 
				End if 
			End if 
			Contacts_InLPM
		End if 
		
	: ($1=(->[CONTACTS:1]Sales_Person:25))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[CONTACTS:1]Sales_Person:25; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
		End if 
		
	: ($1=(->[CONTACTS:1]Duplicate_State:26))
		[CONTACTS:1]Duplicate_State:26:=Uppercase:C13([CONTACTS:1]Duplicate_State:26)
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Esquire:27))
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Company_Code:1))
		If ([CONTACTS:1]Company_Code:1#"")
			[CONTACTS:1]Company_Code:1:=Uppercase:C13([CONTACTS:1]Company_Code:1)
			vCompName:=[CONTACTS:1]Company_Code:1
			vSurname:=""
			DB_t_CurrentFormUsage2:="NoCan"
			If (DB_t_CurrentFormUsage#"None")
				Check_Company(->[CONTACTS:1]Company_Code:1; ->[CONTACTS:1]Contact_Code:2; ->[CONTACTS:1])
			End if 
			
			DB_t_CurrentFormUsage2:=""
			
			Company_Details
		End if 
		Contacts_InLPM
	: ($1=(->[CONTACTS:1]Contact_Code:2))
		RemoveLeadTr(Uppercase:C13([CONTACTS:1]Contact_Code:2); ->[CONTACTS:1]Contact_Code:2)
		If (([CONTACTS:1]Contact_Code:2#Old:C35([CONTACTS:1]Contact_Code:2)) & (Old:C35([CONTACTS:1]Contact_Code:2)#"") & ([CONTACTS:1]Exported:23))
			If (DB_t_CurrentFormUsage#"None")
				Gen_Alert("You cannot recode Contacts that have been Downloaded"; "Cancel")
			End if 
			
			[CONTACTS:1]Contact_Code:2:=Old:C35([CONTACTS:1]Contact_Code:2)
		Else 
			If (vAdd=0)  //Don't do it if adding from another file
				READ WRITE:C146([ORDERS:24])
				READ WRITE:C146([DIARY:12])
				vContCode:=Old:C35([CONTACTS:1]Contact_Code:2)
				Cont_RenumSrch(vContCode)
				If ((Records in selection:C76([DIARY:12])>0) | (Records in selection:C76([ORDERS:24])>0) | (Records in selection:C76([INFORMATION:55])>0) | (Records in selection:C76([INVOICES:39])>0) | (Records in selection:C76([JOBS:26])>0) | (Records in selection:C76([PUBLICATIONS:52])>0) | (Records in selection:C76([CONTRACTS:17])>0) | (Records in selection:C76([SERVICE_CALLS:20])>0))
					If ((<>PER_l_AccessLevel>1) | (DB_GetModuleSettingByNUM(Module_Companies)#2))
						Gen_Alert("You don't have the authority to recode Contacts with related data"; "Cancel")
						[CONTACTS:1]Contact_Code:2:=Old:C35([CONTACTS:1]Contact_Code:2)
					Else 
						Gen_Confirm("Do you want to update references to this Contact in other files?"; "Yes"; "No")
						If (OK=1)
							vText:=[CONTACTS:1]Contact_Code:2
							Cont_Trans
						End if 
					End if 
				End if 
				READ ONLY:C145([ORDERS:24])
				READ ONLY:C145([DIARY:12])
			Else   //But do update any newly added Contacts
				If (Records in selection:C76([CONTACTS:1])>0)
					DB_SaveRecord(->[CONTACTS:1])
					AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
					Comp_RenumAppCT([COMPANIES:2]Company_Code:1; vCompCode)
				End if 
			End if 
		End if 
		Contacts_InLPM
End case 
Macro_AccTypePt($1)
ERR_MethodTrackerReturn("Contacts_InLPX"; $_t_oldMethodName)