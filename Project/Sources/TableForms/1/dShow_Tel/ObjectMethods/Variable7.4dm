If (False:C215)
	//object Name: [CONTACTS]dShow_Tel.Variable7
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
	//ARRAY TEXT(GEN_at_Identity;0)
	C_LONGINT:C283($_l_SelectedRow)
	C_TEXT:C284($_t_oldMethodName; $n; $no)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dShow_Tel.Variable7"; Form event code:C388)
$_l_SelectedRow:=GEN_at_Identity
If ($_l_SelectedRow=0)
	$_l_SelectedRow:=1
End if 
$No:=GEN_at_Identity{$_l_SelectedRow}
Gen_ShowTelDial($No)
ACCEPT:C269
ERR_MethodTrackerReturn("OBJ [CONTACTS].dShow_Tel.Variable7"; $_t_oldMethodName)
