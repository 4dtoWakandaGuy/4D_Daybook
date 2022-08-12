//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_MultiCo
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_MultiCo")
FIRST RECORD:C50([CONTACTS:1])
While (Not:C34(End selection:C36([CONTACTS:1])))
	If ([CONTACTS:1]Company_Code:1#"")
		QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
		QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		
		If ((Records in selection:C76([CONTACTS_COMPANIES:145])>0) & ([CONTACTS_COMPANIES:145]Company_Code:1#[CONTACTS:1]Company_Code:1))
			QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[CONTACTS:1]Company_Code:1)
		End if 
		If (Records in selection:C76([CONTACTS_COMPANIES:145])=0)
			CREATE RECORD:C68([CONTACTS_COMPANIES:145])
			[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
			[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
			[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
			
			[CONTACTS_COMPANIES:145]Company_Code:1:=[CONTACTS:1]Company_Code:1
			DB_SaveRecord(->[CONTACTS_COMPANIES:145])
			
		End if 
	End if 
	NEXT RECORD:C51([CONTACTS:1])
End while 
ERR_MethodTrackerReturn("Cont_MultiCo"; $_t_oldMethodName)
