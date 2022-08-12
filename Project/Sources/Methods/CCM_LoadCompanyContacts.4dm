//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_LoadCompanyContacts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>CC_al_CardOwnerTable;0)
	//ARRAY LONGINT(<>CC_al_CardOwnerXID;0)
	//ARRAY TEXT(<>CC_at_CardOwnerRange;0)
	C_LONGINT:C283($_l_ContactsIndex; $_l_CurrentRow; $1; $2)
	C_TEXT:C284($_t_CompanyCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_LoadCompanyContacts")
//This method is called when the option to assign contact cards to the company has been selected in the prefs
//this will find all contacts of the company whoses ID is passed in $2. Check if the have any cards that are designated as company
//and then load the data into arrays whcih can be used and disposed of by the calling method.
If (Count parameters:C259>=2)
	READ ONLY:C145(*)
	ARRAY TEXT:C222(<>CC_at_CardOwnerRange; 99)
	ARRAY LONGINT:C221(<>CC_al_CardOwnerTable; 99)
	ARRAY LONGINT:C221(<>CC_al_CardOwnerXID; 99)
	$_l_CurrentRow:=0
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2)
	$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
	While (Semaphore:C143("$Inserting"+"◊CC_at_CardOwnerRange"))
		DelayTicks
	End while 
	If ($_t_CompanyCode#"")
		//note that the card can only be assigned to their main company
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$_t_CompanyCode)
		
		For ($_l_ContactsIndex; 1; Records in selection:C76([CONTACTS:1]))
			If ([CONTACTS:1]x_ID:33#$1)
				QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]RelatedTableNumber:12=Table:C252(->[CONTACTS:1]); *)
				QUERY:C277([xCreditCardDetails:132];  & ; [xCreditCardDetails:132]RelatedRecordIdent:13=[CONTACTS:1]x_ID:33; *)
				QUERY:C277([xCreditCardDetails:132];  & ; [xCreditCardDetails:132]xDeleted:18=0; *)
				QUERY:C277([xCreditCardDetails:132];  & ; [xCreditCardDetails:132]CardHolderClass:2=1)
				If (Records in selection:C76([xCreditCardDetails:132])>0)
					$_l_CurrentRow:=$_l_CurrentRow+1
					If ($_l_CurrentRow>Size of array:C274(<>CC_at_CardOwnerRange))
						INSERT IN ARRAY:C227(<>CC_at_CardOwnerRange; Size of array:C274(<>CC_at_CardOwnerRange)+1; 99)
						INSERT IN ARRAY:C227(<>CC_al_CardOwnerTable; Size of array:C274(<>CC_al_CardOwnerTable)+1; 99)
						INSERT IN ARRAY:C227(<>CC_al_CardOwnerXID; Size of array:C274(<>CC_al_CardOwnerXID)+1; 99)
					End if 
					<>CC_at_CardOwnerRange{$_l_CurrentRow}:=[CONTACTS:1]Contact_Name:31
					<>CC_al_CardOwnerTable{$_l_CurrentRow}:=Table:C252(->[CONTACTS:1])
					<>CC_al_CardOwnerXID{$_l_CurrentRow}:=[CONTACTS:1]x_ID:33
					
				End if 
			End if 
			NEXT RECORD:C51([CONTACTS:1])
		End for 
		
	End if 
	ARRAY TEXT:C222(<>CC_at_CardOwnerRange; $_l_CurrentRow)
	ARRAY LONGINT:C221(<>CC_al_CardOwnerTable; $_l_CurrentRow)
	ARRAY LONGINT:C221(<>CC_al_CardOwnerXID; $_l_CurrentRow)
	CLEAR SEMAPHORE:C144("$Inserting"+"◊CC_at_CardOwnerRange")
End if 

//
ERR_MethodTrackerReturn("CCM_LoadCompanyContacts"; $_t_oldMethodName)