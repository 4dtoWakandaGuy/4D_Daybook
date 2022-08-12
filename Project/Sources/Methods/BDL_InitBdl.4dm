//%attributes = {}
If (False:C215)
	//Project Method Name:      BDL_InitBdl
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY INTEGER:C220($_ai_BundleTypes; 0)
	ARRAY LONGINT:C221($_al_BundleOffsets; 0)
	ARRAY LONGINT:C221($_al_BundleSizes; 0)
	//ARRAY TEXT(BDL_at_BundleName;0)
	C_LONGINT:C283($_l_NameArrOffset; $_l_offset; $_l_OffsetArrOffset; $_l_SizeArrOffset; $_l_TypeArrOffset)
	C_POINTER:C301($_ptr_BundleBLOB; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BDL_InitBdl")

//******************************************************************************
//
//Method: BDL_InitBdl


//Purpose: Initialises a BLOb bundle, preparing it for storing data
//
//$1 - pointer to a BLOb

//******************************************************************************



$_ptr_BundleBLOB:=$1

SET BLOB SIZE:C606($_ptr_BundleBLOB->; 0)
INSERT IN BLOB:C559($_ptr_BundleBLOB->; $_l_offset; 3)
$_ptr_BundleBLOB->{0}:=Character code:C91("B")
$_ptr_BundleBLOB->{1}:=Character code:C91("D")
$_ptr_BundleBLOB->{2}:=Character code:C91("L")

ARRAY TEXT:C222(BDL_at_BundleName; 0)  //needs to be process var so we can use binary search
ARRAY INTEGER:C220($_ai_BundleTypes; 0)
ARRAY LONGINT:C221($_al_BundleOffsets; 0)
ARRAY LONGINT:C221($_al_BundleSizes; 0)

$_l_NameArrOffset:=BLOB size:C605($_ptr_BundleBLOB->)
VARIABLE TO BLOB:C532(BDL_at_BundleName; $_ptr_BundleBLOB->; *)
$_l_TypeArrOffset:=BLOB size:C605($_ptr_BundleBLOB->)
VARIABLE TO BLOB:C532($_ai_BundleTypes; $_ptr_BundleBLOB->; *)
$_l_OffsetArrOffset:=BLOB size:C605($_ptr_BundleBLOB->)
VARIABLE TO BLOB:C532($_al_BundleOffsets; $_ptr_BundleBLOB->; *)
$_l_SizeArrOffset:=BLOB size:C605($_ptr_BundleBLOB->)
VARIABLE TO BLOB:C532($_al_BundleSizes; $_ptr_BundleBLOB->; *)

LONGINT TO BLOB:C550($_l_NameArrOffset; $_ptr_BundleBLOB->; 0; *)
LONGINT TO BLOB:C550($_l_TypeArrOffset; $_ptr_BundleBLOB->; 0; *)
LONGINT TO BLOB:C550($_l_OffsetArrOffset; $_ptr_BundleBLOB->; 0; *)
LONGINT TO BLOB:C550($_l_SizeArrOffset; $_ptr_BundleBLOB->; 0; *)
ERR_MethodTrackerReturn("BDL_InitBdl"; $_t_oldMethodName)
