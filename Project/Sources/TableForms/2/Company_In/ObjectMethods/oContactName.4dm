If (False:C215)
	//object Name: [COMPANIES]Company_In.Field33
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
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
	C_LONGINT:C283($_l_event; $_l_SalutationsRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Field33"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		
		AA_LoadNameArrays
		AA_ParseName(Self:C308->; 0; ->[CONTACTS:1]Title:3; ->[CONTACTS:1]Forename:4; ->[CONTACTS:1]Surname:5; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
		If ([CONTACTS:1]Title:3#"")
			//to ensure capitalization is correct
			$_l_SalutationsRow:=Find in array:C230(AA_at_Salutations; [CONTACTS:1]Title:3)
			If ($_l_SalutationsRow>0)
				[CONTACTS:1]Title:3:=AA_at_Salutations{$_l_SalutationsRow}
			End if 
		End if 
		[CONTACTS:1]Contact_Name:31:=CON_BuildContactName
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.Field33"; $_t_oldMethodName)
