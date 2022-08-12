//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contacts_InLPD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2009 19:15:29If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; CON_t_DisplayType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_InLPD")
//Contacts_InLPD
Case of 
	: (Modified:C32([CONTACTS:1]Export:18))
	: (Modified:C32([CONTACTS:1]Contact_Name:31))
		Contacts_InLPX(->[CONTACTS:1]Contact_Name:31)
	: (Modified:C32([CONTACTS:1]Title:3))
		Contacts_InLPX(->[CONTACTS:1]Title:3)
	: (Modified:C32([CONTACTS:1]Forename:4))
		Contacts_InLPX(->[CONTACTS:1]Forename:4)
	: (Modified:C32([CONTACTS:1]Salutation:7))
		Contacts_InLPX(->[CONTACTS:1]Salutation:7)
	: (Modified:C32([CONTACTS:1]Surname:5))
		Contacts_InLPX(->[CONTACTS:1]Surname:5)
	: (Modified:C32([CONTACTS:1]Dept:8))
		Contacts_InLPX(->[CONTACTS:1]Dept:8)
	: (Modified:C32([CONTACTS:1]Salutation:7))
		Contacts_InLPX(->[CONTACTS:1]Salutation:7)
	: (Modified:C32([CONTACTS:1]Job_Title:6))
		Contacts_InLPX(->[CONTACTS:1]Job_Title:6)
	: (Modified:C32([CONTACTS:1]Comments:10))
		Contacts_InLPX(->[CONTACTS:1]Comments:10)
		
	: (Modified:C32([CONTACTS:1]Role:11))
		Contacts_InLPX(->[CONTACTS:1]Role:11)
	: (Modified:C32([CONTACTS:1]Status:14))
		Contacts_InLPX(->[CONTACTS:1]Status:14)
	: (Modified:C32([CONTACTS:1]Contact_Type:15))
		Contacts_InLPX(->[CONTACTS:1]Contact_Type:15)
	: (Modified:C32([CONTACTS:1]Source:16))
		Contacts_InLPX(->[CONTACTS:1]Source:16)
	: (Modified:C32([CONTACTS:1]Omit:20))
		Contacts_InLPX(->[CONTACTS:1]Omit:20)
	: (Modified:C32([CONTACTS:1]Extn:9))
		Contacts_InLPX(->[CONTACTS:1]Extn:9)
	: (Modified:C32([CONTACTS:1]Mobile:12))
		Contacts_InLPX(->[CONTACTS:1]Mobile:12)
	: (Modified:C32([CONTACTS:1]Fax:19))
		Contacts_InLPX(->[CONTACTS:1]Fax:19)
	: (Modified:C32([CONTACTS:1]Email_Before_At:30))
		Contacts_InLPX(->[CONTACTS:1]Email_Before_At:30)
	: (Modified:C32([CONTACTS:1]EMail_After_At:24))
		Contacts_InLPX(->[CONTACTS:1]EMail_After_At:24)
	: (Modified:C32([CONTACTS:1]Email_Address:35))
		Contacts_InLPX(->[CONTACTS:1]Email_Address:35)
	: (Modified:C32([CONTACTS:1]Sales_Person:25))
		Contacts_InLPX(->[CONTACTS:1]Sales_Person:25)
	: (Modified:C32([CONTACTS:1]Duplicate_State:26))
		Contacts_InLPX(->[CONTACTS:1]Duplicate_State:26)
	: (Modified:C32([CONTACTS:1]Esquire:27))
		Contacts_InLPX(->[CONTACTS:1]Esquire:27)
	: (Modified:C32([CONTACTS:1]Company_Code:1))
		Contacts_InLPX(->[CONTACTS:1]Company_Code:1)
	: (Modified:C32([CONTACTS:1]Contact_Code:2))
		Contacts_InLPX(->[CONTACTS:1]Contact_Code:2)
	: (Modified:C32([COMPANIES:2]Address_Line_one:3)) | (Modified:C32([COMPANIES:2]Address_Line_two:4)) | (Modified:C32([COMPANIES:2]Town_or_City:5)) | (Modified:C32([COMPANIES:2]County_or_State:6)) | (Modified:C32([COMPANIES:2]Postal_Code:7))
		[COMPANIES:2]ADDRESS:60:=WS_BUILDADDRESS
	Else 
		//Written as a case statement to allow other uses
		
		
End case 
ERR_MethodTrackerReturn("Contacts_InLPD"; $_t_oldMethodName)