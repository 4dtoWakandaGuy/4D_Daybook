If (False:C215)
	//object Name: [USER]WS_SetManager.Variable5
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
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(WS_at_TableNames;0)
	C_LONGINT:C283(WS_l_ContextTable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Variable5"; Form event code:C388)
If (WS_at_TableNames>0)
	//WS_l_ContextTable:=WS_al_TableIDs{WS_at_TableNames}  //<>DB_at_TableNames+1<--why was this array reference plus 1???
	//NG as WS_l_ContextTable is used nowhere else is seems this has no point???
End if 
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Variable5"; $_t_oldMethodName)
