If (False:C215)
	//object Name: [WEBSETUP_4D]WebLogDetail_d.Variable6
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
	//Array TEXT(LOG_at_MethodNames;0)
	C_LONGINT:C283($ProcessNumber)
	C_TEXT:C284($_t_oldMethodName; LOG_s_ProcessName; LOG_s_ProcessState)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebLogDetail_d.Variable6"; Form event code:C388)
$ProcessNumber:=Process number:C372(LOG_s_ProcessName)
GET PROCESS VARIABLE:C371($ProcessNumber; LOG_at_MethodNames; LOG_at_MethodNames)
LOG_s_ProcessState:=UTI_ProcessState($ProcessNumber)
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebLogDetail_d.Variable6"; $_t_oldMethodName)