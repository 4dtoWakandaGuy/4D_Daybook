//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_SelFComp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/03/2011 09:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_BOOLEAN:C305(<>MultiCo)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_SelFComp")
If (Count parameters:C259=1)
	If (<>MultiCo)
		Load_OneFast(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ->[CONTACTS_COMPANIES:145]; ->[CONTACTS_COMPANIES:145]Company_Code:1)
		QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		
		//and what we want is a selection of contacts
		If (Records in selection:C76([CONTACTS_COMPANIES:145])>0)
			SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
			QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
			CREATE SET:C116([CONTACTS:1]; "Master")
			USE SET:C118($1)
			INTERSECTION:C121("Master"; $1; "Master")
			USE SET:C118("Master")
			CREATE SET:C116([CONTACTS:1]; "Master")
		End if 
		
	Else 
		Load_OneFast(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ->[CONTACTS:1]; ->[CONTACTS:1]Company_Code:1; $1)
	End if 
Else 
	If (<>MultiCo)
		Join_SelFast(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ->[CONTACTS_COMPANIES:145]; ->[CONTACTS_COMPANIES:145]Company_Code:1)
		QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		
		If (Records in selection:C76([CONTACTS_COMPANIES:145])>0)
			SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
			QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
			CREATE SET:C116([CONTACTS:1]; "Master")
		End if 
	Else 
		Join_SelFast(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ->[CONTACTS:1]; ->[CONTACTS:1]Company_Code:1)
	End if 
	
End if 

QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32#1)
CREATE SET:C116([CONTACTS:1]; "Master")
ERR_MethodTrackerReturn("Cont_SelFComp"; $_t_oldMethodName)
