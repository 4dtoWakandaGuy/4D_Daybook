//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_ListLoad
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 19:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(<>IME_at_NamedSelections;0)
	//ARRAY TEXT(<IME_at_NamedSelections;0)
	C_BOOLEAN:C305(<>IME_bo_NamedSelectionsInited; $0)
	C_LONGINT:C283($_l_NamedSelectionRow; $_l_TableNumber)
	C_POINTER:C301($_ptr_table)
	C_TEXT:C284($_t_NamedSelection; $_t_oldMethodName; $_t_TableName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_ListLoad")
// IME_ListLoad
//C_TEXT($1;$2)
//C_BOOLEAN($0)
//$0:=IME_ListLoad2($1;$2)

// Combined into 1 method 22/04/02 pb
// IME_ListLoad2
If (Not:C34(<>IME_bo_NamedSelectionsInited))
	IME_ImitMSlists
End if 
Load_Fields
$_t_TableName:=$1
$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName)
If ($_l_TableNumber>0)
	$_ptr_table:=Table:C252(<>DB_al_TableNums{$_l_TableNumber})
	$_t_NamedSelection:="<>"+String:C10(<>DB_al_TableNums{$_l_TableNumber})+"/"+$2
	$_l_NamedSelectionRow:=Find in array:C230(<>IME_at_NamedSelections; $_t_NamedSelection)
	If ($_l_NamedSelectionRow>0)
		USE NAMED SELECTION:C332($_t_NamedSelection)
		$0:=True:C214
	Else 
		$0:=False:C215
	End if 
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("IME_ListLoad"; $_t_oldMethodName)