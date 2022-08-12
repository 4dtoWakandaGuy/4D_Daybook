If (False:C215)
	//object Name: [PERSONNEL_GROUPS]Groups_In.Variable16
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
	C_LONGINT:C283(Vno2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL_GROUPS].Groups_In.Variable16"; Form event code:C388)
If (<>DB_at_TableNames>0)
	vNo2:=<>DB_at_TableNames
	PersonGr_InLPNo(Vno2)
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL_GROUPS].Groups_In.Variable16"; $_t_oldMethodName)
