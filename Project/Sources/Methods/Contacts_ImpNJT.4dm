//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_ImpNJT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_DateAdded)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; MOD_FieldValue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_ImpNJT")
CREATE RECORD:C68([CONTACTS:1])
Contact_Code
[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
CREATE RECORD:C68([CONTACTS_COMPANIES:145])
[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)

[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
If ($2="")
	If (($1="The @") | ($1="@manag@") | ($1="@&@") | ($1="@Director@") | ($1="@Director@") | ($1="@asst@") | ($1="@ENG'R@") | ($1="@ENG'R@"))
		$2:=$1
		$1:=""
	End if 
End if 
If ($1#"")
	If (($1="Mr @") | ($1="Mrs @") | ($1="Ms @") | ($1="Miss @") | ($1="Dr @") | ($1="Lord @") | ($1="Lady @") | ($1="Sir @"))
		[CONTACTS:1]Title:3:=FirstWord($1)
		$1:=Substring:C12($1; Length:C16([CONTACTS:1]Title:3)+2; 50)
	End if 
	[CONTACTS:1]Forename:4:=FirstWord($1)
	$1:=Substring:C12($1; Length:C16([CONTACTS:1]Forename:4)+2; 50)
	[CONTACTS:1]Surname:5:=FirstWord($1)
	While (Length:C16([CONTACTS:1]Surname:5)=1)
		[CONTACTS:1]Forename:4:=[CONTACTS:1]Forename:4+" "+[CONTACTS:1]Surname:5
		$1:=Substring:C12($1; Length:C16([CONTACTS:1]Surname:5)+2; 50)
		[CONTACTS:1]Surname:5:=FirstWord($1)
	End while 
	MOD_FieldValue:=""
	RemoveLeadTr(Substring:C12($1; Length:C16([CONTACTS:1]Surname:5)+2; 50); ->MOD_FieldValue)
	$1:=MOD_FieldValue
	If ($1#"")
		[CONTACTS:1]Qualifications:13:=$1
	End if 
End if 
If (([CONTACTS:1]Forename:4#"") & ([CONTACTS:1]Surname:5=""))
	[CONTACTS:1]Surname:5:=[CONTACTS:1]Forename:4
	[CONTACTS:1]Forename:4:=""
End if 
[CONTACTS:1]Job_Title:6:=$2
If (Count parameters:C259>2)
	[CONTACTS:1]Salutation:7:=$3
End if 
DB_SaveRecord(->[CONTACTS:1])
AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
ERR_MethodTrackerReturn("Contacts_ImpNJT"; $_t_oldMethodName)
