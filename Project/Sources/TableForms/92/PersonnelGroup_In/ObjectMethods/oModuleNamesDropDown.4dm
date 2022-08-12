If (False:C215)
	//object Name: [PERSONNEL_GROUPS]Groups_In.Variable1
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
	//Array Text(MOD_at_ModuleStartName;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL_GROUPS].Groups_In.Variable1"; Form event code:C388)
If (MOD_at_ModuleStartName>0)
	[PERSONNEL_GROUPS:92]Start_Module:4:=MOD_at_ModuleStartName{MOD_at_ModuleStartName}
Else 
	[PERSONNEL_GROUPS:92]Start_Module:4:=""
End if 
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [PERSONNEL_GROUPS].Groups_In.Variable1"; $_t_oldMethodName)