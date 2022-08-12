//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DIFFSynchronize
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/12/2010 11:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DeleteA; 0)
	ARRAY LONGINT:C221($_al_InsertB; 0)
	ARRAY LONGINT:C221($_al_StartA; 0)
	ARRAY LONGINT:C221($_al_StartB; 0)
	C_LONGINT:C283($_l_ChangeCount; $_l_ChangeIndex; $_l_ChangeIndex2; $_l_ColoursIndex; $_l_DeletedColour; $_l_InsertA; $_l_InsertB; $_l_InsertedColour; $_l_LineCount; $_l_LineCountA; $_l_LineCountB)
	C_LONGINT:C283($_l_NormalColour; $10; $11; $12)
	C_POINTER:C301($_ptr_A; $_ptr_b; $_ptr_ColoursArray; $_ptr_DelatedA; $_ptr_InsertedB; $_ptr_LinesA; $_ptr_LinesB; $_ptr_StartA; $_ptr_StartB; $1; $2)
	C_POINTER:C301($3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DIFFSynchronize")
// ----------------------------------------------------
// User name (OS): ddancy
// Date and time: 22/04/08, 18:35:20
// ----------------------------------------------------
// Method: _DIFF_Synchronise
// Description
// Synchronise arrays A and B after doing a diff on them
//
// Parameters
// ----------------------------------------------------


$_ptr_A:=$1
$_ptr_b:=$2
$_ptr_StartA:=$3
$_ptr_StartB:=$4
$_ptr_DelatedA:=$5
$_ptr_InsertedB:=$6
$_ptr_LinesA:=$7
$_ptr_LinesB:=$8
If (Count parameters:C259>8)
	$_ptr_ColoursArray:=$9
End if 
If (Count parameters:C259>9)
	$_l_NormalColour:=$10
Else 
	$_l_NormalColour:=-255
End if 
If (Count parameters:C259>10)
	$_l_InsertedColour:=$11
Else 
	$_l_InsertedColour:=0x00E02D42  //0x00FF8800
End if 
If (Count parameters:C259>11)
	$_l_DeletedColour:=$12
Else 
	$_l_DeletedColour:=0x002702F5  //0xEE44
End if 

//************************************************
// Setup tasks
//************************************************

$_l_LineCountA:=Size of array:C274($_ptr_A->)
$_l_LineCountB:=Size of array:C274($_ptr_b->)

For ($_l_ColoursIndex; 0; $_l_LineCountA; $_l_LineCountA)
	DB_DIffArrayResize($_ptr_LinesA; $_l_ColoursIndex)
End for 

For ($_l_ColoursIndex; 0; $_l_LineCountB; $_l_LineCountB)
	DB_DIffArrayResize($_ptr_LinesB; $_l_ColoursIndex)
End for 

For ($_l_ColoursIndex; 1; $_l_LineCountA)
	$_ptr_LinesA->{$_l_ColoursIndex}:=$_l_ColoursIndex
End for 

For ($_l_ColoursIndex; 1; $_l_LineCountB)
	$_ptr_LinesB->{$_l_ColoursIndex}:=$_l_ColoursIndex
End for 

ARRAY LONGINT:C221($_al_StartA; 0)
ARRAY LONGINT:C221($_al_StartB; 0)
ARRAY LONGINT:C221($_al_DeleteA; 0)
ARRAY LONGINT:C221($_al_InsertB; 0)

COPY ARRAY:C226($_ptr_StartA->; $_al_StartA)
COPY ARRAY:C226($_ptr_StartB->; $_al_StartB)
COPY ARRAY:C226($_ptr_DelatedA->; $_al_DeleteA)
COPY ARRAY:C226($_ptr_InsertedB->; $_al_InsertB)

//************************************************
// Synchronise A and B
//************************************************

$_l_ChangeCount:=Size of array:C274($_al_StartA)

For ($_l_ChangeIndex; 1; $_l_ChangeCount)
	
	If ($_al_DeleteA{$_l_ChangeIndex}>0)
		$_l_InsertB:=$_al_StartA{$_l_ChangeIndex}
		INSERT IN ARRAY:C227($_ptr_b->; $_l_InsertB; $_al_DeleteA{$_l_ChangeIndex})
		INSERT IN ARRAY:C227($_ptr_LinesB->; $_l_InsertB; $_al_DeleteA{$_l_ChangeIndex})
		$_al_StartA{$_l_ChangeIndex}:=$_al_StartA{$_l_ChangeIndex}+$_al_DeleteA{$_l_ChangeIndex}
	End if 
	
	If ($_al_InsertB{$_l_ChangeIndex}>0)
		$_l_InsertA:=$_al_StartA{$_l_ChangeIndex}
		INSERT IN ARRAY:C227($_ptr_A->; $_l_InsertA; $_al_InsertB{$_l_ChangeIndex})
		INSERT IN ARRAY:C227($_ptr_LinesA->; $_l_InsertA; $_al_InsertB{$_l_ChangeIndex})
		$_al_StartB{$_l_ChangeIndex}:=$_al_StartB{$_l_ChangeIndex}+$_al_InsertB{$_l_ChangeIndex}
	End if 
	
	For ($_l_ChangeIndex2; $_l_ChangeIndex+1; $_l_ChangeCount)
		$_al_StartA{$_l_ChangeIndex2}:=$_al_StartA{$_l_ChangeIndex2}+$_al_InsertB{$_l_ChangeIndex}
		$_al_StartB{$_l_ChangeIndex2}:=$_al_StartB{$_l_ChangeIndex2}+$_al_DeleteA{$_l_ChangeIndex}
	End for 
	
End for 

If (Not:C34(Is nil pointer:C315($_ptr_ColoursArray)))
	$_l_LineCount:=Size of array:C274($_ptr_A->)
	DB_DIffArrayResize($_ptr_ColoursArray; $_l_LineCount)
	
	For ($_l_ColoursIndex; 1; $_l_LineCount)
		$_ptr_ColoursArray->{$_l_ColoursIndex}:=$_l_NormalColour  //default background colour
		
		If ($_ptr_LinesA->{$_l_ColoursIndex}=0)  //it's a deletion
			$_ptr_ColoursArray->{$_l_ColoursIndex}:=$_l_DeletedColour
		End if 
		
		If ($_ptr_LinesB->{$_l_ColoursIndex}=0)  //it's an insert
			$_ptr_ColoursArray->{$_l_ColoursIndex}:=$_l_InsertedColour
		End if 
		
	End for 
End if 
ERR_MethodTrackerReturn("DB_DIFFSynchronize"; $_t_oldMethodName)