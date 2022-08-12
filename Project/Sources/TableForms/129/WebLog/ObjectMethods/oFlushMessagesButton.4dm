If (False:C215)
	//object Name: [WEBSETUP_4D]WebLog.Variable2315
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
	C_BOOLEAN:C305(<>IWS_bo_MessageLogging; DB_bo_NoLoad)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebLog.Variable2315"; Form event code:C388)
Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		If (<>IWS_bo_MessageLogging)
			OBJECT SET ENABLED:C1123(Self:C308->; True:C214)
		Else 
			OBJECT SET ENABLED:C1123(Self:C308->; False:C215)
		End if 
	: (Form event code:C388=On Clicked:K2:4) & (<>IWS_bo_MessageLogging)
		
		IWS_SendToLog("Flushing messages to disk..."; True:C214)
End case 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebLog.Variable2315"; $_t_oldMethodName)
