If (False:C215)
	//object Name: [USER]SalesProjectionEntry.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 21:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>MultiCo)
	C_LONGINT:C283($_l_ContactID; $_l_event; $_l_RelatedCompanyID; SP_l_relatedCOmpanyID; SP_l_RelatedContactID)
	C_TEXT:C284($_t_oldMethodName; SP_t_SalesProjectionCompany; SP_t_SalesProjectionContact)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SalesProjectionEntry.Variable6"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		$_l_RelatedCompanyID:=SP_l_relatedCOmpanyID
		$_l_ContactID:=Check_ContactID(->SP_t_SalesProjectionContact; ->SP_l_relatedCompanyID; ->[SALES_PROJECTION:113])
		If ($_l_ContactID>0)
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$_l_ContactID)
			SP_t_SalesProjectionContact:=[CONTACTS:1]Contact_Name:31
			SP_l_RelatedContactID:=[CONTACTS:1]x_ID:33
			If (SP_l_RelatedCompanyID>0)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=SP_l_RelatedCompanyID)
				If (<>MultiCo)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=SP_l_RelatedContactID; *)
					QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
				Else 
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=SP_l_RelatedContactID; *)
					QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
				End if 
				If (Records in selection:C76([CONTACTS:1])=0)
					SP_l_RelatedCompanyID:=0
					SP_t_SalesProjectionCompany:=""
				Else 
					SP_t_SalesProjectionCompany:=[COMPANIES:2]Company_Name:2
				End if 
			Else 
				If (<>MultiCo)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
					SP_t_SalesProjectionCompany:=[COMPANIES:2]Company_Name:2
					SP_l_RelatedCompanyID:=[COMPANIES:2]x_ID:63
				Else 
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
					SP_t_SalesProjectionCompany:=[COMPANIES:2]Company_Name:2
					SP_l_RelatedCompanyID:=[COMPANIES:2]x_ID:63
				End if 
				
				
			End if 
			
		Else 
			SP_t_SalesProjectionContact:=""
			SP_l_RelatedContactID:=0
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SalesProjectionEntry.Variable6"; $_t_oldMethodName)
