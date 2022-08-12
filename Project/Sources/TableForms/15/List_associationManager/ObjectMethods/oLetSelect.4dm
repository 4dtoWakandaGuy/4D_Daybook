If (False:C215)
	//object Name: [USER]List_associationManager.oLetSelect
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
	//ARRAY BOOLEAN(AA_abo_CheckMark;0)
	//ARRAY LONGINT(AA_al_TickMark;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_associationManager.oLetSelect"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)  // | ($_l_event=On Double Clicked )
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		AA_al_TickMark{$_l_Row}:=Abs:C99(AA_al_TickMark{$_l_Row}-1)
		AA_abo_CheckMark{$_l_Row}:=(AA_al_TickMark{$_l_Row}=1)
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].List_associationManager.oLetSelect"; $_t_oldMethodName)
