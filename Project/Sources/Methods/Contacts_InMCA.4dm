//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_InMCA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/02/2010 16:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	C_BOOLEAN:C305(CON_bo_AddFurthers)
	C_LONGINT:C283(vCT)
	C_TEXT:C284($_t_oldMethodName; CON_t_DisplayType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_InMCA")
//DEFAULT FILE([CONTACTS])
If (CON_bo_AddFurthers)
	DB_SaveRecord(->[CONTACTS_RECORD_ANALYSIS:144])
End if 
CON_bo_AddFurthers:=False:C215

QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)

[CONTACTS:1]Company_Code:1:=[CONTACTS_COMPANIES:145]Company_Code:1

[CONTACTS:1]Export:18:=[CONTACTS:1]Export:18
Gen_AutoProc
vCT:=0
//CustList_PopUp
ERR_MethodTrackerReturn("Contacts_InMCA"; $_t_oldMethodName)
