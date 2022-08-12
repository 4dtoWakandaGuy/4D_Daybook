//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DIFFList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/12/2010 11:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $_bo_Equal)
	C_LONGINT:C283($_l_DataLengthA; $_l_DataLengthB; $_l_LineA; $_l_LineB; $_l_StartA; $_l_StartB)
	C_POINTER:C301($_ptr_DataA; $_ptr_DataB; $_ptr_DeletedA; $_ptr_InsertedB; $_ptr_ModA; $_ptr_ModB; $_ptr_StartA; $_ptr_StartB; $1; $2; $3)
	C_POINTER:C301($4; $5; $6; $7; $8)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DIFFList")
// ----------------------------------------------------
// User name (OS): ddancy
// Date and time: 18/02/08, 13:33:23
// ----------------------------------------------------
// Method: _DIFF_DiffList
// Description
//
//
// Parameters
// ----------------------------------------------------

$_ptr_DataA:=$1
$_ptr_ModA:=$2
$_ptr_DataB:=$3
$_ptr_ModB:=$4
$_ptr_StartA:=$5
$_ptr_StartB:=$6
$_ptr_DeletedA:=$7
$_ptr_InsertedB:=$8


$_l_DataLengthA:=Size of array:C274($_ptr_DataA->)+1
$_l_DataLengthB:=Size of array:C274($_ptr_DataB->)+1

$_l_LineA:=0
$_l_LineB:=0

DB_DIffArrayResize($_ptr_StartA; 0)
DB_DIffArrayResize($_ptr_StartB; 0)
DB_DIffArrayResize($_ptr_DeletedA; 0)
DB_DIffArrayResize($_ptr_InsertedB; 0)


While (($_l_LineA<$_l_DataLengthA) | ($_l_LineB<$_l_DataLengthB))
	$_bo_Equal:=True:C214
	
	If (($_l_LineA<$_l_DataLengthA) & ($_l_LineB<$_l_DataLengthB))
		
		If ((Not:C34($_ptr_ModA->{$_l_LineA})) & (Not:C34($_ptr_ModB->{$_l_LineB})))
			//lines are equal
			$_l_LineA:=$_l_LineA+1
			$_l_LineB:=$_l_LineB+1
			
		Else 
			$_bo_Equal:=False:C215
			
		End if 
		
	Else 
		$_bo_Equal:=False:C215
		
	End if 
	
	If (Not:C34($_bo_Equal))
		$_l_StartA:=$_l_LineA
		$_l_StartB:=$_l_LineB
		
		$_bo_Continue:=True:C214
		While ($_bo_Continue)
			If ($_l_LineA<$_l_DataLengthA)
				If (($_l_LineB>=$_l_DataLengthB) | ($_ptr_ModA->{$_l_LineA}))
					$_l_LineA:=$_l_LineA+1
				Else 
					$_bo_Continue:=False:C215
				End if 
			Else 
				$_bo_Continue:=False:C215
			End if 
		End while 
		
		$_bo_Continue:=True:C214
		While ($_bo_Continue)
			If ($_l_LineB<$_l_DataLengthB)
				If (($_l_LineA>=$_l_DataLengthA) | ($_ptr_ModB->{$_l_LineB}))
					$_l_LineB:=$_l_LineB+1
				Else 
					$_bo_Continue:=False:C215
				End if 
			Else 
				$_bo_Continue:=False:C215
			End if 
		End while 
		
		If (($_l_StartA<$_l_LineA) | ($_l_StartB<$_l_LineB))
			APPEND TO ARRAY:C911($_ptr_StartA->; $_l_StartA+1)
			APPEND TO ARRAY:C911($_ptr_StartB->; $_l_StartB+1)
			APPEND TO ARRAY:C911($_ptr_DeletedA->; ($_l_LineA-$_l_StartA))
			APPEND TO ARRAY:C911($_ptr_InsertedB->; ($_l_LineB-$_l_StartB))
		End if 
		
	End if 
	
End while 
ERR_MethodTrackerReturn("DB_DIFFList"; $_t_oldMethodName)