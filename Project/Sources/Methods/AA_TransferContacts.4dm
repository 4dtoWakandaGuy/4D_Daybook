//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_TransferContacts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:           06/08/2010 13:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_DateAdded)
	//ARRAY TEXT(AA_at_ProffesionalAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_Forenames; $_t_oldMethodName; $_t_Salutation; $_t_Surnames)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_TransferContacts")
READ WRITE:C146([COMPANIES:2])
ALL RECORDS:C47([COMPANIES:2])
AA_LoadNameArrays
$_ti_DocumentRef:=Create document:C266(""; "TEXT")
For ($_l_Index; 1; Records in selection:C76([COMPANIES:2]))
	MESSAGE:C88([COMPANIES:2]Company_Name:2)
	
	SEND PACKET:C103($_ti_DocumentRef; [COMPANIES:2]Company_Code:1+Char:C90(9))
	SEND PACKET:C103($_ti_DocumentRef; [COMPANIES:2]Company_Name:2+Char:C90(9))
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
	If (Records in selection:C76([CONTACTS:1])>0)
		QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Contact_Code:2#"")
		If (Records in selection:C76([CONTACTS:1])>0)
			SEND PACKET:C103($_ti_DocumentRef; "Would not transfer"+Char:C90(13))
		Else 
			SEND PACKET:C103($_ti_DocumentRef; "Would  transfer"+Char:C90(13))
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
			QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Contact_Code:2="")
			If (Records in selection:C76([CONTACTS:1])>1)
				DELETE SELECTION:C66([CONTACTS:1])
				CREATE RECORD:C68([CONTACTS:1])
			End if 
			Contact_Code
			[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
			[CONTACTS:1]Contact_Name:31:=[COMPANIES:2]Company_Name:2
			$_t_Salutation:=[CONTACTS:1]Title:3
			$_t_Forenames:=[CONTACTS:1]Forename:4
			$_t_Surnames:=[CONTACTS:1]Surname:5
			AA_ParseName([CONTACTS:1]Contact_Name:31; 0; ->[CONTACTS:1]Title:3; ->[CONTACTS:1]Forename:4; ->[CONTACTS:1]Surname:5; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
			[CONTACTS:1]Forename:4:=Uppers2([CONTACTS:1]Forename:4; 1)
			[CONTACTS:1]Surname:5:=Uppers2(UppersSurname([CONTACTS:1]Surname:5); 1)
			[CONTACTS:1]Status:14:=[COMPANIES:2]Status:12
			[CONTACTS:1]Comments:10:=[COMPANIES:2]Comments:30
			If ([COMPANIES:2]Email_Before_At:58#"") & ([COMPANIES:2]EMail_After_At:55#"")
				[CONTACTS:1]Email_Before_At:30:=[COMPANIES:2]Email_Before_At:58
				[CONTACTS:1]EMail_After_At:24:=[COMPANIES:2]EMail_After_At:55
			End if 
			[CONTACTS:1]Entry_Date:17:=[COMPANIES:2]Entry_Date:16
			[CONTACTS:1]Sales_Person:25:=[COMPANIES:2]Sales_Person:29
			[CONTACTS:1]Taken_by:29:=[COMPANIES:2]Taken_By:26
			[CONTACTS:1]x_ID:33:=AA_GetNextID(->[CONTACTS:1]x_ID:33)
			DB_SaveRecord(->[CONTACTS:1])
			[COMPANIES:2]Private:37:=True:C214
			[COMPANIES:2]Company_Name:2:=""
			DB_SaveRecord(->[COMPANIES:2])
			CREATE RECORD:C68([CONTACTS_COMPANIES:145])
			[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
			[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
			[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
			DB_SaveRecord(->[CONTACTS_COMPANIES:145])
			READ WRITE:C146([ORDERS:24])
			QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=[COMPANIES:2]Company_Code:1)
			APPLY TO SELECTION:C70([ORDERS:24]; [ORDERS:24]Contact_Code:2:=[CONTACTS:1]Contact_Code:2)
			READ WRITE:C146([INVOICES:39])
			QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=[COMPANIES:2]Company_Code:1)
			APPLY TO SELECTION:C70([INVOICES:39]; [INVOICES:39]Contact_Code:3:=[CONTACTS:1]Contact_Code:2)
			
		End if 
	Else 
		SEND PACKET:C103($_ti_DocumentRef; "Would  transfer"+Char:C90(13))
		CREATE RECORD:C68([CONTACTS:1])
		Contact_Code
		[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
		[CONTACTS:1]Contact_Name:31:=[COMPANIES:2]Company_Name:2
		$_t_Salutation:=[CONTACTS:1]Title:3
		$_t_Forenames:=[CONTACTS:1]Forename:4
		$_t_Surnames:=[CONTACTS:1]Surname:5
		AA_ParseName([CONTACTS:1]Contact_Name:31; 0; ->[CONTACTS:1]Title:3; ->[CONTACTS:1]Forename:4; ->[CONTACTS:1]Surname:5; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
		[CONTACTS:1]Forename:4:=Uppers2([CONTACTS:1]Forename:4; 1)
		[CONTACTS:1]Surname:5:=Uppers2(UppersSurname([CONTACTS:1]Surname:5); 1)
		[CONTACTS:1]Status:14:=[COMPANIES:2]Status:12
		[CONTACTS:1]Comments:10:=[COMPANIES:2]Comments:30
		If ([COMPANIES:2]Email_Before_At:58#"") & ([COMPANIES:2]EMail_After_At:55#"")
			[CONTACTS:1]Email_Before_At:30:=[COMPANIES:2]Email_Before_At:58
			[CONTACTS:1]EMail_After_At:24:=[COMPANIES:2]EMail_After_At:55
		End if 
		[CONTACTS:1]Entry_Date:17:=[COMPANIES:2]Entry_Date:16
		[CONTACTS:1]Sales_Person:25:=[COMPANIES:2]Sales_Person:29
		[CONTACTS:1]Taken_by:29:=[COMPANIES:2]Taken_By:26
		[CONTACTS:1]x_ID:33:=AA_GetNextID(->[CONTACTS:1]x_ID:33)
		
		DB_SaveRecord(->[CONTACTS:1])
		[COMPANIES:2]Private:37:=True:C214
		[COMPANIES:2]Company_Name:2:=""
		DB_SaveRecord(->[COMPANIES:2])
		CREATE RECORD:C68([CONTACTS_COMPANIES:145])
		[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
		[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
		[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
		DB_SaveRecord(->[CONTACTS_COMPANIES:145])
		READ WRITE:C146([ORDERS:24])
		QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=[COMPANIES:2]Company_Code:1)
		APPLY TO SELECTION:C70([ORDERS:24]; [ORDERS:24]Contact_Code:2:=[CONTACTS:1]Contact_Code:2)
		READ WRITE:C146([INVOICES:39])
		QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=[COMPANIES:2]Company_Code:1)
		APPLY TO SELECTION:C70([INVOICES:39]; [INVOICES:39]Contact_Code:3:=[CONTACTS:1]Contact_Code:2)
		
	End if 
	NEXT RECORD:C51([COMPANIES:2])
End for 
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("AA_TransferContacts"; $_t_oldMethodName)
