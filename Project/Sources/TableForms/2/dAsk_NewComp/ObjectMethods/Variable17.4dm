If (False:C215)
	//object Name: [COMPANIES]dAsk_NewComp.Variable17
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
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
	C_LONGINT:C283($_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_SalutationsRow; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_TEXT:C284($_t_oldMethodName; $_t_Surname; vCompName; vForename; vSurname; Vtitle; VWholeName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_NewComp.Variable17"; Form event code:C388)
//$1 is the whole name
//$2 is either 0 or 1 (0 if no surname suffix 1 if surname suffix)
//$3 pointer to the variable to return title in
//$4 pointer to  the variable to return 1st names in
//$5 pointer to the variable to return surnames in
//Optional
//$6  pointer to the array of titles
//$7 pointer to the array of surname prefixes
//$8 pointer to the array of surname suffixes
//$9 Pointer to the variable to return surname suffixes in

AA_LoadNameArrays
AA_ParseName(Self:C308->; 0; ->Vtitle; ->vForename; ->vSurname; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
vForename:=Uppers2(vForename; 1)
vSurname:=Uppers2(UppersSurname(vSurname); 1)
VWholeName:=""

If (Vtitle#"")
	//to ensure capitalization is correct
	$_l_SalutationsRow:=Find in array:C230(AA_at_Salutations; VTitle)
	If ($_l_SalutationsRow>0)
		Vtitle:=AA_at_Salutations{$_l_SalutationsRow}
	End if 
	If (Vtitle#"")
		VWholeName:=Vtitle
	End if 
End if 

If (VForename#"")
	If (VWholeName#"")
		VWholeName:=VWholeName+" "+VForename
	Else 
		VWholeName:=VForename
	End if 
End if 
If (Vsurname#"")
	If (VWholeName#"")
		VWholeName:=VWholeName+" "+Vsurname
	Else 
		VWholeName:=Vsurname
	End if 
End if 
OBJECT GET COORDINATES:C663(vCompName; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
If (VForename#"")
	$_t_Surname:=DB_DeDupContact(Vsurname; ->[CONTACTS:1]Soundex:37; ->[CONTACTS:1]Forename:4; VForename[[1]]; $_l_WindowLeft+$_l_ObjectLeft; $_l_ObjectTop+$_l_windowTop)
Else 
	$_t_Surname:=DB_DeDupContact(Vsurname; ->[CONTACTS:1]Soundex:37; ->[CONTACTS:1]Forename:4; VForename; $_l_WindowLeft+$_l_ObjectLeft; $_l_ObjectTop+$_l_windowTop)
End if 
SHOW WINDOW:C435
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_NewComp.Variable17"; $_t_oldMethodName)
