If (False:C215)
	//object Name: [DIARY]JobPers_TRSub.Variable1
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
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>SYS_ti_DefaultTimeUnits)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].JobPers_TRSub.Variable1"; Form event code:C388)
vHours:=Time:C179(Time string:C180([DIARY:12]Units:20*<>SYS_ti_DefaultTimeUnits))
ERR_MethodTrackerReturn("OBJ [DIARY].JobPers_TRSub.Variable1"; $_t_oldMethodName)