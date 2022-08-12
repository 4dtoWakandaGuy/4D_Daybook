If (False:C215)
	//object Name: [SUBSCRIPTIONS]Subs_In.oDocumentSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2013 14:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SUBSCRIPTIONS].Subs_In.oDocumentSelect"; Form event code:C388)
QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=4D Write Letter Template; *)
QUERY:C277([DOCUMENTS:7];  | [DOCUMENTS:7]Document_Class:14=Text Email Template)
QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]X_Template_Type:30=0)
DBI_MenuSelectRecords(Table name:C256(Table:C252(->[DOCUMENTS:7])); False:C215)

If (OK=1)
	[SUBSCRIPTIONS:93]Renewals_Document_Reference:15:=[DOCUMENTS:7]Document_Code:1
End if 
ERR_MethodTrackerReturn("OBJ [SUBSCRIPTIONS].Subs_In.oDocumentSelect"; $_t_oldMethodName)
