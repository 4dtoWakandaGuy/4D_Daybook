//%attributes = {}
If (False:C215)
	//Project Method Name:      CompContCreate
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
	C_TEXT:C284(<>DefRole; $_t_ForeName; $_t_Initials; $_t_oldMethodName; $_t_Surname)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CompContCreate")
QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)

SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)

If (([COMPANIES:2]Company_Name:2#"") & (Records in selection:C76([CONTACTS:1])=0))
	$_t_ForeName:=FirstWord([COMPANIES:2]Company_Name:2)
	$_t_Surname:=Substring:C12([COMPANIES:2]Company_Name:2; Length:C16($_t_ForeName)+2; 32000)
	$_t_Initials:=FirstWord($_t_Surname)
	If ($_t_Initials#$_t_Surname)
		$_t_ForeName:=$_t_ForeName+" "+$_t_Initials
		$_t_Surname:=Substring:C12($_t_Surname; Length:C16($_t_Initials)+2; 32000)
	End if 
	CREATE RECORD:C68([CONTACTS:1])
	Contact_Code
	[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
	
	CREATE RECORD:C68([CONTACTS_COMPANIES:145])
	[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
	[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
	[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145])
	[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
	DB_SaveRecord(->[CONTACTS_COMPANIES:145])
	
	[CONTACTS:1]Forename:4:=$_t_ForeName
	[CONTACTS:1]Surname:5:=$_t_Surname
	[CONTACTS:1]Entry_Date:17:=<>DB_d_CurrentDate
	[CONTACTS:1]Export:18:=Export_Stamp2([CONTACTS:1]Export:18)
	[CONTACTS:1]Omit:20:="N"
	[CONTACTS:1]Role:11:=<>DefRole
	DB_SaveRecord(->[CONTACTS:1])
	AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
End if 
ERR_MethodTrackerReturn("CompContCreate"; $_t_oldMethodName)
