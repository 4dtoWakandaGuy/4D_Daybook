//%attributes = {}
If (False:C215)
	//Project Method Name:      DIA_GetDocRecipient
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   03/06/2010 19:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DIA_GetDocRecipient")

If ([DIARY:12]Document_Code:15#"")
	If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15)
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
	End if 
	Case of 
		: ([DOCUMENTS:7]Document_Class:14=4D Write Letter) | ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template)
			If ([DIARY:12]Contact_Code:2#"")
				If ([DIARY:12]Contact_Code:2#[CONTACTS:1]Contact_Code:2)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
				End if 
				$0:=[CONTACTS:1]Contact_Name:31
			Else 
				If ([DIARY:12]Company_Code:1#"")
					If ([COMPANIES:2]Company_Code:1#[DIARY:12]Company_Code:1)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
					End if 
					$0:=[COMPANIES:2]Company_Name:2
				Else 
					$0:="Recipiient unknown"
				End if 
			End if 
			
		: ([DOCUMENTS:7]Document_Class:14=Text Email) | ([DOCUMENTS:7]Document_Class:14=Text Email Template)
			If ([DIARY:12]Contact_Code:2#"")
				If ([DIARY:12]Contact_Code:2#[CONTACTS:1]Contact_Code:2)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
				End if 
				$0:=[CONTACTS:1]Email_Address:35
			Else 
				If ([DIARY:12]Company_Code:1#"")
					If ([COMPANIES:2]Company_Code:1#[DIARY:12]Company_Code:1)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
					End if 
					$0:=[COMPANIES:2]Email_Before_At:58+"@"+[COMPANIES:2]EMail_After_At:55
				Else 
					$0:="Recipiient unknown"
				End if 
			End if 
			
			
		Else 
			If ([DIARY:12]Contact_Code:2#"")
				If ([DIARY:12]Contact_Code:2#[CONTACTS:1]Contact_Code:2)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
				End if 
				$0:=[CONTACTS:1]Contact_Name:31
			Else 
				If ([DIARY:12]Company_Code:1#"")
					If ([COMPANIES:2]Company_Code:1#[DIARY:12]Company_Code:1)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
					End if 
					$0:=[COMPANIES:2]Company_Name:2
				Else 
					$0:="Recipiient unknown"
				End if 
			End if 
			
	End case 
Else 
	$0:="Recipiient unknown"
End if 
ERR_MethodTrackerReturn("DIA_GetDocRecipient"; $_t_oldMethodName)