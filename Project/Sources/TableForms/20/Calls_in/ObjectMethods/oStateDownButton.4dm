If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.Variable17
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_StateCodes;0)
	//ARRAY TEXT(SVS_at_StatesNames;0)
	C_LONGINT:C283($_l_StateRow)
	C_TEXT:C284($_t_oldMethodName; SVS_t_StateName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.Variable17"; Form event code:C388)
SVS_StateDown(->[SERVICE_CALLS:20]Table_State:29; ->SVS_t_StateName; ->[SERVICE_CALLS:20]Resolved:9)
$_l_StateRow:=Find in array:C230(SVS_at_StateCodes; [SERVICE_CALLS:20]Table_State:29)
If ($_l_StateRow>0)
	SVS_at_StatesNames:=$_l_StateRow
Else 
	SVS_at_StatesNames:=0
End if 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.Variable17"; $_t_oldMethodName)
