If (False:C215)
	//object Name: [DIARY]Diary_ListT.Variable8
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_ListT.Variable8"; Form event code:C388)
vTHours3:=Time:C179(Time string:C180(Vt1*<>SYS_ti_DefaultTimeUnits))
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_ListT.Variable8"; $_t_oldMethodName)