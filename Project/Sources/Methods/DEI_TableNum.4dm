//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_TableNum
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
	ARRAY TEXT:C222($_at_TempAllTables; 0)
	C_LONGINT:C283($_l_TableRow; $0)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_TableNum")

If (Count parameters:C259>0)
	$_t_TableName:=$1
	
	ARRAY TEXT:C222($_at_TempAllTables; 0)
	DEI_Tables2Array(->$_at_TempAllTables)
	
	$_l_TableRow:=Find in array:C230($_at_TempAllTables; $_t_TableName)
	
	If ($_l_TableRow>0)
		$0:=$_l_TableRow
	End if 
	
	ARRAY TEXT:C222($_at_TempAllTables; 0)
End if 
ERR_MethodTrackerReturn("DEI_TableNum"; $_t_oldMethodName)