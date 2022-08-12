//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_CalculatedColumnTEXT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/11/2014 17:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Event; $_l_FieldNumber; $_l_TableNumber)
	C_OBJECT:C1216($_obj_CalculatedProperties)
	C_TEXT:C284($_t_oldMethodName; $_T_OutputText; $_t_VariableName2; $0; $1; $2; $3; $4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_CalculatedColumnTEXT")

If (False:C215)
	
Else 
	//$_obj_CalculatedProperties:=
	$_T_OutputText:=""
	LB_CalculatedColumnANY($1; $2; $3; $4; Is text:K8:3; ->$_T_OutputText)
	$0:=$_T_OutputText
	
End if 
ERR_MethodTrackerReturn("LB_CalculatedColumnTEXT"; $_t_oldMethodName)
