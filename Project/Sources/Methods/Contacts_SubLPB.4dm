//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_SubLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/08/2009 13:39:39If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_DateAdded)
	C_BOOLEAN:C305(<>MultiCo; CON_bo_AddCompany)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_SubLPB")
If ([CONTACTS:1]Contact_Code:2="")
	Contact_Code
	DB_SaveRecord(->[CONTACTS:1])
	AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
End if 
If ([CONTACTS:1]Company_Code:1="")
	[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
	If (<>MultiCo)
		CON_bo_AddCompany:=True:C214
		CREATE RECORD:C68([CONTACTS_COMPANIES:145])
		[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
		[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
		[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
		[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
		DB_SaveRecord(->[CONTACTS_COMPANIES:145])
		
		
		
	End if 
	[CONTACTS:1]Sales_Person:25:=[COMPANIES:2]Sales_Person:29
End if 
OK:=1
ERR_MethodTrackerReturn("Contacts_SubLPB"; $_t_oldMethodName)
