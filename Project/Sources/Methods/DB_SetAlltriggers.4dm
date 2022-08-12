//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetAlltriggers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/02/2010 11:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TriggerTable;0)
	C_BOOLEAN:C305(<>DB_bo_Triggersintited)
	C_LONGINT:C283($_l_CountTables; $_l_CurrentTableNumber; $_l_EnableTriggers; $_l_SetTable; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetAlltriggers")
//$1 pass 1 to enable triggers (default is 1 any way so don't have to pass value)
//pass $1 0to disable triggers
//NG June 2007 to make log in faster I am changing the usage of ◊DB_TriggerTable the value will be 0 for enabled triggers and -1 for disabled
//So pass-1 in $1 to disable them

If (Count parameters:C259>0)
	$_l_EnableTriggers:=$1
Else 
	$_l_EnableTriggers:=0
End if 
$_l_SetTable:=0
If (Count parameters:C259>=2)
	$_l_SetTable:=$2
End if 
$_l_CountTables:=Get last table number:C254
While (Semaphore:C143("AlteringTriggers"))
	DelayTicks(2)
End while 
If ($_l_SetTable=0)
	ARRAY LONGINT:C221(<>DB_al_TriggerTable; 0)
	If ($_l_EnableTriggers=-1)
		ARRAY LONGINT:C221(<>DB_al_TriggerTable; $_l_CountTables)
		For ($_l_CurrentTableNumber; 1; $_l_CountTables)
			<>DB_al_TriggerTable{$_l_CurrentTableNumber}:=$_l_EnableTriggers
		End for 
	Else 
		ARRAY LONGINT:C221(<>DB_al_TriggerTable; $_l_CountTables)
	End if 
	<>DB_bo_Triggersintited:=True:C214
Else 
	If (Not:C34(<>DB_bo_Triggersintited))
		DB_SetAlltriggers
	End if 
	If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_SetTable)
		<>DB_al_TriggerTable{$_l_SetTable}:=$_l_EnableTriggers
	End if 
End if 
CLEAR SEMAPHORE:C144("AlteringTriggers")
ERR_MethodTrackerReturn("DB_SetAlltriggers"; $_t_oldMethodName)