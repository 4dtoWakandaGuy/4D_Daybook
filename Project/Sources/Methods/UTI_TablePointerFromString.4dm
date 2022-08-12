//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_TablePointerFromString
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
	C_LONGINT:C283($_l_TableIndex; $_l_TableINumber)
	C_POINTER:C301($_ptr_Table; $0)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_TablePointerFromString")
//UTI_TablePointerFromString
//Rollo 8/10/2004

//Return a pointer to a table based on "TABLE NAME" or "[TABLE NAME]" input

Load_Fields

If (Count parameters:C259>=1)
	$_t_TableName:=$1
	
	If ($_t_TableName="[@")
		$_t_TableName:=Substring:C12($_t_TableName; 2; Length:C16($_t_TableName)-2)
	End if 
	
	$_l_TableIndex:=DB_GetTableNumFromNameString($_t_TableName)
	
	If ($_l_TableIndex>0)
		
		$_l_TableINumber:=<>DB_al_TableNums{$_l_TableIndex}
		
		If ($_l_TableINumber>0)
			
			$_ptr_Table:=Table:C252($_l_TableINumber)
			
		End if 
	Else 
		Gen_Alert("Invalid call to UTI_TablePointerFromString")
	End if 
Else 
	Gen_Alert("UTI_TablePointer called with no parameters")
End if 

$0:=$_ptr_Table
ERR_MethodTrackerReturn("UTI_TablePointerFromString"; $_t_oldMethodName)
