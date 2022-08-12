//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_SelMCRel
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
	//C_UNKNOWN(Address_Status)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_CompanyCodes2; 0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_SelMCRel")
CREATE EMPTY SET:C140([COMPANIES:2]; "Extra2")
CREATE EMPTY SET:C140([COMPANIES:2]; "Extra")

If (Records in selection:C76([CONTACTS:1])>0)
	CREATE EMPTY SET:C140([COMPANIES:2]; "Extra2")
	CREATE EMPTY SET:C140([COMPANIES:2]; "Extra")
	Sel_LinkMess(->[CONTACTS:1])
	If (OK=1)
		CREATE EMPTY SET:C140([COMPANIES:2]; "Extra")
		SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_ContactCodes; [CONTACTS:1]Company_Code:1; $_at_CompanyCodes2)
		QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
		QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Company_Code:1; $_at_CompanyCodes)
		QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
		CREATE SET:C116([COMPANIES:2]; "Extra")
		QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes2)
		CREATE SET:C116([COMPANIES:2]; "Extra2")
		UNION:C120("Extra2"; "Extra"; "Extra2")
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
		CREATE SET:C116([COMPANIES:2]; "Extra3")
		INTERSECTION:C121("Extra2"; "Extra3"; "Extra2")
		CLEAR SET:C117("Extra3")
		UNION:C120("Extra"; "Extra2"; "Extra")
	End if 
	CLEAR SET:C117("Extra2")
	USE SET:C118("Extra")
	
End if 
ERR_MethodTrackerReturn("Comp_SelMCRel"; $_t_oldMethodName)
