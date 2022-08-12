If (False:C215)
	//object Name: [SALES_PROJECTION]SalesProjectionEntry.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 18:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_BOOLEAN:C305(<>MultiCo)
	C_LONGINT:C283($_l_CompanyID; $_l_event; $_l_PersonID)
	C_TEXT:C284($_t_oldMethodName; SP_t_SalesProjectionCompany; SP_t_SalesProjectionContact)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].SalesProjectionEntry.Variable6"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		$_l_CompanyID:=[SALES_PROJECTION:113]CompanyID:6
		$_l_PersonID:=Check_ContactID(->SP_t_SalesProjectionContact; ->[SALES_PROJECTION:113]CompanyID:6; ->[SALES_PROJECTION:113])
		If ($_l_PersonID>0)
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$_l_PersonID)
			SP_t_SalesProjectionContact:=[CONTACTS:1]Contact_Name:31
			[SALES_PROJECTION:113]ContactID:7:=[CONTACTS:1]x_ID:33
			If ([SALES_PROJECTION:113]CompanyID:6>0)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=[SALES_PROJECTION:113]CompanyID:6)
				If (<>MultiCo)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=[SALES_PROJECTION:113]ContactID:7)
					CREATE SET:C116([CONTACTS:1]; "$Set1")
					QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
					QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
					SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
					QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
					CREATE SET:C116([CONTACTS:1]; "$Set2")
					INTERSECTION:C121("$Set1"; "$Set2"; "$Set1")
					USE SET:C118("$Set1")
					
				Else 
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=[SALES_PROJECTION:113]ContactID:7; *)
					QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
				End if 
				If (Records in selection:C76([CONTACTS:1])=0)
					[SALES_PROJECTION:113]CompanyID:6:=0
					SP_t_SalesProjectionCompany:=""
				Else 
					SP_t_SalesProjectionCompany:=[COMPANIES:2]Company_Name:2
				End if 
			Else 
				If (<>MultiCo)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
					SP_t_SalesProjectionCompany:=[COMPANIES:2]Company_Name:2
					[SALES_PROJECTION:113]CompanyID:6:=[COMPANIES:2]x_ID:63
				Else 
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
					SP_t_SalesProjectionCompany:=[COMPANIES:2]Company_Name:2
					[SALES_PROJECTION:113]CompanyID:6:=[COMPANIES:2]x_ID:63
				End if 
				
				
			End if 
			
		Else 
			SP_t_SalesProjectionContact:=""
			[SALES_PROJECTION:113]ContactID:7:=0
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:SalesProjectionEntry,SP_t_SalesProjectionContact"; $_t_oldMethodName)
