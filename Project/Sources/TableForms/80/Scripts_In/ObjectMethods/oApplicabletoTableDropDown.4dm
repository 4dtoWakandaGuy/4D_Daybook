If (False:C215)
	//object Name: [SCRIPTS]Scripts_in.Variable13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/04/2013 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	C_LONGINT:C283($_l_TableRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Scripts_in.Variable13"; Form event code:C388)
If (GEN_at_Identity=0)
	GEN_at_Identity:=1
End if 
If (GEN_at_Identity>1)
	$_l_TableRow:=DB_GetTableNumFromNameString(GEN_at_Identity{GEN_at_Identity})
	
	[SCRIPTS:80]Table_Number:8:=<>DB_al_TableNums{$_l_TableRow}
Else 
	[SCRIPTS:80]Table_Number:8:=0
End if 
ERR_MethodTrackerReturn("OBJ:Script_In,GEN_at_Identity"; $_t_oldMethodName)
