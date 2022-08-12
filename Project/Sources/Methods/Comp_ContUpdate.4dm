//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_ContUpdate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_DateAdded)
	//C_UNKNOWN(Address_Status)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_ContUpdate")
QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
If (Records in selection:C76([CONTACTS:1])=0)
	CREATE RECORD:C68([CONTACTS:1])
	Contact_Code
	[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
	CREATE RECORD:C68([CONTACTS_COMPANIES:145])
	[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
	[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
	[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
	[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
	DB_SaveRecord(->[CONTACTS_COMPANIES:145])
	
	[CONTACTS:1]Job_Title:6:="Managing Director"
	[CONTACTS:1]Omit:20:="N"
	[CONTACTS:1]Status:14:=[COMPANIES:2]Status:12
	[CONTACTS:1]Entry_Date:17:=<>DB_d_CurrentDate
	DB_SaveRecord(->[CONTACTS:1])
	AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
Else 
	FIRST RECORD:C50([CONTACTS:1])
	While (Not:C34(End selection:C36([CONTACTS:1])))
		If ([CONTACTS:1]Status:14="")
			[CONTACTS:1]Status:14:=[COMPANIES:2]Status:12
			DB_SaveRecord(->[CONTACTS:1])
			AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		End if 
		NEXT RECORD:C51([CONTACTS:1])
	End while 
End if 
ERR_MethodTrackerReturn("Comp_ContUpdate"; $_t_oldMethodName)
