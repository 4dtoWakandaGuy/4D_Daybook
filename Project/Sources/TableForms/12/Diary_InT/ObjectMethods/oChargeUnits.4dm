If (False:C215)
	//object Name: [DIARY]Diary_inT.Field23
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vDontAutoCalcTimeUnits)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_inT.Field23"; Form event code:C388)

//******************************** added 22/05/07 -kmw ********************************
If (Form event code:C388=On Data Change:K2:15)
	vDontAutoCalcTimeUnits:=True:C214
End if 
//********************************************************************************
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_inT.Field23"; $_t_oldMethodName)