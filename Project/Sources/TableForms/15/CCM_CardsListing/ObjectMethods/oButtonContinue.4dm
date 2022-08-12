If (False:C215)
	//object Name: [USER]CCM_CardsListing.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_CardRecordIDs;0)
	//ARRAY TEXT(CCM_at_CardTypes;0)
	C_LONGINT:C283($_l_event; $_l_SelectedRow; CCM_l_SelectedCard)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_CardsListing.Variable8"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_SelectedRow:=CCM_at_CardTypes
		CCM_l_SelectedCard:=CCM_al_CardRecordIDs{$_l_SelectedRow}
		CANCEL:C270
End case 
ERR_MethodTrackerReturn("OBJ [USER].CCM_CardsListing.Variable8"; $_t_oldMethodName)
