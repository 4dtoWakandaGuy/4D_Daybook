If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.oRunReminders
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283(PER_l_RunReminders; PER_l_ShowSchedule; PER_l_ShowWorkflow)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.oRunReminders"; Form event code:C388)
If (PER_l_RunReminders=1)
	[PERSONNEL:11]Startup_Diary:16:=4
Else 
	[PERSONNEL:11]Startup_Diary:16:=0
End if 
If (PER_l_ShowSchedule=1)
	[PERSONNEL:11]Startup_Diary:16:=[PERSONNEL:11]Startup_Diary:16+1
End if 
If (PER_l_ShowWorkflow=1)
	[PERSONNEL:11]Startup_Diary:16:=[PERSONNEL:11]Startup_Diary:16+2
End if 
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.oRunReminders"; $_t_oldMethodName)