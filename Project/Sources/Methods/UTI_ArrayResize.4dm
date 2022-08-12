//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_ArrayResize
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
	C_LONGINT:C283($_l_ArrayCurrentSIze; $_l_FieldNumber; $_l_Index; $_l_NewSize; $_l_Resizeby; $_l_TableNumber; $1)
	C_POINTER:C301($_ptr_Array; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_ArrayResize")
DB_t_Methodname:=Current method name:C684
//Method: UTI_ArrayResize

//Purpose: Resizes an array or arrays
//
//$1 - longint, new array size
//${2} - pointer(s) to array(s)
//

If (Count parameters:C259>=2)
	$_l_NewSize:=$1
	For ($_l_Index; 2; Count parameters:C259)
		$_ptr_Array:=${$_l_Index}
		If (GenValidatePointer($_ptr_Array))
			RESOLVE POINTER:C394($_ptr_Array; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			If ($_t_VariableName#"")
				If ($_t_VariableName[[1]]="◊") | (Position:C15("<>"; $_t_VariableName)=1)
					//This is an interProcess_Array
					While (Semaphore:C143("$Accessing"+$_t_VariableName))
						DelayTicks
					End while 
				End if 
			End if 
			
			$_l_ArrayCurrentSIze:=Size of array:C274($_ptr_Array->)
			$_l_Resizeby:=$_l_NewSize-$_l_ArrayCurrentSIze
			Case of 
				: ($_l_Resizeby>0)
					
					
					INSERT IN ARRAY:C227($_ptr_Array->; $_l_ArrayCurrentSIze+1; $_l_Resizeby)
				: ($_l_Resizeby<0)
					DELETE FROM ARRAY:C228($_ptr_Array->; $_l_NewSize+1; Abs:C99($_l_Resizeby))
			End case 
			If ($_t_VariableName[[1]]="◊") | (Position:C15("<>"; $_t_VariableName)=1)
				//This is an interProcess_Array
				CLEAR SEMAPHORE:C144("$Accessing"+$_t_VariableName)
			End if 
			
		End if 
		
	End for 
End if 

//LOG_ResetMethod
ERR_MethodTrackerReturn("UTI_ArrayResize"; $_t_oldMethodName)