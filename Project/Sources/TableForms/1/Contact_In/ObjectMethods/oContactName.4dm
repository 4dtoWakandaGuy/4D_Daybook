If (False:C215)
	//object Name: [CONTACTS]Contact_In.Field33
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(AA_at_ProffesionallAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefix;0)
	C_LONGINT:C283($_l_SalutationRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.Field33"; Form event code:C388)
AA_LoadNameArrays
AA_ParseName(Self:C308->; 0; ->[CONTACTS:1]Title:3; ->[CONTACTS:1]Forename:4; ->[CONTACTS:1]Surname:5; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
If ([CONTACTS:1]Title:3#"")
	//to ensure capitalization is correct
	$_l_SalutationRow:=Find in array:C230(AA_at_Salutations; [CONTACTS:1]Title:3)
	If ($_l_SalutationRow>0)
		[CONTACTS:1]Title:3:=AA_at_Salutations{$_l_SalutationRow}
	End if 
End if 
[CONTACTS:1]Contact_Name:31:=CON_BuildContactName
ERR_MethodTrackerReturn("OBJ [CONTACTS].Contact_In.Field33"; $_t_oldMethodName)
