
If (False:C215)
	//Object Name:      DB_ManageAddresses.oDelete
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  20/07/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(contactCode)
	//C_UNKNOWN(DeletedAddress)
	//ARRAY TEXT(CON_at_CoCodes;0)
	//ARRAY TEXT(CON_at_DeletedAddresses;0)
	C_COLLECTION:C1488($_col_DeletedCodes)
	C_LONGINT:C283($_l_Column; $_l_Row)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(*; "oAddressSelection"; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=Form:C1466.contactCode; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Company_Code:1=CON_at_CoCodes{$_l_Row})
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			If (Records in selection:C76([CONTACTS_COMPANIES:145])>0)
				Gen_Confirm("Are you sure you wish to remove this address from this contact?"; "Yes"; "No")
				If (OK=1)
					[CONTACTS_COMPANIES:145]Address_Status:5:=-1
					[CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*)
					DB_SaveRecord(->[CONTACTS_COMPANIES:145])
					
					$_col_DeletedCodes:=New collection:C1472
					APPEND TO ARRAY:C911(CON_at_DeletedAddresses; CON_at_CoCodes{$_l_Row})
					ARRAY TO COLLECTION:C1563($_col_DeletedCodes; CON_at_DeletedAddresses)
					Form:C1466.DeletedAddress:=$_col_DeletedCodes
					LISTBOX DELETE ROWS:C914(*; "oAddressSelection"; $_l_Row)
				End if 
			Else 
				$_col_DeletedCodes:=New collection:C1472
				APPEND TO ARRAY:C911(CON_at_DeletedAddresses; CON_at_CoCodes{$_l_Row})
				ARRAY TO COLLECTION:C1563($_col_DeletedCodes; CON_at_DeletedAddresses)
				Form:C1466.DeletedAddress:=$_col_DeletedCodes
				LISTBOX DELETE ROWS:C914(*; "oAddressSelection"; $_l_Row)
			End if 
		End if 
		
End case 
