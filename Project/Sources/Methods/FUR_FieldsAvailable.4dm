//%attributes = {}
If (False:C215)
	//Project Method Name:      FUR_FieldsAvailable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 18:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_TableNumber; $_l_TablePosition)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FUR_FieldsAvailable")

//NG This method does one thing
//it checks if further fields area avaiable for a table  passed in $1
Load_Fields

If (Count parameters:C259>=1)
	
	$_l_TableNumber:=Table:C252($1)
	$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
	If ($_l_TablePosition>0)
		$0:=(<>SYS_al_TableUniqueField{$_l_TableNumber}#0)
	Else 
		$0:=False:C215
	End if 
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("FUR_FieldsAvailable"; $_t_oldMethodName)