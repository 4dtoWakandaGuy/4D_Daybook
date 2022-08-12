//%attributes = {}
If (False:C215)
	//Project Method Name:      Userset Empty
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Userset Empty")
DB_t_Methodname:=Current method name:C684
If (Count parameters:C259>=1)
	If (GenValidatePointer($1))
		RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_l_TableNumber>0)
			CREATE EMPTY SET:C140($1->; "Userset")
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Userset Empty"; $_t_oldMethodName)