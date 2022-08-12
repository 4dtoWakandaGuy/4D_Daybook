//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_EnableTableTrigger
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	_O_C_INTEGER:C282($i_tablenum)
	//Array LONGINT(<>DB_al_TriggerTable;0)
	C_POINTER:C301($1; $p_Array2populate)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_EnableTableTrigger")

If (Count parameters:C259>0)
	$p_Array2populate:=$1
	If (Not:C34(Is nil pointer:C315($p_Array2populate)))
		$i_tablenum:=Table:C252($p_Array2populate)
		If (Size of array:C274(<>DB_al_TriggerTable)>=$i_tablenum)
			<>DB_al_TriggerTable{$i_tablenum}:=0
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_EnableTableTrigger"; $_t_oldMethodName)