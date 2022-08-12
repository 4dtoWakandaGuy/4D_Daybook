//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_Setup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array Text(<>SV_at_FieldName1;0)
	//ARRAY LONGINT(<>SV_al_Calc3;0)
	//ARRAY LONGINT(<>SV_al_Calc4;0)
	//ARRAY LONGINT(<>SV_al_Field3;0)
	//ARRAY LONGINT(<>SV_al_Field4;0)
	//ARRAY LONGINT(<>SV_al_TableNums;0)
	C_BOOLEAN:C305(<>Stats_bo_Arraysinited)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_Setup")
While (Semaphore:C143("$InitingStatsView"))
	DelayTicks
End while 
If (Not:C34(<>Stats_bo_Arraysinited))
	ARRAY LONGINT:C221(<>SV_al_TableNums; 0)
	ARRAY TEXT:C222(<>SV_at_FieldName1; 0)
	ARRAY LONGINT:C221(<>SV_al_Field3; 0)
	ARRAY LONGINT:C221(<>SV_al_Field4; 0)
	ARRAY LONGINT:C221(<>SV_al_Calc3; 0)
	ARRAY LONGINT:C221(<>SV_al_Calc4; 0)
End if 
CLEAR SEMAPHORE:C144("$InitingStatsView")

<>Stats_bo_Arraysinited:=True:C214
ERR_MethodTrackerReturn("StatsView_Setup"; $_t_oldMethodName)