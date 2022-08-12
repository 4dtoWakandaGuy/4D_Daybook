If (False:C215)
	//Project Form Method Name:      TestObjectAlignment
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(TST_l_NextTest; $_l_Event; TST_l_NextTest)
	C_REAL:C285(MType)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM TestObjectAlignment"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ALL RECORDS:C47([INVOICES:39])
		TST_l_NextTest:=1
		MType:=1
		
End case 
ERR_MethodTrackerReturn("FM TestObjectAlignment"; $_t_oldMethodName)
