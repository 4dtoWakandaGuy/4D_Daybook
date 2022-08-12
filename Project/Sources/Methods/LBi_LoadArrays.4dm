//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_LoadArrays
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
	C_BOOLEAN:C305($_bo_Auto; $3)
	C_LONGINT:C283($_l_Column; $_l_DIfference; $_l_FieldNum2; $_l_Index; $_l_NumberofRows; $_l_Size; $_l_TableNumber; $_l_TableNumber2)
	C_POINTER:C301($_ptr_Array; $_ptr_Field; $_ptr_FieldPointer; $_ptr_Table; $_ptr_Table2; $1; $2; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_LoadArrays")

//NG 19/7/06 this method is a direct replacement for ALLoadArrays

//ALLoadArrays
If (Count parameters:C259>2)
	$_bo_Auto:=$3
	If ($_bo_Auto)
		SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
	End if 
Else 
	$_bo_Auto:=True:C214
	SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
End if 
If (Count parameters:C259>=4)
	$_ptr_Table:=$4
	$_l_TableNumber:=Table:C252($1->{1})
	$_ptr_Table2:=(Table:C252($_l_TableNumber))
Else 
	$_l_TableNumber:=Table:C252($1->{1})
	
	$_ptr_Table:=(Table:C252($_l_TableNumber))
	$_ptr_Table2:=(Table:C252($_l_TableNumber))
	
End if 


$_l_NumberofRows:=Size of array:C274($1->)

//or ALMinOf (Size of array($1»);Size of array($2»))
//but they'd never get out of synch
//NB: reinstate this if used in other, dodgy situations
//ARRAY POINTER($1»;$_l_NumberofRows)
//ARRAY POINTER($2»;$_l_NumberofRows)
Case of 
	: (Table:C252($_ptr_Table)#Table:C252($_ptr_Table2))  //the first column is not in the parent table
		$_l_Size:=0
		COPY NAMED SELECTION:C331($_ptr_Table->; "$Current")
		For ($_l_Index; 1; $_l_NumberofRows)
			$_ptr_Field:=$1->{$_l_Index}
			$_ptr_Array:=$2->{$_l_Index}
			If ((Table:C252($_ptr_Field))#Table:C252($_ptr_Table))  //Field is from a different table
				$_l_TableNumber2:=Table:C252($_ptr_Field)
				$_l_FieldNum2:=Field:C253($_ptr_Field)
				GenFindByRelation(Table:C252($_ptr_Table); $1; $_l_Index; $2)
				USE NAMED SELECTION:C332("$Current")
			Else 
				SELECTION TO ARRAY:C260($_ptr_Field->; $_ptr_Array->)
				USE NAMED SELECTION:C332("$Current")
			End if 
			If (Size of array:C274(($_ptr_Array)->)>$_l_Size)
				$_l_Size:=Size of array:C274(($_ptr_Array)->)
			End if 
		End for 
		For ($_l_Index; 1; $_l_NumberofRows)
			If (Size of array:C274(($2->{$_l_Index})->)>$_l_Size)
				$_l_DIfference:=$_l_Size-Size of array:C274(($2->{$_l_Index})->)
				DELETE FROM ARRAY:C228(($2->{$_l_Index})->; $_l_Size; $_l_DIfference)
			End if 
		End for 
		For ($_l_Index; 1; $_l_NumberofRows)
			$_ptr_Array:=$2->{$_l_Index}
			If (Size of array:C274($_ptr_Array->)<$_l_Size)
				$_l_DIfference:=$_l_Size-Size of array:C274($_ptr_Array->)
				INSERT IN ARRAY:C227($_ptr_Array->; $_l_Size; $_l_DIfference)
			End if 
		End for 
	Else 
		
		For ($_l_Column; 1; $_l_NumberofRows)
			$_ptr_FieldPointer:=$1->{$_l_Column}
			$_ptr_Array:=$2->{$_l_Column}
			SELECTION TO ARRAY:C260($_ptr_FieldPointer->; $_ptr_Array->; *)
		End for 
		SELECTION TO ARRAY:C260
		
End case 
$_l_Size:=0

For ($_l_Index; 1; $_l_NumberofRows)
	If (Size of array:C274(($2->{$_l_Index})->)>$_l_Size)
		$_l_Size:=Size of array:C274(($2->{$_l_Index})->)
	End if 
End for 
For ($_l_Index; 1; $_l_NumberofRows)
	If (Size of array:C274(($2->{$_l_Index})->)<$_l_Size)
		$_l_DIfference:=$_l_Size-Size of array:C274(($2->{$_l_Index})->)
		INSERT IN ARRAY:C227(($2->{$_l_Index})->; $_l_Size; $_l_DIfference)
	End if 
End for 
If ($_bo_Auto)
	SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
End if 
ERR_MethodTrackerReturn("LBi_LoadArrays"; $_t_oldMethodName)