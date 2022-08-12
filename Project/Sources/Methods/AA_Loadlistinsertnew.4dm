//%attributes = {}

If (False:C215)
	//Project Method Name:      AA_Loadlistinsertnew
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; DB_t_Methodname)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_Loadlistinsertnew")

// AA_LoadListInsertNew
// 01/12/03
// inserts two elements at end of array to add new option
// parameters: $1 = pointer to the list ID number array
//                     $2 = pointer to the list string array
DB_t_Methodname:=Current method name:C684
$_t_oldMethodName:=ERR_MethodTracker("AA_Loadlistinsertnew")
If (Count parameters:C259>=2)
	//INSERT ELEMENT($1->;99999999;2)
	//INSERT ELEMENT($2->;99999999;2)
	//$2->{(Size of array($2->))-1}:="-"
	//$2->{Size of array($2->)}:="New Entry"
	
	If (GenValidatePointer($1)) & (GenValidatePointer($2))
		RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_t_VariableName#"")
			If ($_t_VariableName[[1]]="◊") | (Position:C15("<>"; $_t_VariableName)=1)
				//This is an interProcess_Array
				While (Semaphore:C143("Inserting"+$_t_VariableName))
					DelayTicks
				End while 
			End if 
			APPEND TO ARRAY:C911($1->; 0)
			APPEND TO ARRAY:C911($1->; 0)
			APPEND TO ARRAY:C911($2->; "-")
			APPEND TO ARRAY:C911($2->; "New Entry")
			If ($_t_VariableName[[1]]="◊") | (Position:C15("<>"; $_t_VariableName)=1)
				//This is an interProcess_Array
				CLEAR SEMAPHORE:C144("Inserting"+$_t_VariableName)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("AA_Loadlistinsertnew"; $_t_oldMethodName)
