//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_Check
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
	C_BOOLEAN:C305(<>ContCheck; <>MultiCo)
	C_TEXT:C284($_t_AddressType; $_t_ContactCode; $_t_ForeName; $_t_oldMethodName; $_t_Surname)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_Check")
If (([CONTACTS:1]Forename:4#"") & ([CONTACTS:1]Surname:5#"") & (Old:C35([CONTACTS:1]Forename:4)="") & (Old:C35([CONTACTS:1]Surname:5)="") & (<>ContCheck) & (<>MultiCo))
	$_t_ForeName:=[CONTACTS:1]Forename:4
	$_t_Surname:=[CONTACTS:1]Surname:5
	$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
	DB_SaveRecord(->[CONTACTS:1])
	AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
	COPY NAMED SELECTION:C331([CONTACTS:1]; "$Contacts")
	CREATE SET:C116([CONTACTS:1]; "Master")
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_ForeName; *)
	QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_Surname; *)
	QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Contact_Code:2#$_t_ContactCode)
	If (Records in selection:C76([CONTACTS:1])>0)
		
		If (Records in selection:C76([CONTACTS:1])=1)
			Gen_Confirm("There is already a Contact of that name, allocated to "+[CONTACTS:1]Company_Code:1+Char:C90(13)+Char:C90(13)+"Do you want to add this Company/Address to the existing Contact, or to allow the"+" duplicate Contact?"; "Existing"; "Duplicate")
			If (OK=1)
				$_t_AddressType:="WORK"
				$_t_AddressType:=Gen_Request("Address Type:"; $_t_AddressType)
				If (OK=1)
					CREATE RECORD:C68([CONTACTS_COMPANIES:145])
					[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
					[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
					[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145])
					[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
					[CONTACTS_COMPANIES:145]Address_Type:2:=$_t_AddressType
					DB_SaveRecord(->[CONTACTS_COMPANIES:145])
					
					DB_SaveRecord(->[CONTACTS:1])
					AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
					ADD TO SET:C119([CONTACTS:1]; "Master")
					USE NAMED SELECTION:C332("$Contacts")
					CLEAR NAMED SELECTION:C333("$Contacts")
					DB_DeletionControl(->[CONTACTS:1])
					
					DELETE RECORD:C58([CONTACTS:1])
					USE SET:C118("Master")
				End if 
			Else 
				USE NAMED SELECTION:C332("$Contacts")
				CLEAR NAMED SELECTION:C333("$Contacts")
			End if 
		Else 
			Gen_Confirm("There are already "+String:C10(Records in selection:C76([CONTACTS:1]))+" Contacts of that name."+Char:C90(13)+Char:C90(13)+"Do you want to check for duplicates, or to continue anyway?"; "Check"; "Continue")
			If (OK=1)
				
			End if 
		End if 
		
	Else 
		USE NAMED SELECTION:C332("$Contacts")
		CLEAR NAMED SELECTION:C333("$Contacts")
	End if 
End if 
ERR_MethodTrackerReturn("Cont_Check"; $_t_oldMethodName)
