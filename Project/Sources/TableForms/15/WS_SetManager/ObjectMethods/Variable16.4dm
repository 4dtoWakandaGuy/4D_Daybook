If (False:C215)
	//object Name: [USER]WS_SetManager.Variable16
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
	//ARRAY TEXT(GEN_at_Identity;0)
	C_LONGINT:C283(<>DB_at_TableNamesMacro)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Variable16"; Form event code:C388)
If (GEN_at_Identity=0)
	GEN_at_Identity:=1
End if 
<>DB_at_TableNamesMacro:=GEN_at_Identity-1
Record_BarSrch
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Variable16"; $_t_oldMethodName)
