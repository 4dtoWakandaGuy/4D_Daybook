If (False:C215)
	//object Name: [DOCUMENTS]Report_in.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].Report_in.Variable6"; Form event code:C388)
If (<>DB_at_TableNames>0)
	[DOCUMENTS:7]Table_Number:11:=<>DB_al_TableNums{<>DB_at_TableNames}
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].Report_in.Variable6"; $_t_oldMethodName)
