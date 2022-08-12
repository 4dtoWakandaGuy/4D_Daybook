//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_MultiCoP
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
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_MultiCoP")
If ([USER:15]Multi Co Cont:87)
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1#"")
	CREATE SET:C116([CONTACTS:1]; "$Set1")
	QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1#"@"; *)
	QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
	SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
	QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
	CREATE SET:C116([CONTACTS:1]; "$Set2")
	INTERSECTION:C121("$Set1"; "$Set2"; "$Set1")
	USE SET:C118("$Set1")
	If (Records in selection:C76([CONTACTS:1])>0)
		Gen_Alert("You must update existing Contacts to 3.5.007 format before use."+"  This may take some time."; "")
		If (OK=1)
			ALL RECORDS:C47([CONTACTS:1])
			Cont_MultiCo
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Cont_MultiCoP"; $_t_oldMethodName)
