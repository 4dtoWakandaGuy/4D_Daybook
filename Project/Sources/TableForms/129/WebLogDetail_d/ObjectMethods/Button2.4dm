If (False:C215)
	//object Name: [WEBSETUP_4D]WebLogDetail_d.Button2
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
	C_LONGINT:C283($ProcessNumber)
	C_TEXT:C284($_t_oldMethodName; LOG_s_ProcessName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebLogDetail_d.Button2"; Form event code:C388)
$ProcessNumber:=Process number:C372(LOG_s_ProcessName)
BRING TO FRONT:C326($ProcessNumber)
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebLogDetail_d.Button2"; $_t_oldMethodName)