//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ArrayDiFF
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
	ARRAY BOOLEAN:C223($_abo_ModA; 0)
	ARRAY BOOLEAN:C223($_abo_ModB; 0)
	ARRAY LONGINT:C221($_al_DataA; 0)
	ARRAY LONGINT:C221($_al_DataB; 0)
	ARRAY LONGINT:C221($_al_DownVector; 0)
	ARRAY LONGINT:C221($_al_UpVector; 0)
	C_LONGINT:C283($_l_DataALength; $_l_DataBLength; $_l_MaxLength)
	C_POINTER:C301($_ptr_A; $_ptr_B; $_ptr_DataA; $_ptr_DataB; $_ptr_DeletedA; $_ptr_InsertedB; $_ptr_StartA; $_ptr_StartB; $1; $2; $3)
	C_POINTER:C301($4; $5; $6)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ArrayDiFF")

$_ptr_A:=$1
$_ptr_B:=$2
$_ptr_StartA:=$3
$_ptr_StartB:=$4
$_ptr_DeletedA:=$5
$_ptr_InsertedB:=$6

ARRAY LONGINT:C221($_al_DataA; 0)
ARRAY LONGINT:C221($_al_DataB; 0)

$_ptr_DataA:=->$_al_DataA
$_ptr_DataB:=->$_al_DataB

DB_DIFFCODE($_ptr_A; $_ptr_DataA)
DB_DIFFCODE($_ptr_B; $_ptr_DataB)

$_l_DataALength:=Size of array:C274($_ptr_DataA->)+1
$_l_DataBLength:=Size of array:C274($_ptr_DataB->)+1

ARRAY BOOLEAN:C223($_abo_ModA; $_l_DataALength-1)
ARRAY BOOLEAN:C223($_abo_ModB; $_l_DataBLength-1)

$_l_MaxLength:=$_l_DataALength+$_l_DataBLength+1

ARRAY LONGINT:C221($_al_DownVector; (2*$_l_MaxLength)+2)
ARRAY LONGINT:C221($_al_UpVector; (2*$_l_MaxLength)+2)

DB_DIFFLCS($_ptr_DataA; ->$_abo_ModA; 0; $_l_DataALength; $_ptr_DataB; ->$_abo_ModB; 0; $_l_DataBLength; ->$_al_DownVector; ->$_al_UpVector)

DB_DIFFOPTIMISE($_ptr_DataA; ->$_abo_ModA)
DB_DIFFOPTIMISE($_ptr_DataB; ->$_abo_ModB)

DB_DIFFList($_ptr_DataA; ->$_abo_ModA; $_ptr_DataB; ->$_abo_ModB; $_ptr_StartA; $_ptr_StartB; $_ptr_DeletedA; $_ptr_InsertedB)
ERR_MethodTrackerReturn("DB_ArrayDiFF"; $_t_oldMethodName)