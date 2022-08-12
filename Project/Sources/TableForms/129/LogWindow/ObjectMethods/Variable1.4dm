If (False:C215)
	//object Name: [WEBSETUP_4D]LogWindow.Variable1
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
	C_BOOLEAN:C305(<>SCPT_bo_LogMacro; <>SCPT_bo_LogText; <>SQL_bo_LogCommand; <>SQL_bo_LogSelect; $_bo_ActionStatus)
	C_TEXT:C284($_t_oldMethodName; LOG_t_LogType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].LogWindow.Variable1"; Form event code:C388)


$_bo_ActionStatus:=(Self:C308->=1)

Case of 
		
	: (LOG_t_LogType="GetMacro")
		
		<>SCPT_bo_LogMacro:=$_bo_ActionStatus
		
	: (LOG_t_LogType="MacroText")
		
		<>SCPT_bo_LogText:=$_bo_ActionStatus
		
	: (LOG_t_LogType="LogSQL")
		
		<>SQL_bo_LogCommand:=$_bo_ActionStatus
		
	: (LOG_t_LogType="LogSELECT")
		
		<>SQL_bo_LogSelect:=$_bo_ActionStatus
		
End case 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].LogWindow.Variable1"; $_t_oldMethodName)
