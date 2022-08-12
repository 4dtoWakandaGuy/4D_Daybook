If (False:C215)
	//object Name: [USER]SalesProjectionEntry.Variable5
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
	C_BOOLEAN:C305(<>SYS_bo_ContactDuplicateCheck)
	C_LONGINT:C283($_l_CompanyID; $_l_event; SP_l_RelatedCompanyID; SP_l_RelatedContactID)
	C_TEXT:C284(<>DefRole; $_t_oldMethodName; SP_t_SalesProjectionCompany; SP_t_SalesProjectionContact)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SalesProjectionEntry.Variable5"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		$_l_CompanyID:=Check_CompanyID(->SP_t_SalesProjectionCompany; ->SP_l_RelatedContactID; ->[SALES_PROJECTION:113])
		If ($_l_CompanyID>0)
			SP_l_RelatedCompanyID:=$_l_CompanyID
			SP_t_SalesProjectionCompany:=SP_LoadCompany(SP_l_RelatedCompanyID)
			If (SP_l_RelatedContactID>0)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=SP_l_RelatedContactID; *)
				
				QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
				
				If (Records in selection:C76([CONTACTS:1])=0)
					//the person is not at that company
					SP_l_RelatedContactID:=0
					SP_t_SalesProjectionContact:=""
				End if 
			End if 
			
			
			//is there only one person
			If (SP_l_RelatedContactID=0)
				If ([COMPANIES:2]Private:37)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
					SP_l_RelatedContactID:=[CONTACTS:1]x_ID:33
					SP_t_SalesProjectionContact:=[CONTACTS:1]Contact_Name:31
				Else 
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
					QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32#1)
					Case of 
						: (Records in selection:C76([CONTACTS:1])=1)
							SP_l_RelatedContactID:=[CONTACTS:1]x_ID:33
							SP_t_SalesProjectionContact:=[CONTACTS:1]Contact_Name:31
						: (Records in selection:C76([CONTACTS:1])>1)
							If (<>DefRole#"")
								If ([CONTACTS:1]Role:11#<>DefRole)
									QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Role:11=<>DefRole; *)
									QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32#1)
									If (Records in selection:C76([CONTACTS:1])=0)
										If ([COMPANIES:2]Company_Code:1#"")
											QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
										End if 
										
										QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32#1)
									End if 
								Else 
									REDUCE SELECTION:C351([CONTACTS:1]; 1)
								End if 
							End if 
							If (<>SYS_bo_ContactDuplicateCheck) & (Records in selection:C76([CONTACTS:1])>1)
								QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Duplicate_State:26#""; *)
								QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Duplicate_State:26#"U@"; *)
								QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Duplicate_State:26#"D@"; *)
								QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32#1)
							End if 
							If (Records in selection:C76([CONTACTS:1])=1)
								SP_l_RelatedContactID:=[CONTACTS:1]x_ID:33
								SP_t_SalesProjectionContact:=[CONTACTS:1]Contact_Name:31
							End if 
							
						Else 
							SP_l_RelatedContactID:=0
							SP_t_SalesProjectionContact:=""
					End case 
					
					
				End if 
				
			End if 
			
			
		Else 
			SP_l_relatedCOmpanyID:=0
			SP_t_SalesProjectionCompany:=""
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SalesProjectionEntry.Variable5"; $_t_oldMethodName)
