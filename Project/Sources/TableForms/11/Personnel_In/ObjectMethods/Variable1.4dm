If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array Text(MOD_at_ModuleStartName;0)
	C_REAL:C285(PER_at_ViewTables)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.Variable1"; Form event code:C388)
[PERSONNEL:11]Start_Module:29:=""
MOD_at_ModuleStartName:=0
PER_at_ViewTables:=0
[PERSONNEL:11]HomeTable:52:=0
ERR_MethodTrackerReturn("OBJ:Personnel_In,BClear"; $_t_oldMethodName)