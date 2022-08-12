//%attributes = {}
If (False:C215)
	//Project Method Name:      UnloadAllRecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 09:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_TableIndex)
	C_POINTER:C301($_ptr_Table; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UnloadAllRecords")
//$1 ptr to table (if unload all records for just one table else it will unload
//records for all tables if you leave if blank)
If (Count parameters:C259=0)
	For ($_l_TableIndex; 1; Get last table number:C254)
		If (Is table number valid:C999($_l_TableIndex))
			$_ptr_Table:=Table:C252($_l_TableIndex)
			REDUCE SELECTION:C351($_ptr_Table->; 0)
			UNLOAD RECORD:C212($_ptr_Table->)
		End if 
	End for 
Else 
	$_ptr_Table:=$1
	REDUCE SELECTION:C351($_ptr_Table->; 0)
	UNLOAD RECORD:C212($_ptr_Table->)
End if 
ERR_MethodTrackerReturn("UnloadAllRecords"; $_t_oldMethodName)
