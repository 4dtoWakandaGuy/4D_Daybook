If (False:C215)
	//object Name: [CONTACTS]dAsk_NewCont.Variable21
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
	C_LONGINT:C283($_l_AddedItemID; $_l_ListID; $_l_SalutationID; r1; r2; xCancel; xNew; xOK)
	C_TEXT:C284($_t_oldMethodName; Vcompname; Vforename; Vpostcode; Vsurname; Vtitle; Vtitle2; Vtown; VwholeName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dAsk_NewCont.Variable21"; Form event code:C388)
If (Vtitle2#"")
	$_l_SalutationID:=Find in array:C230(AA_at_Salutations; Vtitle2)
	If ($_l_SalutationID<0)
		//to make sure we dont add twice
		$_l_ListID:=AA_GetListID(0; 0; "Titles")
		$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; Vtitle2)
		
	End if 
	AA_LoadNameArrays
	Vtitle:=Vtitle2
	Vtitle2:=""
	If (Vforename#"") | (Vsurname#"")
		VwholeName:=Vtitle+" "+Vforename+" "+Vsurname
		AA_ParseName(VwholeName; 0; ->Vtitle; ->vForename; ->vSurname; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
	End if 
	OBJECT SET ENTERABLE:C238(Vcompname; True:C214)
	OBJECT SET ENTERABLE:C238(Vtown; True:C214)
	OBJECT SET ENTERABLE:C238(Vpostcode; True:C214)
	OBJECT SET ENABLED:C1123(r1; True:C214)
	OBJECT SET ENABLED:C1123(r2; True:C214)
	OBJECT SET ENABLED:C1123(xNew; True:C214)
	OBJECT SET ENABLED:C1123(xCancel; True:C214)
	OBJECT SET ENABLED:C1123(xOK; True:C214)
	FORM GOTO PAGE:C247(2)
	If (AA_at_Salutations{Size of array:C274(AA_at_Salutations)}#"Add Salutation")
		INSERT IN ARRAY:C227(AA_at_Salutations; 9999; 2)
		AA_at_Salutations{Size of array:C274(AA_at_Salutations)-1}:="-"
		AA_at_Salutations{Size of array:C274(AA_at_Salutations)}:="Add Salutation"
	End if 
	
Else 
	OBJECT SET ENTERABLE:C238(Vcompname; True:C214)
	OBJECT SET ENTERABLE:C238(Vtown; True:C214)
	OBJECT SET ENTERABLE:C238(Vpostcode; True:C214)
	OBJECT SET ENABLED:C1123(r1; True:C214)
	OBJECT SET ENABLED:C1123(r2; True:C214)
	OBJECT SET ENABLED:C1123(xNew; True:C214)
	OBJECT SET ENABLED:C1123(xCancel; True:C214)
	OBJECT SET ENABLED:C1123(xOK; True:C214)
	FORM GOTO PAGE:C247(2)
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dAsk_NewCont.Variable21"; $_t_oldMethodName)
