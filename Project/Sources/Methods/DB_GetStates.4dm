//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetStates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/01/2011 16:44 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	ARRAY TEXT:C222($_at_RecordStateCodes; 0)
	ARRAY TEXT:C222($_at_RecordStateNames; 0)
	//ARRAY TEXT(DB_at_StatesCodes;0)
	//ARRAY TEXT(DB_at_StatesNames;0)
	C_BOOLEAN:C305(<>StatesLoaded; DB_bo_StatesReady)
	C_LONGINT:C283($_l_arraySize; $_l_index; $_l_StateCodePosition; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetStates")

If (Not:C34(<>StatesLoaded))
	States_Load
End if 

If (Count parameters:C259>=2)
	
	
	$_l_arraySize:=Size of array:C274(<>SYS_at_RecStateNames{$2})
	
	ARRAY TEXT:C222($_at_RecordStateNames; $_l_arraySize)
	For ($_l_index; 1; Size of array:C274(<>SYS_at_RecStateNames{$2}))
		
		$_at_RecordStateNames{$_l_index}:=<>SYS_at_RecStateNames{$2}{$_l_index}
	End for 
	
	ARRAY TEXT:C222($_at_RecordStateCodes; $_l_arraySize)
	For ($_l_index; 1; Size of array:C274(<>SYS_at_RecStateCodes{$2}))
		$_at_RecordStateCodes{$_l_index}:=<>SYS_at_RecStateCodes{$2}{$_l_index}
		
	End for 
	
	If (Size of array:C274($_at_RecordStateCodes)>=3) & ($2=Table:C252(->[ORDERS:24]))
		
		
		
		DELETE FROM ARRAY:C228($_at_RecordStateCodes; 1; 1)
		DELETE FROM ARRAY:C228($_at_RecordStateCodes; 1; 1)
		DELETE FROM ARRAY:C228($_at_RecordStateNames; 1; 1)
		DELETE FROM ARRAY:C228($_at_RecordStateNames; 1; 1)
	End if 
	$_l_StateCodePosition:=Find in array:C230($_at_RecordStateCodes; "")
	If ($_l_StateCodePosition>0)
		DELETE FROM ARRAY:C228($_at_RecordStateCodes; $_l_StateCodePosition)
		DELETE FROM ARRAY:C228($_at_RecordStateNames; $_l_StateCodePosition)
	End if 
	VARIABLE TO VARIABLE:C635($1; DB_at_StatesNames; $_at_RecordStateNames; DB_at_StatesCodes; $_at_RecordStateCodes)
	
	SET PROCESS VARIABLE:C370($1; DB_bo_StatesReady; True:C214)
	
End if 
ERR_MethodTrackerReturn("DB_GetStates"; $_t_oldMethodName)