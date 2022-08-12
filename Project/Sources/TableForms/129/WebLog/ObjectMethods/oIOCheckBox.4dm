If (False:C215)
	//object Name: [WEBSETUP_4D]WebLog.Check Box2
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
	C_BOOLEAN:C305(<>LOG_bo_IOLogging; DB_bo_NoLoad)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebLog.Check Box2"; Form event code:C388)
// Axel 5-30-01  reflect state on load from startup file
Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		GEN_cb_6:=Num:C11(<>LOG_bo_IOLogging)
		
	: (Form event code:C388=On Clicked:K2:4)
		<>LOG_bo_IOLogging:=(Self:C308->=1)
End case 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebLog.Check Box2"; $_t_oldMethodName)
