//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_GetInputValue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2011 22:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DB_at_Formvalues;0)
	//ARRAY TEXT(DB_at_Formvariables;0)
	C_LONGINT:C283($_l_FormVariableRow)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_GetInputValue")


$_l_FormVariableRow:=Find in array:C230(DB_at_Formvariables; $1)
If ($_l_FormVariableRow#-1)
	$0:=DB_at_Formvalues{$_l_FormVariableRow}
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("DBWS_GetInputValue"; $_t_oldMethodName)