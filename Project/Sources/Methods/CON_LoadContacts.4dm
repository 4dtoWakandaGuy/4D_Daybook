//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_LoadContacts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 17:57:29If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_abo_ContactMod;0)
	//ARRAY BOOLEAN(CON_abo_ContactMod;0)
	//ARRAY TEXT(CON_aS21_ContractCode;0)
	//ARRAY TEXT(CON_at_ContactCodes;0)
	//ARRAY TEXT(CON_at_ContactName;0)
	//ARRAY TEXT(CON_at_ContractCode;0)
	//ARRAY TEXT(CON_at_DelContactCodes;0)
	C_LONGINT:C283($_l_ContactsIndex; $_l_offset; bCON_l_Delete; bCON_l_modify; CON_l_CurrentContactStatus)
	C_TEXT:C284($_t_oldMethodName; CON_t_CurContactCode; CON_t_CurContactName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_LoadContacts")
//NG new method May 2004
//This method loads the contract contact sub records to an array for display on the Contracts_Input form
If (BLOB size:C605([CONTRACTS:17]xContactCodes:15)=0)
	
	ARRAY TEXT:C222(CON_at_ContactCodes; 0)
	ARRAY TEXT:C222(CON_at_ContactName; 0)
	ARRAY TEXT:C222(CON_at_DelContactCodes; 0)
	ARRAY BOOLEAN:C223(CON_abo_ContactMod; 0)
	QUERY:C277([CONTRACTS_CONTACTS:151]; [CONTRACTS_CONTACTS:151]Contract_Code:3=[CONTRACTS:17]Contract_Code:3)
	ARRAY TEXT:C222(CON_at_ContractCode; Records in selection:C76([CONTRACTS_CONTACTS:151]))
	For ($_l_ContactsIndex; 1; Records in selection:C76([CONTRACTS_CONTACTS:151]))
		CON_at_ContractCode{$_l_ContactsIndex}:=[CONTRACTS_CONTACTS:151]Contact_Code:1
		NEXT RECORD:C51([CONTRACTS_CONTACTS:151])
		
	End for 
	ARRAY TEXT:C222(CON_at_ContactName; Size of array:C274(CON_at_ContactCodes))
	ARRAY BOOLEAN:C223(CON_abo_ContactMod; Size of array:C274(CON_at_ContactCodes))
	OBJECT SET VISIBLE:C603(bCON_l_modify; True:C214)
	OBJECT SET TITLE:C194(bCON_l_modify; "Add")
	
	OBJECT SET VISIBLE:C603(bCON_l_Delete; False:C215)
	OBJECT SET VISIBLE:C603(CON_t_CurContactCode; False:C215)
	OBJECT SET VISIBLE:C603(CON_t_CurContactName; False:C215)
	CON_l_CurrentContactStatus:=0
	
	For ($_l_ContactsIndex; Size of array:C274(CON_at_ContactName); 1; -1)
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=CON_at_ContractCode{$_l_ContactsIndex})
		If (Records in selection:C76([CONTACTS:1])=0) | ([CONTACTS:1]Deleted:32=1)
			INSERT IN ARRAY:C227(CON_at_DelContactCodes; Size of array:C274(CON_at_DelContactCodes)+1; 1)
			CON_at_DelContactCodes{Size of array:C274(CON_at_DelContactCodes)}:=CON_at_ContractCode{$_l_ContactsIndex}
			DELETE FROM ARRAY:C228(CON_at_ContractCode; $_l_ContactsIndex)
			DELETE FROM ARRAY:C228(CON_at_ContactName; $_l_ContactsIndex)
		Else 
			CON_at_ContactName{$_l_ContactsIndex}:=[CONTACTS:1]Contact_Name:31
		End if 
	End for 
Else 
	//[CONTRACTS]xContactCodes
	QUERY:C277([CONTRACTS_CONTACTS:151]; [CONTRACTS_CONTACTS:151]Contract_Code:3=[CONTRACTS:17]Contract_Code:3)
	
	ARRAY TEXT:C222(CON_at_ContactCodes; 0)
	ARRAY TEXT:C222(CON_at_ContactName; 0)
	ARRAY TEXT:C222(CON_at_DelContactCodes; 0)
	ARRAY BOOLEAN:C223(CON_abo_ContactMod; 0)
	$_l_offset:=0
	BLOB TO VARIABLE:C533([CONTRACTS:17]xContactCodes:15; CON_at_ContactCodes; $_l_offset)
	
	ARRAY TEXT:C222(CON_at_ContactName; Size of array:C274(CON_at_ContactCodes))
	ARRAY BOOLEAN:C223(CON_abo_ContactMod; Size of array:C274(CON_at_ContactCodes))
	OBJECT SET VISIBLE:C603(bCON_l_modify; True:C214)
	OBJECT SET TITLE:C194(bCON_l_modify; "Add")
	
	OBJECT SET VISIBLE:C603(bCON_l_Delete; False:C215)
	OBJECT SET VISIBLE:C603(CON_t_CurContactCode; False:C215)
	OBJECT SET VISIBLE:C603(CON_t_CurContactName; False:C215)
	CON_l_CurrentContactStatus:=0
	
	For ($_l_ContactsIndex; Size of array:C274(CON_at_ContactName); 1; -1)
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=CON_at_ContractCode{$_l_ContactsIndex})
		If (Records in selection:C76([CONTACTS:1])=0) | ([CONTACTS:1]Deleted:32=1)
			INSERT IN ARRAY:C227(CON_at_DelContactCodes; Size of array:C274(CON_at_DelContactCodes)+1; 1)
			CON_at_DelContactCodes{Size of array:C274(CON_at_DelContactCodes)}:=CON_at_ContractCode{$_l_ContactsIndex}
			DELETE FROM ARRAY:C228(CON_at_ContractCode; $_l_ContactsIndex)
			DELETE FROM ARRAY:C228(CON_at_ContactName; $_l_ContactsIndex)
		Else 
			CON_at_ContactName{$_l_ContactsIndex}:=[CONTACTS:1]Contact_Name:31
		End if 
	End for 
	
End if 
ERR_MethodTrackerReturn("CON_LoadContacts"; $_t_oldMethodName)