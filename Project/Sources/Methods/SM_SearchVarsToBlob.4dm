//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_SearchVarsToBlob
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldNumber; $_l_index; $_l_TableNumber)
	C_POINTER:C301($1; $10; $11; $12; $13; $14; $15; $16; $17; $18; $19)
	C_POINTER:C301($2; $20; $21; $22; $23; $24; $25; $26; $27; $28; $29)
	C_POINTER:C301($3; $30; $31; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_SearchVarsToBlob")
//This method will APPEND the blob in $1 with the variable name and value of the values in pointers
For ($_l_index; 2; Count parameters:C259)
	RESOLVE POINTER:C394(${$_l_index}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	TEXT TO BLOB:C554($_t_VariableName; $1->; 2; *)
	LONGINT TO BLOB:C550($_l_TableNumber; $1->; 0; *)
	LONGINT TO BLOB:C550($_l_FieldNumber; $1->; 0; *)
	VARIABLE TO BLOB:C532(${$_l_index}->; $1->; *)
End for 
ERR_MethodTrackerReturn("SM_SearchVarsToBlob"; $_t_oldMethodName)